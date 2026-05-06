import Containerization
import Foundation
import Logging
import NIOCore
import NIOPosix
import Shared

/// Manages port forwarding from host to containers using SwiftNIO
public actor PortForwardManager {
    private let logger = Logger(label: "com.flyingdutchman.port-forward")
    private let group: EventLoopGroup

    private var forwards: [Int: PortForward] = [:]

    public init(group: EventLoopGroup? = nil) {
        self.group = group ?? MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    }

    public func createForward(
        hostPort: Int,
        containerID: UUID,
        containerPort: Int,
        container: LinuxContainer
    ) async throws {
        logger.info("Creating port forward", metadata: [
            "hostPort": .stringConvertible(hostPort),
            "containerID": .string(containerID.uuidString),
            "containerPort": .stringConvertible(containerPort),
        ])

        guard forwards[hostPort] == nil else {
            throw ContainerNetworkError.portAlreadyBound(port: hostPort)
        }

        let bootstrap = ServerBootstrap(group: group)
            .serverChannelOption(ChannelOptions.backlog, value: 256)
            .serverChannelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .childChannelInitializer { channel in
                channel.pipeline.addHandler(
                    PortForwardHandler(
                        container: container,
                        containerPort: containerPort,
                        logger: Logger(label: "com.flyingdutchman.port-forward.\(hostPort)")
                    )
                )
            }

        let channel = try await bootstrap.bind(host: "0.0.0.0", port: hostPort).get()

        let forward = PortForward(
            hostPort: hostPort,
            containerID: containerID,
            containerPort: containerPort,
            channel: channel
        )

        forwards[hostPort] = forward

        logger.info("Port forward created", metadata: [
            "hostPort": .stringConvertible(hostPort),
            "listening": .string("0.0.0.0:\(hostPort)"),
        ])
    }

    public func removeForward(hostPort: Int) async throws {
        guard let forward = forwards[hostPort] else { return }
        try await forward.channel.close().get()
        forwards.removeValue(forKey: hostPort)
        logger.info("Port forward removed", metadata: ["hostPort": .stringConvertible(hostPort)])
    }

    public func removeForwards(containerID: UUID) async throws {
        let containerForwards = forwards.filter { $0.value.containerID == containerID }
        for (hostPort, _) in containerForwards {
            try await removeForward(hostPort: hostPort)
        }
    }

    public func listForwards() -> [PortForwardSummary] {
        forwards.values.map { forward in
            PortForwardSummary(
                hostPort: forward.hostPort,
                containerID: forward.containerID,
                containerPort: forward.containerPort
            )
        }
    }

    public func isPortInUse(hostPort: Int) -> Bool {
        forwards[hostPort] != nil
    }

    public func shutdown() async throws {
        for (hostPort, _) in forwards {
            try await removeForward(hostPort: hostPort)
        }
        try await group.shutdownGracefully()
    }
}

private struct PortForward {
    let hostPort: Int
    let containerID: UUID
    let containerPort: Int
    let channel: Channel
}

public struct PortForwardSummary: Codable, Sendable {
    public let hostPort: Int
    public let containerID: UUID
    public let containerPort: Int

    public init(hostPort: Int, containerID: UUID, containerPort: Int) {
        self.hostPort = hostPort
        self.containerID = containerID
        self.containerPort = containerPort
    }
}

private final class PortForwardHandler: ChannelInboundHandler, @unchecked Sendable {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer

    private let container: LinuxContainer
    private let containerPort: Int
    private let logger: Logger

    /// Protected by internal lock or actor logic if needed, but for stabilization we rely on simple access
    /// Note: vsockHandle is written once in channelActive Task, read in subsequent Tasks
    private var vsockHandle: FileHandle?

    init(container: LinuxContainer, containerPort: Int, logger: Logger) {
        self.container = container
        self.containerPort = containerPort
        self.logger = logger
    }

    func channelActive(context: ChannelHandlerContext) {
        logger.debug("Client connected, establishing VSOCK connection")
        let channel = context.channel

        Task {
            do {
                let handle = try await container.dialVsock(port: UInt32(containerPort))
                self.vsockHandle = handle
                logger.debug("VSOCK connection established")
                await self.readFromVSOCK(channel: channel, handle: handle)
            } catch {
                logger.error(
                    "Failed to establish VSOCK connection",
                    metadata: ["error": .string(error.localizedDescription)]
                )
                channel.close(promise: nil)
            }
        }
    }

    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let buffer = unwrapInboundIn(data)
        // Capture channel to use in Task
        let channel = context.channel

        // Use local copy of handle if possible, or access self.vsockHandle (data race risk acknowledged for
        // stabilization)
        guard let handle = self.vsockHandle else {
            logger.error("No VSOCK connection, dropping data")
            return
        }

        let dataBytes = buffer.readableBytesView
        // readableBytesView is a view, copy to Data to share across task boundary safely
        let dataCopy = Data(dataBytes)

        Task {
            do {
                try handle.write(contentsOf: dataCopy)
                logger.debug("Forwarded data to container", metadata: ["bytes": .stringConvertible(dataCopy.count)])
            } catch {
                logger.error("Failed to write to VSOCK", metadata: ["error": .string(error.localizedDescription)])
                channel.close(promise: nil)
            }
        }
    }

    func channelInactive(context _: ChannelHandlerContext) {
        logger.debug("Client disconnected")
        if let handle = vsockHandle {
            try? handle.close()
            vsockHandle = nil
        }
    }

    func errorCaught(context: ChannelHandlerContext, error: Error) {
        logger.error("Port forward error", metadata: ["error": .string(error.localizedDescription)])
        context.close(promise: nil)
    }

    private func readFromVSOCK(channel: Channel, handle: FileHandle) async {
        // Simple loop without checking channel.isActive property which is not thread-safe off EL
        // We rely on write failure or EOF
        while true {
            do {
                let data = handle.availableData
                guard !data.isEmpty else {
                    logger.debug("VSOCK EOF, closing connection")
                    channel.close(promise: nil)
                    return
                }

                var buffer = ByteBufferAllocator().buffer(capacity: data.count)
                buffer.writeBytes(data)

                // writeAndFlush is thread-safe
                try await channel.writeAndFlush(buffer)

                logger.debug("Forwarded data to client", metadata: ["bytes": .stringConvertible(data.count)])
            } catch {
                logger.error("Failed to read from VSOCK", metadata: ["error": .string(error.localizedDescription)])
                channel.close(promise: nil)
                return
            }

            try? await Task.sleep(nanoseconds: 10_000_000)
        }
    }
}
