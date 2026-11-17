import Foundation
import Logging
import NIOCore
import NIOPosix
import Shared

public actor PortForwardManager {
    private let group: EventLoopGroup
    private let logger: Logger
    private var listeners: [Int: Channel] = [:]

    public init(group: EventLoopGroup, logger: Logger) {
        self.group = group
        self.logger = logger
    }

    @discardableResult
    public func startForwarding(hostPort: Int, containerIP: String, containerPort: Int) async throws -> Int {
        if let existing = listeners[hostPort] {
            logger.warning("Port \(hostPort) is already being forwarded")
            return existing.localAddress?.port ?? hostPort
        }

        let bootstrap = ServerBootstrap(group: group)
            .serverChannelOption(ChannelOptions.backlog, value: 256)
            .serverChannelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .childChannelInitializer { channel in
                channel.pipeline.addHandler(ProxyHandler(
                    group: self.group,
                    targetHost: containerIP,
                    targetPort: containerPort,
                    logger: self.logger
                ))
            }
            .childChannelOption(ChannelOptions.socketOption(.so_keepalive), value: 1)

        let channel = try await bootstrap.bind(host: "0.0.0.0", port: hostPort).get()

        guard let boundPort = channel.localAddress?.port else {
            try? await channel.close()
            throw NetworkingError.portBindingFailed(port: hostPort)
        }

        listeners[boundPort] = channel

        logger.info("Started port forwarding from 0.0.0.0:\(boundPort) to \(containerIP):\(containerPort)")
        return boundPort
    }

    public func stopForwarding(hostPort: Int) async {
        guard let channel = listeners[hostPort] else { return }
        try? await channel.close()
        listeners.removeValue(forKey: hostPort)
        logger.info("Stopped port forwarding on port \(hostPort)")
    }

    public func stopAll() async {
        for channel in listeners.values {
            try? await channel.close()
        }
        listeners.removeAll()
    }
}

private final class ProxyHandler: ChannelInboundHandler, @unchecked Sendable {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer

    private let group: EventLoopGroup
    private let targetHost: String
    private let targetPort: Int
    private let logger: Logger

    private var partnerChannel: Channel?
    private var pendingBytes: [ByteBuffer] = []
    private var isConnecting = false

    init(group: EventLoopGroup, targetHost: String, targetPort: Int, logger: Logger) {
        self.group = group
        self.targetHost = targetHost
        self.targetPort = targetPort
        self.logger = logger
    }

    func channelActive(context: ChannelHandlerContext) {
        isConnecting = true
        let clientChannel = context.channel
        let clientBootstrap = ClientBootstrap(group: context.eventLoop)
            .channelInitializer { backendChannel in
                backendChannel.pipeline.addHandler(BridgeHandler(partnerChannel: clientChannel, logger: self.logger))
            }

        clientBootstrap.connect(host: targetHost, port: targetPort).whenComplete { result in
            self.isConnecting = false
            switch result {
            case let .success(partner):
                self.partnerChannel = partner
                self.flushPending()
            case let .failure(error):
                self.logger.error("Failed to connect to backend \(self.targetHost):\(self.targetPort) - \(error)")
                clientChannel.close(promise: nil)
            }
        }
    }

    func channelRead(context _: ChannelHandlerContext, data: NIOAny) {
        let buffer = unwrapInboundIn(data)
        if let partner = partnerChannel, partner.isActive {
            partner.writeAndFlush(data, promise: nil)
        } else {
            pendingBytes.append(buffer)
        }
    }

    func channelInactive(context _: ChannelHandlerContext) {
        partnerChannel?.close(promise: nil)
    }

    private func flushPending() {
        guard let partner = partnerChannel else { return }
        for buffer in pendingBytes {
            partner.writeAndFlush(NIOAny(buffer), promise: nil)
        }
        pendingBytes.removeAll()
    }
}

private final class BridgeHandler: ChannelInboundHandler, @unchecked Sendable {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer

    private let partnerChannel: Channel
    private let logger: Logger

    init(partnerChannel: Channel, logger: Logger) {
        self.partnerChannel = partnerChannel
        self.logger = logger
    }

    func channelRead(context _: ChannelHandlerContext, data: NIOAny) {
        partnerChannel.writeAndFlush(data)
    }

    func channelInactive(context _: ChannelHandlerContext) {
        partnerChannel.close(promise: nil)
    }

    func errorCaught(context: ChannelHandlerContext, error: Error) {
        logger.error("Bridge handler error: \(error)")
        context.close(promise: nil)
    }
}
