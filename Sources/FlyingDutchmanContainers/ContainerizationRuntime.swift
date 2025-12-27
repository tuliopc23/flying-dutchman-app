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
    private let eventStore = ContainerEventStore()
    private let logStore = ContainerLogStore()
    
    // NIO Transport
    private let group = NIOTSEventLoopGroup(loopCount: 1)
    private let httpClient: HTTPClient
    
    // Container Manager - handles lifecycle via Apple's framework
    private var containerManager: ContainerManager?
    
    // Active State - maps our UUIDs to LinuxContainers
    private var activeContainers: [UUID: LinuxContainer] = [:]
    
    // State machines for each container
    private var stateMachines: [UUID: ContainerStateMachine] = [:]

    // Event streaming
    private var eventContinuation: AsyncStream<ContainerEvent>.Continuation?
    private var _eventStream: AsyncStream<ContainerEvent>?
    
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

        // Rebuild state machines and reconcile states
        var reconciled = 0
        for container in storedContainers {
            // Create state machine if needed
            if stateMachines[container.id] == nil {
                let stateMachine = ContainerStateMachine(initialState: container.status, containerID: container.id)
                stateMachine.onStateChange = { [weak self] from, to in
                    self?.emitStateChange(containerID: container.id, from: from, to: to)
                }
                stateMachines[container.id] = stateMachine
            }

            // Reconcile transient states
            var updated = container
            switch container.status {
            case .starting, .stopping:
                // These are transient states - container was probably in the middle of an operation
                // Move to stopped since we don't know the actual VM state
                stateMachines[container.id]?.forceSet(to: .stopped)
                updated.status = .stopped
                try await containerStore.update(updated)
                reconciled += 1
                logger.info("Reconciled container \(container.id): \(container.status.rawValue) -> stopped (transient state)")

            case .running:
                if activeContainers[container.id] == nil {
                    // Container was running but VM is gone - mark as stopped
                    stateMachines[container.id]?.forceSet(to: .stopped)
                    updated.status = .stopped
                    try await containerStore.update(updated)
                    reconciled += 1
                    logger.info("Reconciled container \(container.id): running -> stopped (VM not found)")
                }

            case .removing:
                // Container was being removed - complete the removal
                try await cleanupContainerData(for: container.id)
                stateMachines[container.id]?.forceSet(to: .removed)
                try await containerStore.delete(id: container.id)
                stateMachines.removeValue(forKey: container.id)
                reconciled += 1
                logger.info("Reconciled container \(container.id): removing -> removed (completed removal)")

            case .created, .stopped, .removed:
                // These are valid terminal states - no action needed
                break
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
        // Return containers from GRDB, sync state machines
        let stored = await containerStore.fetchAll()

        // Update status based on state machines and active VMs
        return stored.map { container in
            var updated = container

            // If we have a state machine for this container, use its current state
            if let stateMachine = stateMachines[container.id] {
                updated.status = stateMachine.currentState
            } else if updated.status == .running && activeContainers[container.id] == nil {
                // No state machine and DB says running but VM is gone - mark as stopped
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
            status: .created,
            ports: config.ports ?? []
        )
        
        // Persist to GRDB
        try await containerStore.insert(container)
        
        // Initialize state machine
        let stateMachine = ContainerStateMachine(initialState: .created, containerID: container.id)
        stateMachine.onStateChange = { [weak self] from, to in
            self?.emitStateChange(containerID: container.id, from: from, to: to)
        }
        stateMachines[container.id] = stateMachine
        
        // Store container config for later use (when starting)
        try await storeContainerConfig(containerID: container.id, config: config)
        
        logger.info("Container \(container.id) created successfully")
        return container
    }
    
    public func startContainer(id: UUID) async throws -> ContainerSummary {
        guard let container = try await containerStore.fetch(id: id) else {
            throw ContainerError.notFound(id)
        }

        guard let stateMachine = stateMachines[id] else {
            throw ContainerError.invalidState("Container state machine not found")
        }

        // Validate state transition
        try stateMachine.transition(to: .starting)
        var updated = container
        updated.status = .starting
        try await containerStore.update(updated)

        logger.info("Starting container \(container.id)")

        // Load container config
        let config = try await loadContainerConfig(containerID: container.id)

        // Compute resource limits
        let cpuCount = computeCPUCount(from: config.cpuLimit)
        let memoryBytes = computeMemorySize(from: config.memoryLimit)

        logger.info("Container \(container.id) configured with \(cpuCount) CPUs, \(memoryBytes / (1024 * 1024))MB memory")

        // Get ContainerManager
        var manager = try await ensureManager()

        do {
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

            // Update state machine and status to running
            try stateMachine.transition(to: .running)
            updated.status = .running
            try await containerStore.update(updated)

            logger.info("Container \(container.id) started successfully")
            return updated
        } catch {
            // On failure, transition back to stopped
            try? stateMachine.transition(to: .stopped)
            updated.status = .stopped
            try? await containerStore.update(updated)
            throw error
        }
    }
    
    public func stopContainer(id: UUID) async throws -> ContainerSummary {
        guard let container = try await containerStore.fetch(id: id) else {
            throw ContainerError.notFound(id)
        }

        guard let linuxContainer = activeContainers[id] else {
            throw ContainerError.invalidState("Container VM not found")
        }

        guard let stateMachine = stateMachines[id] else {
            throw ContainerError.invalidState("Container state machine not found")
        }

        // Validate state transition
        try stateMachine.transition(to: .stopping)
        var updated = container
        updated.status = .stopping
        try await containerStore.update(updated)

        logger.info("Stopping container \(container.id)")

        // Stop the container (this shuts down the VM)
        try await linuxContainer.stop()

        // Cleanup state
        activeContainers.removeValue(forKey: id)

        // Update state machine and status to stopped
        try stateMachine.transition(to: .stopped)
        updated.status = .stopped
        try await containerStore.update(updated)

        logger.info("Container \(container.id) stopped successfully")
        return updated
    }
    
    public func removeContainer(id: UUID) async throws {
        guard let container = try await containerStore.fetch(id: id) else {
            throw ContainerError.notFound(id)
        }

        guard let stateMachine = stateMachines[id] else {
            throw ContainerError.invalidState("Container state machine not found")
        }

        // Ensure container is stopped
        if container.status == .running {
            _ = try await stopContainer(id: id)
        }

        // Transition to removing state
        try stateMachine.transition(to: .removing)
        var updated = container
        updated.status = .removing
        try await containerStore.update(updated)

        // Remove from database
        try await containerStore.delete(id: id)

        // Delete container logs
        await logStore.delete(containerID: id)
        await eventStore.deleteEvents(for: id)

        // Clean up rootfs and config
        try await cleanupContainerData(for: id)

        // Cleanup state machine
        stateMachines.removeValue(forKey: id)

        // Transition to removed (final state)
        try stateMachine.transition(to: .removed)

        logger.info("Container \(id) removed")
    }
    
    public func getContainerLogs(id: UUID) async throws -> AsyncStream<String> {
        guard try await containerStore.fetch(id: id) != nil else {
            throw ContainerError.notFound(id)
        }

        // Check if container is running for live streaming
        let linuxContainer = activeContainers[id]

        return AsyncStream { continuation in
            Task {
                do {
                    // First, yield any historical logs from storage
                    let historicalLogs = await logStore.fetch(containerID: id, limit: 200)
                    for logLine in historicalLogs {
                        continuation.yield(logLine)
                    }

                    // If container is running, stream live logs via VSOCK
                    if let linuxContainer = linuxContainer {
                        logger.info("Streaming live logs for container \(id)")

                        // Connect to vminitd on port 1024 for log streaming
                        let handle = try await linuxContainer.dialVsock(port: 1024)

                        // Stream logs from vminitd using length-prefixed JSON protocol
                        try await self.streamLogsFromHandle(handle, continuation: continuation, containerID: id)
                    } else {
                        // Container is stopped, only historical logs available
                        logger.info("Returning historical logs for stopped container \(id)")
                        continuation.finish()
                    }
                } catch {
                    logger.error("Failed to get logs for container \(id): \(error)")
                    continuation.yield("[Error: \(error.localizedDescription)]")
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

    public func eventStream() -> AsyncStream<ContainerEvent> {
        if let stream = _eventStream {
            return stream
        }
        let stream = AsyncStream<ContainerEvent> { continuation in
            self.eventContinuation = continuation
        }
        _eventStream = stream
        return stream
    }

    // MARK: - Event Broadcasting

    /// Emit a container event to all subscribers
    private func emitEvent(_ event: ContainerEvent) {
        eventContinuation?.yield(event)
    }

    /// Emit a state change event
    func emitStateChange(containerID: UUID, from: ContainerSummary.Status, to: ContainerSummary.Status) {
        let event = ContainerEvent(
            containerID: containerID,
            type: .stateChanged(from: from, to: to)
        )
        emitEvent(event)

        // Persist event for replay on reconnect
        Task {
            await eventStore.record(event)
        }
    }

    /// Emit a log output event
    private func emitLog(containerID: UUID, message: String) {
        let event = ContainerEvent(
            containerID: containerID,
            type: .logOutput(message)
        )
        emitEvent(event)
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
    
    /// Stream logs from a VSOCK FileHandle using length-prefixed JSON protocol
    /// The vminitd protocol uses 4-byte length prefix followed by JSON-encoded ControlPlaneEvent
    private func streamLogsFromHandle(
        _ handle: FileHandle,
        continuation: AsyncStream<String>.Continuation,
        containerID: UUID
    ) async throws {
        logger.info("Starting log stream for container \(containerID)")
        
        var buffer = Data()
        let decoder = JSONDecoder()
        
        // Read loop - process incoming data from vminitd
        while true {
            // Read available data asynchronously
            let chunk: Data?
            do {
                chunk = try await withCheckedThrowingContinuation { (cont: CheckedContinuation<Data?, Error>) in
                    handle.readabilityHandler = { fileHandle in
                        let data = fileHandle.availableData
                        fileHandle.readabilityHandler = nil
                        if data.isEmpty {
                            cont.resume(returning: nil) // EOF
                        } else {
                            cont.resume(returning: data)
                        }
                    }
                }
            } catch {
                logger.error("Read error for container \(containerID): \(error)")
                continuation.yield("[Stream error: \(error.localizedDescription)]")
                break
            }
            
            // Check for EOF
            guard let data = chunk, !data.isEmpty else {
                logger.info("Log stream ended for container \(containerID) (EOF)")
                break
            }
            
            buffer.append(data)
            
            // Process complete frames from buffer
            while buffer.count >= 4 {
                // Read 4-byte length prefix (big-endian UInt32)
                let lengthBytes = buffer.prefix(4)
                let length = lengthBytes.withUnsafeBytes { $0.load(as: UInt32.self).bigEndian }
                
                // Check if we have the complete frame
                guard buffer.count >= 4 + Int(length) else {
                    break // Wait for more data
                }
                
                // Extract JSON body
                let jsonData = buffer.subdata(in: 4..<(4 + Int(length)))
                buffer.removeFirst(4 + Int(length))
                
                // Decode and handle event
                do {
                    let event = try decoder.decode(ControlPlaneEvent.self, from: jsonData)
                    
                    switch event {
                    case .logLine(let line):
                        continuation.yield(line)
                        // Also persist to log store for historical access
                        await logStore.append(containerID: containerID, line: line)
                        
                    case .exit(let code):
                        logger.info("Container \(containerID) process exited with code \(code)")
                        continuation.yield("[Process exited with code \(code)]")
                        continuation.finish()
                        try? handle.close()
                        return
                        
                    case .pong:
                        // Keepalive response, ignore
                        break
                    }
                } catch {
                    logger.warning("Failed to decode control plane event: \(error)")
                    // Try to recover by continuing to next frame
                }
            }
        }
        
        // Clean up
        try? handle.close()
        continuation.finish()
        logger.info("Log stream completed for container \(containerID)")
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

    private static func containerLogsPath(for id: UUID) -> FilePath {
        let containerDir = containerDirectory(for: id)
        return containerDir.appending("logs")
    }

    private static func containerLogFile(for id: UUID) -> FilePath {
        let logsDir = containerLogsPath(for: id)
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withYear, .withMonth, .withDay, .withTime]
        let timestamp = dateFormatter.string(from: Date())
        let filename = "container_\(timestamp).log"
        return logsDir.appending(filename)
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
