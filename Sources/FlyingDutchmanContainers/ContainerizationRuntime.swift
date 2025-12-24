import Foundation
import Containerization
import ContainerizationOCI
import ContainerizationExtras
import Shared
import FlyingDutchmanPersistence
import NIOTransportServices
import NIOCore
import SystemPackage
import Logging
import AsyncHTTPClient

/// Runtime implementation using Apple's Containerization framework
/// This provides lightweight VMs per container (OrbStack-style architecture)
public actor ContainerizationRuntime: ContainerRuntimeProtocol {
    private let logger = Loggers.make(category: .containers)
    private let containerStore = ContainerStore()
    private let imageStore = ImageStore()
    
    // NIO Transport
    private let group = NIOTSEventLoopGroup(loopCount: 1)
    private let httpClient: HTTPClient
    
    // Container Manager - handles lifecycle via Apple's framework
    private var containerManager: ContainerManager?
    
    // Active State - maps our UUIDs to LinuxContainers
    private var activeContainers: [UUID: LinuxContainer] = [:]
    
    // Kernel configuration
    private let kernelPath: FilePath
    private let initfsReference: String
    
    public init(
        kernelPath: FilePath? = nil,
        initfsReference: String = "ghcr.io/apple/containerization/vminit:0.13.0"
    ) {
        self.kernelPath = kernelPath ?? Self.defaultKernelPath()
        self.initfsReference = initfsReference
        self.httpClient = HTTPClient(eventLoopGroupProvider: .shared(self.group))
    }
    
    // MARK: - Container Manager Setup
    
    /// Lazily initialize the ContainerManager
    private func ensureManager() async throws -> ContainerManager {
        if let manager = self.containerManager {
            return manager
        }
        
        // Validate kernel exists
        guard FileManager.default.fileExists(atPath: kernelPath.string) else {
            throw EngineError.kernelNotFound(path: kernelPath.string)
        }
        
        let kernel = try Kernel(
            path: URL(fileURLWithPath: kernelPath.string),
            platform: .linuxArm
        )
        
        logger.info("Initializing ContainerManager with kernel at \(kernelPath.string)")
        
        let manager = try await ContainerManager(
            kernel: kernel,
            initfsReference: initfsReference
        )
        
        self.containerManager = manager
        logger.info("ContainerManager initialized successfully")
        
        return manager
    }
    
    /// Reconcile runtime state with persisted state on engine startup
    /// This ensures that if the engine crashed, we mark containers as stopped
    public func reconcileState() async throws {
        logger.info("Reconciling container state on startup")
        
        // Get all containers from persistence
        let storedContainers = await containerStore.fetchAll()
        
        // Clear active containers map - we'll rebuild it from actual VM state
        var reconciled = 0
        for container in storedContainers {
            if container.status == .running && activeContainers[container.id] == nil {
                // Container was running but VM is gone - mark as stopped
                var updated = container
                updated.status = .stopped
                try await containerStore.update(updated)
                reconciled += 1
                logger.info("Reconciled container \(container.id): running -> stopped")
            }
        }
        
        if reconciled > 0 {
            logger.info("Reconciled \(reconciled) container(s) on startup")
        } else {
            logger.info("No state reconciliation needed")
        }
    }
    
    // MARK: - ContainerRuntime Protocol
    
    public nonisolated var name: String { "Apple Containerization" }
    
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
        _ = try await ensureImage(imageRef)
        
        // Create container record (but don't start VM yet)
        let container = ContainerSummary(
            name: name,
            image: image,
            status: .stopped,
            ports: config.ports ?? []
        )
        
        // Persist to GRDB
        try await containerStore.insert(container)
        
        // Store container config for later use (when starting)
        try await storeContainerConfig(containerID: container.id, config: config)
        
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
        
        // Load container config
        let config = try await loadContainerConfig(containerID: container.id)
        
        // Compute resource limits
        let cpuCount = computeCPUCount(from: config.cpuLimit)
        let memoryBytes = computeMemorySize(from: config.memoryLimit)
        
        logger.info("Container \(container.id) configured with \(cpuCount) CPUs, \(memoryBytes / (1024 * 1024))MB memory")
        
        // Get ContainerManager
        var manager = try await ensureManager()
        
        // Create the LinuxContainer via ContainerManager
        let linuxContainer = try await manager.create(container.name, reference: container.image) { cfg in
            cfg.cpus = cpuCount
            cfg.memoryInBytes = UInt64(memoryBytes)
            
            // Set process arguments if specified
            if let cmd = config.command, !cmd.isEmpty {
                cfg.process.arguments = cmd
            }
        }
        
        // Phase 1: Boot VM and guest agent (vminitd)
        logger.info("Booting VM for container \(container.id)")
        try await linuxContainer.create()
        
        // Phase 2: Start the container process
        logger.info("Starting container process for \(container.id)")
        try await linuxContainer.start()
        
        // Store active container reference
        activeContainers[container.id] = linuxContainer
        
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
        
        // Stop the container (this shuts down the VM)
        try await linuxContainer.stop()
        
        // Cleanup state
        activeContainers.removeValue(forKey: container.id)
        
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
        
        // Clean up rootfs and config
        try await cleanupContainerData(for: id)
        
        logger.info("Container \(id) removed")
    }
    
    public func getContainerLogs(id: UUID) async throws -> AsyncStream<String> {
        guard let linuxContainer = activeContainers[id] else {
            if try await containerStore.fetch(id: id) != nil {
                throw ContainerError.invalidState("Container is not running")
            }
            throw ContainerError.notFound(id)
        }
        
        // Use VSOCK to communicate with vminitd for logs
        return AsyncStream { continuation in
            Task {
                do {
                    // Connect to vminitd on port 1024
                    let handle = try await linuxContainer.dialVsock(port: 1024)
                    
                    // TODO: Implement log streaming protocol with vminitd
                    // For now, yield a placeholder
                    continuation.yield("[Log streaming via vminitd - implementation pending]")
                    continuation.finish()
                    
                    _ = handle // Keep handle alive
                } catch {
                    self.logger.error("Failed to connect to vminitd for logs: \(error)")
                    continuation.yield("[Error: Could not connect to container logs]")
                    continuation.finish()
                }
            }
        }
    }
    
    public func pullImage(reference: String) async throws -> ImageSummary {
        let imageRef = try parseImageReference(reference)
        
        logger.info("Pulling image \(imageRef.name):\(imageRef.tag) from \(imageRef.registry)")
        
        // Prepare storage paths
        let blobsDir = self.blobsPath()
        let manifestsDir = self.manifestsPath()
        try FileManager.default.createDirectory(atPath: blobsDir.string, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(atPath: manifestsDir.string, withIntermediateDirectories: true)
        
        // Pull manifest using OCI Distribution API
        let manifest = try await pullOCIManifest(imageRef: imageRef)
        
        // Download and store layer blobs
        var layerDigests: [String] = []
        var totalSize: Int = 0
        
        for layer in manifest.layers {
            let digest = layer.digest
            layerDigests.append(digest)
            
            let blobPath = blobsDir.appending(digest)
            
            // Skip if already downloaded
            if FileManager.default.fileExists(atPath: blobPath.string) {
                logger.info("Layer \(digest) already exists, skipping download")
                if let size = try? FileManager.default.attributesOfItem(atPath: blobPath.string)[.size] as? Int {
                    totalSize += size
                }
                continue
            }
            
            logger.info("Downloading layer \(digest) (\(layer.mediaType))")
            try await downloadOCILayer(imageRef: imageRef, digest: digest, to: blobPath)
            
            if let size = try? FileManager.default.attributesOfItem(atPath: blobPath.string)[.size] as? Int {
                totalSize += size
            }
        }
        
        // Save manifest metadata for later reconstruction
        let storedManifest = StoredManifest(layers: layerDigests)
        let manifestData = try JSONEncoder().encode(storedManifest)
        let manifestPath = self.manifestFilePath(name: imageRef.name, tag: imageRef.tag)
        try manifestData.write(to: URL(fileURLWithPath: manifestPath.string))
        
        // Create image record
        let image = ImageSummary(
            name: imageRef.name,
            tag: imageRef.tag,
            digest: manifest.config.digest,
            sizeBytes: totalSize
        )
        
        try await imageStore.insert(image)
        
        logger.info("Image \(reference) pulled successfully (\(layerDigests.count) layers, \(totalSize) bytes)")
        return image
    }
    
    public func listImages() async throws -> [ImageSummary] {
        await imageStore.fetchAll()
    }
    
    // MARK: - OCI Registry Helpers
    
    private func pullOCIManifest(imageRef: ImageReference) async throws -> OCIManifest {
        let registryBase = imageRef.registry == "docker.io" ? "https://registry-1.docker.io" : "https://\(imageRef.registry)"
        let manifestURL = "\(registryBase)/v2/\(imageRef.name)/manifests/\(imageRef.tag)"
        
        logger.info("Fetching manifest from \(manifestURL)")
        
        var request = try HTTPClient.Request(url: manifestURL)
        request.headers.add(name: "Accept", value: "application/vnd.oci.image.manifest.v1+json,application/vnd.docker.distribution.manifest.v2+json")
        
        let response = try await httpClient.execute(request: request).get()
        
        guard response.status == .ok else {
            throw ContainerError.imageNotFound("Failed to fetch manifest: HTTP \(response.status.code)")
        }
        
        guard let body = response.body else {
            throw ContainerError.imageNotFound("Empty manifest response")
        }
        
        let manifestData = body.getData(at: 0, length: body.readableBytes) ?? Data()
        return try JSONDecoder().decode(OCIManifest.self, from: manifestData)
    }
    
    private func downloadOCILayer(imageRef: ImageReference, digest: String, to destination: FilePath) async throws {
        let registryBase = imageRef.registry == "docker.io" ? "https://registry-1.docker.io" : "https://\(imageRef.registry)"
        let blobURL = "\(registryBase)/v2/\(imageRef.name)/blobs/\(digest)"
        
        logger.info("Downloading blob from \(blobURL)")
        
        let request = try HTTPClient.Request(url: blobURL)
        let response = try await httpClient.execute(request: request).get()
        
        guard response.status == .ok else {
            throw ContainerError.imageNotFound("Failed to download blob \(digest): HTTP \(response.status.code)")
        }
        
        guard let body = response.body else {
            throw ContainerError.imageNotFound("Empty blob response")
        }
        
        let blobData = body.getData(at: 0, length: body.readableBytes) ?? Data()
        try blobData.write(to: URL(fileURLWithPath: destination.string))
        
        logger.info("Downloaded blob \(digest) (\(blobData.count) bytes)")
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
    
    private func cleanupContainerData(for containerID: UUID) async throws {
        let containerDir = Self.containerDirectory(for: containerID)
        if FileManager.default.fileExists(atPath: containerDir.string) {
            try FileManager.default.removeItem(atPath: containerDir.string)
        }
    }
    
    private func blobsPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        let path = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("cache")
            .appendingPathComponent("blobs")
        
        return FilePath(path.path)
    }
    
    private func manifestsPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        let path = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("cache")
            .appendingPathComponent("manifests")
        
        return FilePath(path.path)
    }
    
    private func manifestFilePath(name: String, tag: String) -> FilePath {
        let safeName = name.replacingOccurrences(of: "/", with: "_")
        let filename = "\(safeName)_\(tag).json"
        return manifestsPath().appending(filename)
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
    
    private static func containerDirectory(for id: UUID) -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        let containerDir = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("containers")
            .appendingPathComponent(id.uuidString)
        
        return FilePath(containerDir.path)
    }
    
    private static func containerConfigPath(for id: UUID) -> FilePath {
        return containerDirectory(for: id).appending("config.json")
    }
    
    private func storeContainerConfig(containerID: UUID, config: ContainerConfig) async throws {
        let configPath = Self.containerConfigPath(for: containerID)
        let configDir = configPath.removingLastComponent()
        
        try FileManager.default.createDirectory(
            atPath: configDir.string,
            withIntermediateDirectories: true
        )
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let configData = try encoder.encode(config)
        try configData.write(to: URL(fileURLWithPath: configPath.string))
    }
    
    private func loadContainerConfig(containerID: UUID) async throws -> ContainerConfig {
        let configPath = Self.containerConfigPath(for: containerID)
        
        guard FileManager.default.fileExists(atPath: configPath.string) else {
            return ContainerConfig.default
        }
        
        let configData = try Data(contentsOf: URL(fileURLWithPath: configPath.string))
        return try JSONDecoder().decode(ContainerConfig.self, from: configData)
    }
    
    private func computeCPUCount(from cpuLimit: Int?) -> Int {
        // cpuLimit is in millicores (1000 = 1 CPU)
        if let limit = cpuLimit {
            let cores = max(1, (limit + 999) / 1000)
            let hostCores = ProcessInfo.processInfo.processorCount
            return min(cores, hostCores)
        }
        return 2 // Default
    }
    
    private func computeMemorySize(from memoryLimit: Int?) -> Int {
        // memoryLimit is in bytes
        if let limit = memoryLimit {
            let minMemory = 128 * 1024 * 1024 // 128MB
            let maxMemory = Int(ProcessInfo.processInfo.physicalMemory)
            return max(minMemory, min(limit, maxMemory))
        }
        return 512 * 1024 * 1024 // 512MB default
    }
}

// MARK: - Supporting Types

private struct StoredManifest: Codable {
    let layers: [String]
}

private struct OCIManifest: Codable {
    let config: OCIConfigDescriptor
    let layers: [OCILayerDescriptor]
    let schemaVersion: Int?
}

private struct OCIConfigDescriptor: Codable {
    let mediaType: String
    let digest: String
    let size: Int
}

private struct OCILayerDescriptor: Codable {
    let mediaType: String
    let digest: String
    let size: Int
}

private struct ImageReference {
    let registry: String
    let name: String
    let tag: String
}
