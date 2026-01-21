import Foundation
import NIOCore
import NIOPosix
import Containerization
import Logging

/// Manages port forwarding from host to containers using SwiftNIO
///
/// Creates TCP servers on host ports that proxy connections to container ports via VSOCK.
/// Supports multiple simultaneous port forwards and automatic cleanup.
///
/// ## Usage
///
/// ```swift
/// let manager = PortForwardManager()
///
/// // Create forward: localhost:8080 → container:80
/// try await manager.createForward(
///     hostPort: 8080,
///     containerID: containerID,
///     containerPort: 80,
///     container: linuxContainer
/// )
///
/// // Access via: curl localhost:8080
///
/// // Cleanup on container stop
/// try await manager.removeForwards(containerID: containerID)
/// ```
public actor PortForwardManager {
    private let logger = Logger(label: "com.flyingdutchman.port-forward")
    private let group: EventLoopGroup
    
    /// Active port forwards (host port -> forward info)
    private var forwards: [Int: PortForward] = [:]
    
    /// Initialize with optional custom event loop group
    public init(group: EventLoopGroup? = nil) {
        self.group = group ?? MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    }
    
    // MARK: - Public API
    
    /// Create port forward from host to container
    ///
    /// Binds a TCP server on the host port and proxies connections to the container port via VSOCK.
    ///
    /// - Parameters:
    ///   - hostPort: Port to bind on host (e.g., 8080)
    ///   - containerID: UUID of the container
    ///   - containerPort: Port inside container (e.g., 80)
    ///   - container: LinuxContainer instance for VSOCK connection
    /// - Throws: `NetworkError.portAlreadyBound` if host port in use
    public func createForward(
        hostPort: Int,
        containerID: UUID,
        containerPort: Int,
        container: LinuxContainer
    ) async throws {
        logger.info("Creating port forward", metadata: [
            "hostPort": .stringConvertible(hostPort),
            "containerID": .string(containerID.uuidString),
            "containerPort": .stringConvertible(containerPort)
        ])
        
        // Check if host port already in use
        guard forwards[hostPort] == nil else {
            throw NetworkError.portAlreadyBound(port: hostPort)
        }
        
        // Create TCP server on host port
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
            "listening": .string("0.0.0.0:\(hostPort)")
        ])
    }
    
    /// Remove specific port forward
    ///
    /// Closes the TCP server and cleans up resources.
    ///
    /// - Parameter hostPort: Host port to remove
    public func removeForward(hostPort: Int) async throws {
        guard let forward = forwards[hostPort] else {
            logger.debug("Port forward not found", metadata: [
                "hostPort": .stringConvertible(hostPort)
            ])
            return // Already removed
        }
        
        try await forward.channel.close().get()
        forwards.removeValue(forKey: hostPort)
        
        logger.info("Port forward removed", metadata: [
            "hostPort": .stringConvertible(hostPort)
        ])
    }
    
    /// Remove all port forwards for a container
    ///
    /// Called when container stops to clean up all associated port forwards.
    ///
    /// - Parameter containerID: UUID of the container
    public func removeForwards(containerID: UUID) async throws {
        let containerForwards = forwards.filter { $0.value.containerID == containerID }
        
        logger.info("Removing port forwards for container", metadata: [
            "containerID": .string(containerID.uuidString),
            "count": .stringConvertible(containerForwards.count)
        ])
        
        for (hostPort, _) in containerForwards {
            try await removeForward(hostPort: hostPort)
        }
    }
    
    /// List all active port forwards
    ///
    /// - Returns: Array of port forward summaries
    public func listForwards() -> [PortForwardSummary] {
        forwards.values.map { forward in
            PortForwardSummary(
                hostPort: forward.hostPort,
                containerID: forward.containerID,
                containerPort: forward.containerPort
            )
        }
    }
    
    /// Check if a host port is in use
    ///
    /// - Parameter hostPort: Port to check
    /// - Returns: true if port has an active forward
    public func isPortInUse(hostPort: Int) -> Bool {
        forwards[hostPort] != nil
    }
    
    /// Shutdown all port forwards and cleanup
    ///
    /// Called on daemon shutdown.
    public func shutdown() async throws {
        logger.info("Shutting down port forward manager", metadata: [
            "activeForwards": .stringConvertible(forwards.count)
        ])
        
        for (hostPort, _) in forwards {
            try await removeForward(hostPort: hostPort)
        }
        
        // Shutdown event loop group if we own it
        try await group.shutdownGracefully()
    }
}

