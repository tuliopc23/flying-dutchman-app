import NIOCore
import Foundation
import Shared

/// Groups the encoder and decoder into a single handler for convenience
public final class ControlPlaneCodec: ChannelDuplexHandler {
    public typealias InboundIn = ByteBuffer
    public typealias InboundOut = ControlPlaneEvent
    public typealias OutboundIn = ControlPlaneCommand
    public typealias OutboundOut = ByteBuffer

    private let decoder = ControlPlaneResponseDecoder()
    private let encoder = ControlPlaneRequestEncoder()

    public init() {}

    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        // Pass to decoder
        var buffer = self.unwrapInboundIn(data)
        do {
            try decoder.decode(context: context, buffer: &buffer)
        } catch {
            context.fireErrorCaught(error)
        }
    }

    public func write(context: ChannelHandlerContext, data: NIOAny, promise: EventLoopPromise<Void>?) {
        // Pass to encoder
        let command = self.unwrapOutboundIn(data)
        var buffer = context.channel.allocator.buffer(capacity: 1024)
        do {
            try encoder.encode(data: command, out: &buffer)
            context.write(self.wrapOutboundOut(buffer), promise: promise)
        } catch {
            promise?.fail(error)
        }
    }
}

/// Encodes Commands to length-prefixed JSON bytes
final class ControlPlaneRequestEncoder {
    func encode(data: ControlPlaneCommand, out: inout ByteBuffer) throws {
        let json = try JSONEncoder().encode(data)
        // Length prefix framing (4 bytes length + JSON body)
        out.writeInteger(UInt32(json.count))
        out.writeBytes(json)
    }
}

/// Decodes length-prefixed JSON bytes to Events
final class ControlPlaneResponseDecoder: ByteToMessageDecoder {
    typealias InboundOut = ControlPlaneEvent
    
    func decode(context: ChannelHandlerContext, buffer: inout ByteBuffer) throws -> DecodingState {
        // Wait for length header
        guard buffer.readableBytes >= 4 else { return .needMoreData }
        
        // Peek length without moving reader index yet
        guard let length = buffer.getInteger(at: buffer.readerIndex, as: UInt32.self) else { return .needMoreData }
        
        // Wait for full body
        guard buffer.readableBytes >= 4 + Int(length) else { return .needMoreData }
        
        // Commit to reading: Move reader past length
        buffer.moveReaderIndex(forwardBy: 4)
        
        // Read JSON body
        guard let data = buffer.readData(length: Int(length)) else { return .needMoreData }
        
        let event = try JSONDecoder().decode(ControlPlaneEvent.self, from: data)
        context.fireChannelRead(wrapInboundOut(event))
        return .continue
    }
}
