import Foundation
import Containerization
import ContainerizationOCI
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
    private let logger = Loggers.make(category: "flyingdutchman.containerization")
    private let containerStore = ContainerStore()
    private let imageStore = ImageStore()
    
    // NIO Transport
    private let group = NIOTSEventLoopGroup(loopCount: 1)
    private let vsockConnector: VSOCKConnector
    private let httpClient: HTTPClient
    
    // Active State
    // TODO: Restore correct type once library mismatch is resolved
    // private var activeContainers: [UUID: LinuxContainer] = [:]
    private var activeContainers: [UUID: Bool] = [:] // Temporary placeholder
    private var controlPlanes: [UUID: Channel] = [:]
    
    // Kernel path - will be configurable later
    private let kernelPath: FilePath
    
    public init(kernelPath: FilePath? = nil) {
        // Default to bundled kernel or downloaded Kata kernel
        self.kernelPath = kernelPath ?? Self.defaultKernelPath()
        self.vsockConnector = VSOCKConnector(group: self.group)
        self.httpClient = HTTPClient(eventLoopGroupProvider: .shared(self.group))
    }
    
    /// Reconcile runtime state with persisted state on engine startup
    /// This ensures that if the engine crashed, we mark containers as stopped
    public func reconcileState() async throws {
        logger.info("Reconciling container state on startup")
        
        // Get all containers from persistence
        let storedContainers = await containerStore.fetchAll()
        
        // Clear active containers map - we'll rebuild it from actual VM state
        // In a real implementation, we'd check which VMs are actually running
        // For now, we mark all as stopped if they're not in our active map
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
    
    public nonisolated var name: String { "Apple Containerization (VSOCK)" }
    
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
        
        // Validate and compute resource limits
        let cpuCount = computeCPUCount(from: config.cpuLimit)
        let memorySize = computeMemorySize(from: config.memoryLimit)
        
        logger.info("Container \(container.id) configured with \(cpuCount) CPUs, \(memorySize / (1024 * 1024))MB memory")
        
        // Create rootfs from OCI image
        let rootfsPath = try await prepareRootFS(for: container)
        
        /* 
        // TODO: Update to match Containerization.framework API
        // Create VM configuration with resource limits
        let vmConfig = LinuxVMConfiguration(
            kernelPath: kernelPath,
            rootfsPath: rootfsPath,
            cpuCount: cpuCount,
            memorySize: memorySize
        )
        
        // Create and start the VM
        let linuxContainer = try LinuxContainer(configuration: vmConfig)
        try await linuxContainer.start()
        
        // Store active container reference
        activeContainers[container.id] = linuxContainer
        */
        
        logger.warning("VM creation temporarily disabled due to API mismatch. Simulating start with \(cpuCount) CPUs, \(memorySize / (1024 * 1024))MB memory.")
        
        // Store active status
        activeContainers[container.id] = true
        
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
        
        guard activeContainers[container.id] != nil else {
            throw ContainerError.invalidState("Container VM not found")
        }
        
        logger.info("Stopping container \(container.id)")
        
        // Try graceful stop via VSOCK with timeout
        let gracefulStopTimeout: TimeInterval = 5.0
        var gracefulStopSucceeded = false
        
        if let channel = controlPlanes[id] {
            do {
                try await channel.writeAndFlush(ControlPlaneCommand.stop)
                
                // Wait for graceful shutdown with timeout
                // In a real implementation, we'd wait for the VM to signal shutdown
                // For now, we use a race between the operation and timeout
                gracefulStopSucceeded = await withTaskGroup(of: Bool.self) { group in
                    group.addTask {
                        // Simulate waiting for VM shutdown signal
                        // In real implementation, this would wait for VM to signal
                        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
                        return true
                    }
                    
                    group.addTask {
                        // Timeout task
                        try? await Task.sleep(nanoseconds: UInt64(gracefulStopTimeout * 1_000_000_000))
                        return false
                    }
                    
                    let result = await group.next() ?? false
                    group.cancelAll()
                    return result
                }
                
                try? await channel.close()
            } catch {
                logger.warning("VSOCK graceful stop failed: \(error)")
            }
        }
        
        // Force stop the VM if graceful stop didn't succeed
        if !gracefulStopSucceeded {
            logger.info("Graceful stop timeout exceeded, forcing VM stop")
            // try await linuxContainer.stop()
            logger.warning("Simulating VM force stop.")
        } else {
            logger.info("Container stopped gracefully")
        }
        
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
        
        return AsyncStream { [logger] continuation in 
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
    
    // MARK: - OCI Registry Helpers
    
    private func pullOCIManifest(imageRef: ImageReference) async throws -> OCIManifest {
        // Build OCI Distribution API URL
        let registryBase = imageRef.registry == "docker.io" ? "https://registry-1.docker.io" : "https://\(imageRef.registry)"
        let manifestURL = "\(registryBase)/v2/\(imageRef.name)/manifests/\(imageRef.tag)"
        
        logger.info("Fetching manifest from \(manifestURL)")
        
        var request = try HTTPClient.Request(url: manifestURL)
        request.headers.add(name: "Accept", value: "application/vnd.oci.image.manifest.v1+json,application/vnd.docker.distribution.manifest.v2+json")
        
        // For Docker Hub, we might need authentication for private repos
        // For now, we'll try without auth (works for public images)
        
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
        // Build blob URL
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
        
        // Clean up existing if any (e.g. failed start)
        if FileManager.default.fileExists(atPath: rootfsDir.string) {
            try FileManager.default.removeItem(atPath: rootfsDir.string)
        }
        
        // Create directory
        try FileManager.default.createDirectory(
            atPath: rootfsDir.string,
            withIntermediateDirectories: true
        )
        
        // Retrieve stored manifest
        let imageParts = container.image.split(separator: ":")
        let imageName = String(imageParts[0])
        let imageTag = imageParts.count > 1 ? String(imageParts[1]) : "latest"
        
        let storedManifestPath = self.manifestFilePath(name: imageName, tag: imageTag)
        
        // Fallback for missing manifest (dev mode)
        if !FileManager.default.fileExists(atPath: storedManifestPath.string) {
            logger.warning("Manifest not found for \(container.image), creating stub rootfs")
             try "stub".write(to: URL(fileURLWithPath: rootfsDir.appending("README").string), atomically: true, encoding: .utf8)
            return rootfsDir
        }
        
        let manifestData = try Data(contentsOf: URL(fileURLWithPath: storedManifestPath.string))
        let storedManifest = try JSONDecoder().decode(StoredManifest.self, from: manifestData)
        
        logger.info("Preparing rootfs for \(container.id) with \(storedManifest.layers.count) layers")
        
        // Extract layers in order
        let blobsDir = self.blobsPath()
        for digest in storedManifest.layers {
            let blobPath = blobsDir.appending(digest)
            if !FileManager.default.fileExists(atPath: blobPath.string) {
                logger.warning("Missing blob \(digest), skipping extraction")
                continue
            }
            
            logger.info("Extracting layer \(digest)")
            do {
                try await extractTar(at: blobPath, to: rootfsDir)
            } catch {
                logger.error("Failed to extract layer \(digest): \(error)")
                // Continue with next layer - some layers might be empty or invalid
                // In production, we might want to fail here, but for now we continue
            }
        }
        
        logger.info("RootFS prepared successfully at \(rootfsDir.string)")
        return rootfsDir
    }
    
    private func extractTar(at tarPath: FilePath, to destination: FilePath) async throws {
        // Ensure destination exists
        try FileManager.default.createDirectory(
            atPath: destination.string,
            withIntermediateDirectories: true
        )
        
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/tar")
        // -x: extract, -f: file, -C: directory, --strip-components=0: preserve directory structure
        process.arguments = ["-xf", tarPath.string, "-C", destination.string]
        
        // Capture stderr for debugging
        let stderrPipe = Pipe()
        process.standardError = stderrPipe
        
        try process.run()
        process.waitUntilExit()
        
        if process.terminationStatus != 0 {
            let stderrData = stderrPipe.fileHandleForReading.readDataToEndOfFile()
            let stderrString = String(data: stderrData, encoding: .utf8) ?? "Unknown error"
            logger.error("tar extraction failed: \(stderrString)")
            throw ContainerError.extractionFailed("\(tarPath.string): \(stderrString)")
        }
    }
    
    private func cleanupRootFS(for containerID: UUID) async throws {
        // Remove rootfs directory
        let rootfsDir = Self.containerRootFSPath(for: containerID)
        if FileManager.default.fileExists(atPath: rootfsDir.string) {
            try FileManager.default.removeItem(atPath: rootfsDir.string)
        }
        
        // Remove container config file
        let configPath = Self.containerConfigPath(for: containerID)
        if FileManager.default.fileExists(atPath: configPath.string) {
            try FileManager.default.removeItem(atPath: configPath.string)
        }
        
        // Remove entire container directory if empty
        let containerDir = rootfsDir.removingLastComponent() // Go up from rootfs to container dir
        if FileManager.default.fileExists(atPath: containerDir.string) {
            // Try to remove the entire container directory
            // This will fail if there are other files, which is fine
            try? FileManager.default.removeItem(atPath: containerDir.string)
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
    
    private static func containerConfigPath(for id: UUID) -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        let containerDir = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("containers")
            .appendingPathComponent(id.uuidString)
        
        return FilePath(containerDir.appendingPathComponent("config.json").path)
    }
    
    private func storeContainerConfig(containerID: UUID, config: ContainerConfig) async throws {
        let configPath = Self.containerConfigPath(for: containerID)
        let configDir = configPath.removingLastComponent()
        
        // Ensure directory exists
        try FileManager.default.createDirectory(
            atPath: configDir.string,
            withIntermediateDirectories: true
        )
        
        // Encode and write config
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let configData = try encoder.encode(config)
        try configData.write(to: URL(fileURLWithPath: configPath.string))
    }
    
    private func loadContainerConfig(containerID: UUID) async throws -> ContainerConfig {
        let configPath = Self.containerConfigPath(for: containerID)
        
        guard FileManager.default.fileExists(atPath: configPath.string) else {
            // Return default config if not found
            return ContainerConfig.default
        }
        
        let configData = try Data(contentsOf: URL(fileURLWithPath: configPath.string))
        let decoder = JSONDecoder()
        return try decoder.decode(ContainerConfig.self, from: configData)
    }
    
    private func computeCPUCount(from cpuLimit: Int?) -> Int {
        // cpuLimit is in millicores (1000 = 1 CPU)
        if let limit = cpuLimit {
            let cores = max(1, (limit + 999) / 1000) // Round up
            // Validate against host capabilities (basic check)
            let hostCores = ProcessInfo.processInfo.processorCount
            return min(cores, hostCores)
        }
        // Default: 2 CPUs
        return 2
    }
    
    private func computeMemorySize(from memoryLimit: Int?) -> Int {
        // memoryLimit is in bytes
        if let limit = memoryLimit {
            // Minimum 128MB, validate against available memory (basic check)
            let minMemory = 128 * 1024 * 1024
            let maxMemory = Int(ProcessInfo.processInfo.physicalMemory)
            return max(minMemory, min(limit, maxMemory))
        }
        // Default: 512MB
        return 512 * 1024 * 1024
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
    
    enum CodingKeys: String, CodingKey {
        case config
        case layers
        case schemaVersion
    }
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