// MARK: - Supporting Types

/// Internal representation of a port forward
private struct PortForward {
    let hostPort: Int
    let containerID: UUID
    let containerPort: Int
    let channel: Channel
}

/// Public summary of a port forward
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

// MARK: - NIO Channel Handler

/// NIO channel handler that proxies TCP connections to container via VSOCK
private final class PortForwardHandler: ChannelInboundHandler {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer
    
    private let container: LinuxContainer
    private let containerPort: Int
    private let logger: Logger
    private var vsockHandle: FileHandle?
    
    init(container: LinuxContainer, containerPort: Int, logger: Logger) {
        self.container = container
        self.containerPort = containerPort
        self.logger = logger
    }
    
    func channelActive(context: ChannelHandlerContext) {
        logger.debug("Client connected, establishing VSOCK connection")
        
        // Establish VSOCK connection to container
        Task {
            do {
                let handle = try await container.dialVsock(port: UInt16(containerPort))
                self.vsockHandle = handle
                
                logger.debug("VSOCK connection established")
                
                // Start reading from VSOCK and forwarding to client
                Task {
                    await self.readFromVSOCK(context: context, handle: handle)
                }
            } catch {
                logger.error("Failed to establish VSOCK connection", metadata: [
                    "error": .string(error.localizedDescription)
                ])
                context.close(promise: nil)
            }
        }
    }
    
    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let buffer = unwrapInboundIn(data)
        
        // Forward client data to container via VSOCK
        guard let handle = vsockHandle else {
            logger.error("No VSOCK connection, dropping data")
            return
        }
        
        let data = buffer.readableBytesView
        
        Task {
            do {
                try handle.write(contentsOf: data)
                logger.debug("Forwarded data to container", metadata: [
                    "bytes": .stringConvertible(data.count)
                ])
            } catch {
                logger.error("Failed to write to VSOCK", metadata: [
                    "error": .string(error.localizedDescription)
                ])
                context.close(promise: nil)
            }
        }
    }
    
    func channelInactive(context: ChannelHandlerContext) {
        logger.debug("Client disconnected")
        
        // Close VSOCK connection
        if let handle = vsockHandle {
            try? handle.close()
            vsockHandle = nil
        }
    }
    
    func errorCaught(context: ChannelHandlerContext, error: Error) {
        logger.error("Port forward error", metadata: [
            "error": .string(error.localizedDescription)
        ])
        context.close(promise: nil)
    }
    
    // MARK: - VSOCK Reading
    
    /// Read from VSOCK and forward to client
    private func readFromVSOCK(context: ChannelHandlerContext, handle: FileHandle) async {
        while context.channel.isActive {
            do {
                // Read available data from VSOCK
                let data = handle.availableData
                
                guard !data.isEmpty else {
                    logger.debug("VSOCK EOF, closing connection")
                    context.close(promise: nil)
                    return
                }
                
                // Forward to client
                var buffer = context.channel.allocator.buffer(capacity: data.count)
                buffer.writeBytes(data)
                context.writeAndFlush(wrapOutboundOut(buffer), promise: nil)
                
                logger.debug("Forwarded data to client", metadata: [
                    "bytes": .stringConvertible(data.count)
                ])
            } catch {
                logger.error("Failed to read from VSOCK", metadata: [
                    "error": .string(error.localizedDescription)
                ])
                context.close(promise: nil)
                return
            }
            
            // Small delay to prevent tight loop
            try? await Task.sleep(nanoseconds: 10_000_000) // 10ms
        }
    }
}

// MARK: - Errors

/// Networking errors
public enum NetworkError: Error, LocalizedError {
    case portAlreadyBound(port: Int)
    case vsockConnectionFailed(port: Int, underlying: Error)
    case portForwardFailed(String)
    
    public var errorDescription: String? {
        switch self {
        case .portAlreadyBound(let port):
            return "Port \(port) is already bound"
        case .vsockConnectionFailed(let port, let underlying):
            return "Failed to connect to container port \(port): \(underlying.localizedDescription)"
        case .portForwardFailed(let message):
            return "Port forward failed: \(message)"
        }
    }
}
