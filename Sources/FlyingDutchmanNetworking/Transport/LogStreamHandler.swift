import NIOCore
import Foundation
import Shared

/// Bridges ControlPlaneEvents from the NIO pipeline to a Swift AsyncStream
public final class LogStreamHandler: ChannelInboundHandler, Sendable {
    public typealias InboundIn = ControlPlaneEvent
    
    private let continuation: AsyncStream<String>.Continuation
    
    public init(continuation: AsyncStream<String>.Continuation) {
        self.continuation = continuation
    }
    
    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let event = self.unwrapInboundIn(data)
        
        switch event {
        case .logLine(let line):
            continuation.yield(line)
        case .exit(let code):
            continuation.yield("Container exited with code: \(code)")
            continuation.finish()
        case .pong:
            break // Keep pongs internal to the protocol layer usually
        }
        
        // Pass the event down the pipeline in case other handlers (Status/State) need it
        context.fireChannelRead(data)
    }
    
    public func channelInactive(context: ChannelHandlerContext) {
        // Close the stream if the VSOCK connection dies
        continuation.finish()
        context.fireChannelInactive()
    }
    
    public func errorCaught(context: ChannelHandlerContext, error: Error) {
        continuation.yield("Stream error: \(error.localizedDescription)")
        continuation.finish()
        context.fireErrorCaught(error)
    }
}
