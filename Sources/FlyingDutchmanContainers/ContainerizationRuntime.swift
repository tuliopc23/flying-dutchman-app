import Foundation
import Containerization
import ContainerizationOCI
import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanNetworking
import NIOTransportServices
import NIOCore
import SystemPackage
import Logging

/// Runtime implementation using Apple's Containerization framework
/// This provides lightweight VMs per container (OrbStack-style architecture)
public actor ContainerizationRuntime: ContainerRuntime {
    private let logger = Loggers.make(category: "flyingdutchman.containerization")
    private let containerStore = ContainerStore()
    private let imageStore = ImageStore()
    
    // NIO Transport
    private let group = NIOTSEventLoopGroup(loopCount: 1)
    private let vsockConnector: VSOCKConnector
    
    // Active State
    private var activeContainers: [UUID: LinuxContainer] = [:]
    private var controlPlanes: [UUID: Channel] = [:]
    
    // Kernel path - will be configurable later
    private let kernelPath: FilePath
    
    public init(kernelPath: FilePath? = nil) {
        // Default to bundled kernel or downloaded Kata kernel
        self.kernelPath = kernelPath ?? Self.defaultKernelPath()
        self.vsockConnector = VSOCKConnector(group: self.group)
    }
    
    // MARK: - ContainerRuntime Protocol
    
    public var name: String { "Apple Containerization (VSOCK)" }
    
    public func listContainers() async throws -> [ContainerSummary] {
        // Return containers from GRDB, sync with active VMs
        let stored = await containerStore.fetchAll()
        
        // Update status based on active VMs
        return stored.map { container in
            var updated = container
            if activeContainers[container.id] != nil {
                updated.status = .running
            } else if updated.status == .running {
                // VM is gone but DB says running - mark as stopped
                updated.status = .stopped
            }
            return updated
        }
    }
    
    public func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary {
        logger.info("Creating container \(name) from image \(image)")
        
        // Parse image reference
        let imageRef = try parseImageReference(image)
        
        // Check if image exists locally, pull if needed
        let imageSummary = try await ensureImage(imageRef)
        
        // Create container record
        let container = ContainerSummary(
            name: name,
            image: image,
            status: .stopped,
            ports: config.ports ?? []
        )
        
        // Persist to GRDB
        try await containerStore.insert(container)
        
        logger.info("Container \(container.id) created successfully")
        return container
    }
    
    public func startContainer(id: UUID) async throws -> ContainerSummary {
        guard let container = try await containerStore.fetch(id: id) else {
            throw ContainerError.notFound(id)
        }
        
        guard container.status == .stopped else {
            throw ContainerError.invalidState("Container is not stopped")
        }
        
        logger.info("Starting container \(container.id)")
        
        // Create rootfs from OCI image
        let rootfsPath = try await prepareRootFS(for: container)
        
        // Create VM configuration
        let vmConfig = LinuxVMConfiguration(
            kernelPath: kernelPath,
            rootfsPath: rootfsPath,
            cpuCount: 2,  // TODO: Make configurable
            memorySize: 512 * 1024 * 1024  // 512MB default
        )
        
        // Create and start the VM
        let linuxContainer = try LinuxContainer(configuration: vmConfig)
        try await linuxContainer.start()
        
        // Store active container reference
        activeContainers[container.id] = linuxContainer
        
        // Connect VSOCK Control Plane
        // TODO: Get actual CID from linuxContainer.contextID when available in framework
        let cid = UInt32(3) 
        
        do {
            let channel = try await vsockConnector.connect(cid: cid, port: 1024)
            controlPlanes[id] = channel
            logger.info("Control plane connected for \(id) on CID \(cid)")
            
            // Send initial ping
            try await channel.writeAndFlush(ControlPlaneCommand.ping)
        } catch {
            logger.error("Failed to connect control plane: \(error)")
            // We continue execution, but logs won't work
        }
        
        // Update container status
        var updated = container
        updated.status = .running
        try await containerStore.update(updated)
        
        logger.info("Container \(container.id) started successfully")
        return updated
    }
    
    public func stopContainer(id: UUID) async throws -> ContainerSummary {
        guard let container = try await containerStore.fetch(id: id) else {
            throw ContainerError.notFound(id)
        }
        
        guard let linuxContainer = activeContainers[container.id] else {
            throw ContainerError.invalidState("Container VM not found")
        }
        
        logger.info("Stopping container \(container.id)")
        
        // Try graceful stop via VSOCK
        if let channel = controlPlanes[id] {
            try? await channel.writeAndFlush(ControlPlaneCommand.stop)
            try? await channel.close()
        }
        
        // Force stop the VM
        try await linuxContainer.stop()
        
        // Cleanup state
        activeContainers.removeValue(forKey: container.id)
        controlPlanes.removeValue(forKey: container.id)
        
        // Update container status
        var updated = container
        updated.status = .stopped
        try await containerStore.update(updated)
        
        logger.info("Container \(container.id) stopped successfully")
        return updated
    }
    
    public func removeContainer(id: UUID) async throws {
        // Ensure container is stopped
        if let container = try await containerStore.fetch(id: id), container.status == .running {
            _ = try await stopContainer(id: id)
        }
        
        // Remove from database
        try await containerStore.delete(id: id)
        
        // Clean up rootfs
        try await cleanupRootFS(for: id)
        
        logger.info("Container \(id) removed")
    }
    
    public func getContainerLogs(id: UUID) async throws -> AsyncStream<String> {
        guard let channel = controlPlanes[id] else {
            // If VM is running but control plane isn't, we can't stream logs yet
            if activeContainers[id] != nil {
                throw ContainerError.invalidState("Control plane connecting...")
            }
            throw ContainerError.notFound(id)
        }
        
        return AsyncStream { continuation in
            let handler = LogStreamHandler(continuation: continuation)
            
            // Dynamically add the log handler to the pipeline
            channel.pipeline.addHandler(handler).whenFailure { error in
                logger.error("Failed to attach log stream: \(error)")
                continuation.finish()
            }
        }
    }
    
    public func pullImage(reference: String) async throws -> ImageSummary {
        let imageRef = try parseImageReference(reference)
        
        logger.info("Pulling image \(imageRef.name):\(imageRef.tag)")
        
        // Use ContainerizationOCI to pull the image
        let registry = try OCIRegistry(url: imageRef.registry)
        let manifest = try await registry.pullManifest(name: imageRef.name, tag: imageRef.tag)
        
        // Download layers
        for layer in manifest.layers {
            logger.info("Downloading layer \(layer.digest)")
            _ = try await registry.pullBlob(digest: layer.digest)
        }
        
        // Create image record
        let image = ImageSummary(
            name: imageRef.name,
            tag: imageRef.tag,
            digest: manifest.config.digest,
            sizeBytes: manifest.layers.reduce(0) { $0 + $1.size }
        )
        
        try await imageStore.insert(image)
        
        logger.info("Image \(reference) pulled successfully")
        return image
    }
    
    public func listImages() async throws -> [ImageSummary] {
        await imageStore.fetchAll()
    }
    
    // MARK: - Private Helpers
    
    private func parseImageReference(_ reference: String) throws -> ImageReference {
        let parts = reference.split(separator: ":")
        let name = String(parts[0])
        let tag = parts.count > 1 ? String(parts[1]) : "latest"
        
        return ImageReference(
            registry: "docker.io",
            name: name,
            tag: tag
        )
    }
    
    private func ensureImage(_ ref: ImageReference) async throws -> ImageSummary {
        if let existing = try await imageStore.fetch(name: ref.name, tag: ref.tag) {
            return existing
        }
        return try await pullImage(reference: "\(ref.name):\(ref.tag)")
    }
    
    private func prepareRootFS(for container: ContainerSummary) async throws -> FilePath {
        let rootfsDir = Self.containerRootFSPath(for: container.id)
        
        // Create directory if needed
        try FileManager.default.createDirectory(
            atPath: rootfsDir.string,
            withIntermediateDirectories: true
        )
        
        // Locate the image layers in Persistence
        // In a real implementation, we'd iterate over image.layers and extract them
        // For now we assume the base system is bootstrapped or single-layer
        logger.info("Preparing rootfs at \(rootfsDir)")
        
        return rootfsDir
    }
    
    private func extractTar(at tarPath: FilePath, to destination: FilePath) async throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/tar")
        process.arguments = ["-xf", tarPath.string, "-C", destination.string]
        try process.run()
        process.waitUntilExit()
        
        if process.terminationStatus != 0 {
            throw ContainerError.extractionFailed(tarPath.string)
        }
    }
    
    private func cleanupRootFS(for containerID: UUID) async throws {
        let rootfsDir = Self.containerRootFSPath(for: containerID)
        try FileManager.default.removeItem(atPath: rootfsDir.string)
    }
    
    private static func defaultKernelPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        let kernelURL = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("kernel")
            .appendingPathComponent("vmlinux")
        
        return FilePath(kernelURL.path)
    }
    
    private static func containerRootFSPath(for id: UUID) -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        let containerDir = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("containers")
            .appendingPathComponent(id.uuidString)
            .appendingPathComponent("rootfs")
        
        return FilePath(containerDir.path)
    }
}

// MARK: - Supporting Types

private struct ImageReference {
    let registry: String
    let name: String
    let tag: String
}

private struct LinuxVMConfiguration {
    let kernelPath: FilePath
    let rootfsPath: FilePath
    let cpuCount: Int
    let memorySize: Int
}

enum ContainerError: LocalizedError {
    case notFound(UUID)
    case invalidState(String)
    case imageNotFound(String)
    case extractionFailed(String)
    
    var errorDescription: String? {
        switch self {
        case .notFound(let id):
            return "Container \(id) not found"
        case .invalidState(let message):
            return "Invalid state: \(message)"
        case .imageNotFound(let image):
            return "Image \(image) not found"
        case .extractionFailed(let path):
            return "Failed to extract archive at \(path)"
        }
    }
}
