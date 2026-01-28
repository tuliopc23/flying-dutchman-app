import Foundation
import NIOCore
import NIOPosix
import DNSClient
import Logging

public actor DNSServer {
    private let group: EventLoopGroup
    private let port: Int
    private let host: String
    private var channel: Channel?
    private let routingTable: DomainRoutingTable
    private let logger = Logger(label: "com.flyingdutchman.dns")

    public init(host: String = "127.0.0.1", port: Int = 5353, routingTable: DomainRoutingTable, group: EventLoopGroup? = nil) {
        self.host = host
        self.port = port
        self.routingTable = routingTable
        self.group = group ?? MultiThreadedEventLoopGroup(numberOfThreads: 1)
    }

    public func start() async throws {
        let bootstrap = DatagramBootstrap(group: group)
            .channelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .channelInitializer { channel in
                channel.pipeline.addHandler(DNSHandler(routingTable: self.routingTable, logger: self.logger))
            }

        let channel = try await bootstrap.bind(host: host, port: port).get()
        self.channel = channel
        logger.info("DNS Server listening on \(host):\(port)")
    }

    public func shutdown() async {
        try? await channel?.close()
        // If we created the group (implicit ownership assumption for simplicity in this context)
        // ideally we track if we own it.
    }
}

private final class DNSHandler: ChannelInboundHandler {
    typealias InboundIn = AddressedEnvelope<ByteBuffer>
    typealias OutboundOut = AddressedEnvelope<ByteBuffer>

    let routingTable: DomainRoutingTable
    let logger: Logger

    init(routingTable: DomainRoutingTable, logger: Logger) {
        self.routingTable = routingTable
        self.logger = logger
    }

    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let envelope = unwrapInboundIn(data)
        logger.warning("DNS Server received request but handling is stubbed due to API verification pending.")
        // TODO: Implement DNS Message decoding using correct DNSClient API
    }
}

// Helper extension if needed, but hoping DNSClient covers it.
// extension ARecord {
//    init?(_ string: String) { ... }
// }
