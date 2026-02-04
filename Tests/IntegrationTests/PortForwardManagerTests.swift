@testable import FlyingDutchmanNetworking
import Logging
import NIO
import XCTest

final class PortForwardManagerTests: XCTestCase {
    var group: MultiThreadedEventLoopGroup!
    var logger: Logger!
    var backend: Channel!
    var forwarder: PortForwardManager!

    override func setUp() async throws {
        group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        logger = Logger(label: "test.portforward")
        forwarder = PortForwardManager(group: group, logger: logger)
    }

    override func tearDown() async throws {
        await forwarder.stopAll()
        try? await backend?.close()
        try await group.shutdownGracefully()
    }

    func testPortForwarding() async throws {
        // 1. Start Backend Server (Echo)
        let backendBootstrap = ServerBootstrap(group: group)
            .childChannelInitializer { channel in
                channel.pipeline.addHandler(EchoHandler())
            }
            .serverChannelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)

        backend = try await backendBootstrap.bind(host: "127.0.0.1", port: 0).get()
        guard let backendPort = backend.localAddress?.port else {
            XCTFail("Backend did not bind")
            return
        }

        // 2. Start Forwarding
        // We forward from port 0 (random) to backend
        let forwardPort = try await forwarder.startForwarding(
            hostPort: 0,
            containerIP: "127.0.0.1",
            containerPort: backendPort
        )
        XCTAssertNotEqual(forwardPort, 0)
        XCTAssertNotEqual(forwardPort, backendPort)

        // 3. Connect Client to Forwarder
        let clientBootstrap = ClientBootstrap(group: group)
            .channelInitializer { channel in
                channel.pipeline.addHandler(ResponseCollector())
            }

        let client = try await clientBootstrap.connect(host: "127.0.0.1", port: forwardPort).get()

        // 4. Send Data
        var buffer = client.allocator.buffer(capacity: 12)
        buffer.writeString("Hello Proxy")
        try await client.writeAndFlush(buffer)

        // 5. Verify Response (wait a bit)
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5s

        let collector = try await client.pipeline.handler(type: ResponseCollector.self).get()
        XCTAssertEqual(collector.receivedData, "Hello Proxy")

        try await client.close()
    }
}

final class EchoHandler: ChannelInboundHandler {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer

    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        context.writeAndFlush(data, promise: nil)
    }
}

final class ResponseCollector: ChannelInboundHandler {
    typealias InboundIn = ByteBuffer
    var receivedData: String = ""

    func channelRead(context _: ChannelHandlerContext, data: NIOAny) {
        var buffer = unwrapInboundIn(data)
        if let string = buffer.readString(length: buffer.readableBytes) {
            receivedData += string
        }
    }
}
