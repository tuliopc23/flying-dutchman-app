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

// Type alias to disambiguate our VolumeManager's Mount from Containerization's Mount
private typealias ContainerMount = Containerization.Mount

/// Runtime implementation using Apple's Containerization framework
/// This provides lightweight VMs per container (OrbStack-style architecture)
public actor ContainerizationRuntime: ContainerRuntimeProtocol {
    private let logger = Loggers.make(category: .containers)
    private let containerStore = ContainerStore()
    private let imageStore = ImageStore()
    private let eventStore = ContainerEventStore()
    private let logStore = ContainerLogStore()
    private let imageCache = ImageCacheManager()
    private let imageFilesystem = ImageFilesystemManager()
    private let volumeManager = VolumeManager()
    private let filesystemManager = ContainerFilesystemManager()
    private let authManager = RegistryAuthManager()
    private let portForwardManager = PortForwardManager()
    private let networkManager = NetworkManager()
    private let routingTable: DomainRoutingTable?
    
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
        initfsReference: String = "ghcr.io/apple/containerization/vminit:0.13.0",
        routingTable: DomainRoutingTable? = nil
    ) {
        self.kernelPath = kernelPath ?? Self.defaultKernelPath()
        self.initfsReference = initfsReference
        self.routingTable = routingTable
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
        
        let kernel = Kernel(
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
        
        // Initialize network manager
        try await networkManager.initialize()

        // Get all containers from persistence
        let storedContainers = containerStore.fetchAll()

        // Rebuild state machines and reconcile states
        var reconciled = 0
        for container in storedContainers {
            // Re-reserve IP if running or created
            if let ip = container.ipAddress, let defaultNetwork = try? await networkManager.ensureDefaultNetwork() {
                try? await networkManager.reserveIP(networkID: defaultNetwork.id, ip: ip)
            }
            
            // Create state machine if needed
            if stateMachines[container.id] == nil {
                let stateMachine = ContainerStateMachine(initialState: container.status, containerID: container.id)
                stateMachine.onStateChange = { [weak self] from, to in
                    Task { [weak self] in
                        await self?.emitStateChange(containerID: container.id, from: from, to: to)
                    }
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
        let stored = containerStore.fetchAll()

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
        
        // Validate and prepare mounts
        let mounts = try await prepareMounts(from: config)
        
        // Create container record (but don't start VM yet)
        let container = ContainerSummary(
            name: name,
            image: image,
            status: .created,
            ports: config.ports ?? [],
            mounts: mounts
        )
        
        // Persist to GRDB
        try await containerStore.insert(container)
        
        // Initialize state machine
        let stateMachine = ContainerStateMachine(initialState: .created, containerID: container.id)
        stateMachine.onStateChange = { [weak self] from, to in
            Task { [weak self] in
                await self?.emitStateChange(containerID: container.id, from: from, to: to)
            }
        }
        stateMachines[container.id] = stateMachine
        
        // Store container config for later use (when starting)
        try await storeContainerConfig(containerID: container.id, config: config)
        
        logger.info("Container \(container.id) created successfully with \(mounts.count) mount(s)")
        return container
    }
    
    private func prepareMounts(from config: ContainerConfig) async throws -> [MountSpec] {
        guard let volumes = config.volumes else { return [] }
        
        var mounts: [MountSpec] = []
        
        for volumeSpec in volumes {
            let parts = volumeSpec.split(separator: ":", maxSplits: 3).map { String($0) }
            
            guard parts.count >= 2 else {
                throw ContainerError.configurationInvalid("Invalid mount spec: \(volumeSpec). Expected format: 'source:destination[:mode]'")
            }
            
            let source = parts[0]
            let destination = parts[1]
            let readOnly = parts.count >= 3 && parts[2].contains("ro")
            
            let isNamedVolume = !source.contains("/")
            
            if isNamedVolume {
                mounts.append(MountSpec(
                    source: source,
                    destination: destination,
                    type: .volume,
                    readOnly: readOnly
                ))
            } else {
                let expandedPath = NSString(string: source).expandingTildeInPath
                
                guard FileManager.default.fileExists(atPath: expandedPath) else {
                    throw ContainerError.configurationInvalid("Bind mount path not found: \(source)")
                }
                
                var isDirectory: ObjCBool = false
                FileManager.default.fileExists(atPath: expandedPath, isDirectory: &isDirectory)
                
                guard isDirectory.boolValue || readOnly else {
                    throw ContainerError.configurationInvalid("Bind mount must be a directory or read-only: \(source)")
                }
                
                mounts.append(MountSpec(
                    source: expandedPath,
                    destination: destination,
                    type: .bind,
                    readOnly: readOnly
                ))
            }
        }
        
        return mounts
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

        // Setup Networking (Phase 2 Sprint 2)
        // 1. Ensure default network exists
        // 2. Allocate IP
        let defaultNetwork = try await networkManager.ensureDefaultNetwork()
        let containerIP = try await networkManager.allocateIP(networkID: defaultNetwork.id, containerID: id)
        logger.info("Allocated IP \(containerIP) for container \(id)")

        logger.info("Container \(container.id) configured with \(cpuCount) CPUs, \(memoryBytes / (1024 * 1024))MB memory")

        // Get ContainerManager
        var manager = try await ensureManager()

        do {
            // ... (mount setup)

            // Create the LinuxContainer via ContainerManager
            let linuxContainer = try await manager.create(container.name, reference: container.image) { cfg in
                cfg.cpus = cpuCount
                cfg.memoryInBytes = UInt64(memoryBytes)
                
                // Configure Networking (Phase 2)
                // Note: Containerization framework currently handles networking automatically
                // We just track the IP allocation for our own records/DNS
                // Future: Configure custom bridge if framework supports it
                
                // ... (process args, env, mounts)
            }
            
            // Store active container
            activeContainers[container.id] = linuxContainer
            
            // Boot the VM
            try await linuxContainer.start()
            
            // Port Forwarding
            let mappings = try config.getAllPortMappings()
            for mapping in mappings {
                try await portForwardManager.createForward(
                    hostPort: mapping.hostPort,
                    containerID: container.id,
                    containerPort: mapping.containerPort,
                    container: linuxContainer
                )
            }
            
            // Rootfs URL (Added during stabilization)
            let rootfsURL: URL? = nil // Placeholder until exposed rootfs logic is confirmed
            
            // Update state machine and status to running
            try stateMachine.transition(to: .running)
            updated.status = .running
            updated.rootfsPath = rootfsURL?.path
            updated.ipAddress = containerIP
            try await containerStore.update(updated)
            
            // Register with routing table for DNS/HTTPS proxy
            if let routingTable = self.routingTable {
                await routingTable.register(container: updated, config: config)
                logger.info("Registered \(updated.name).fd.local in routing table")
            }

            logger.info("Container \(container.id) started successfully")
            return updated
        } catch {
            // On failure, cleanup IP
            try? await networkManager.releaseIP(networkID: defaultNetwork.id, containerID: id, ip: containerIP)
            
            // Transition back to stopped
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

        // Unmount/remove rootfs exposure
        do {
            try await filesystemManager.unmountRootfs(containerId: id)
            logger.info("Container rootfs unmounted", metadata: [
                "container": .string(id.uuidString)
            ])
        } catch {
            // Non-fatal: log warning and continue
            logger.warning("Failed to unmount rootfs", metadata: [
                "container": .string(id.uuidString),
                "error": .string(error.localizedDescription)
            ])
        }
        
        // Remove port forwards
        do {
            try await portForwardManager.removeForwards(containerID: id)
            logger.info("Removed port forwards", metadata: [
                "container": .string(id.uuidString)
            ])
        } catch {
            logger.warning("Failed to remove port forwards", metadata: [
                "container": .string(id.uuidString),
                "error": .string(error.localizedDescription)
            ])
        }
        
        // Release IP
        // Note: For now we assume default network. In future, track network ID in container record.
        if let defaultNetwork = try? await networkManager.ensureDefaultNetwork(), let ip = container.ipAddress {
             try? await networkManager.releaseIP(networkID: defaultNetwork.id, containerID: id, ip: ip)
             logger.info("Released IP \(ip)", metadata: [
                 "container": .string(id.uuidString)
             ])
        }

        // Cleanup state
        activeContainers.removeValue(forKey: id)
        
        // Unregister from routing table
        if let routingTable = self.routingTable {
            await routingTable.unregister(containerID: id)
            logger.info("Unregistered container \(id) from routing table")
        }
        
        // Update state machine and status to stopped
        try stateMachine.transition(to: .stopped)
        updated.status = .stopped
        updated.rootfsPath = nil // Clear rootfs path when stopped
        updated.ipAddress = nil  // Clear IP when stopped
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
        logStore.delete(containerID: id)
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
                    let historicalLogs = logStore.fetch(containerID: id, limit: 200)
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
        return try await pullImageWithRetry(reference: reference, retryCount: 0)
    }
    
    /// Pull image with authentication retry logic
    private func pullImageWithRetry(reference: String, retryCount: Int) async throws -> ImageSummary {
        let imageRef = try parseImageReference(reference)
        
        logger.info("Pulling image \(imageRef.name):\(imageRef.tag) from \(imageRef.registry)")
        
        // Prepare storage paths
        let blobsDir = self.blobsPath()
        let manifestsDir = self.manifestsPath()
        try FileManager.default.createDirectory(atPath: blobsDir.string, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(atPath: manifestsDir.string, withIntermediateDirectories: true)
        
        // Get auth token if available
        let scope = "repository:\(imageRef.name):pull"
        let authToken = try await authManager.getAuthToken(registry: imageRef.registry, scope: scope)
        
        // Pull manifest using OCI Distribution API
        let manifest: OCIManifest
        do {
            manifest = try await pullOCIManifest(imageRef: imageRef, authToken: authToken)
        } catch let error as OCIRegistryError where error.statusCode == 401 {
            // Authentication failed - try to refresh token and retry once
            if retryCount == 0 {
                logger.info("Received 401, refreshing token and retrying")
                try await authManager.refreshToken(registry: imageRef.registry)
                return try await pullImageWithRetry(reference: reference, retryCount: 1)
            } else {
                // Already retried, give up
                logger.error("Authentication failed after retry")
                throw ContainerError.imageNotFound("Authentication required. Run: fd login \(imageRef.registry)")
            }
        }
        
        // Download and store layer blobs
        var layerDigests: [String] = []
        var totalSize: Int = 0
        
        for layer in manifest.layers {
            let digest = layer.digest
            layerDigests.append(digest)

            // Skip if already cached
            if await imageCache.hasBlob(digest: digest) {
                logger.info("Layer \(digest) already cached, skipping download")
                totalSize += layer.size
                continue
            }

            logger.info("Downloading layer \(digest) (\(layer.mediaType))")
            let blobData = try await downloadOCILayerData(imageRef: imageRef, digest: digest, authToken: authToken)
            try await imageCache.storeBlob(digest: digest, data: blobData)
            totalSize += blobData.count
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
        
        do {
            _ = try await imageFilesystem.exposeImage(
                imageName: imageRef.name,
                tag: imageRef.tag,
                layerDigests: layerDigests
            )
        } catch {
            logger.warning("Failed to expose image \(imageRef.name):\(imageRef.tag): \(error)")
        }

        logger.info("Image \(reference) pulled successfully (\(layerDigests.count) layers, \(totalSize) bytes)")
        return image
    }
    
    public func listImages() async throws -> [ImageSummary] {
        imageStore.fetchAll()
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
    
    // MARK: - Registry Authentication
    
    /// Login to a container registry
    ///
    /// Stores credentials securely in macOS Keychain for future image pulls.
    ///
    /// - Parameters:
    ///   - registry: Registry hostname (e.g., "docker.io", "ghcr.io")
    ///   - username: Registry username
    ///   - password: Registry password or personal access token
    /// - Throws: If authentication fails or Keychain storage fails
    public func login(registry: String, username: String, password: String) async throws {
        try await authManager.login(registry: registry, username: username, password: password)
        logger.info("Successfully logged in to registry", metadata: [
            "registry": .string(registry),
            "username": .string(username)
        ])
    }
    
    /// Logout from a container registry
    ///
    /// Removes stored credentials from macOS Keychain.
    ///
    /// - Parameter registry: Registry hostname to logout from
    /// - Throws: If Keychain removal fails
    public func logout(registry: String) async throws {
        try await authManager.logout(registry: registry)
        logger.info("Successfully logged out from registry", metadata: [
            "registry": .string(registry)
        ])
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
    
    private func pullOCIManifest(imageRef: ImageReference, authToken: String?) async throws -> OCIManifest {
        let registryBase = imageRef.registry == "docker.io" ? "https://registry-1.docker.io" : "https://\(imageRef.registry)"
        let manifestURL = "\(registryBase)/v2/\(imageRef.name)/manifests/\(imageRef.tag)"
        
        logger.info("Fetching manifest from \(manifestURL)")
        
        var request = try HTTPClient.Request(url: manifestURL)
        request.headers.add(name: "Accept", value: "application/vnd.oci.image.manifest.v1+json,application/vnd.docker.distribution.manifest.v2+json")
        
        // Add auth header if token available
        if let token = authToken {
            request.headers.add(name: "Authorization", value: "Bearer \(token)")
        }
        
        let response = try await httpClient.execute(request: request).get()
        
        guard response.status == .ok else {
            if response.status.code == 401 {
                throw OCIRegistryError.unauthorized(statusCode: 401)
            }
            throw ContainerError.imageNotFound("Failed to fetch manifest: HTTP \(response.status.code)")
        }
        
        guard let body = response.body else {
            throw ContainerError.imageNotFound("Empty manifest response")
        }
        
        let manifestData = body.getData(at: 0, length: body.readableBytes) ?? Data()
        return try JSONDecoder().decode(OCIManifest.self, from: manifestData)
    }
    
    private func downloadOCILayerData(imageRef: ImageReference, digest: String, authToken: String?) async throws -> Data {
        let registryBase = imageRef.registry == "docker.io" ? "https://registry-1.docker.io" : "https://\(imageRef.registry)"
        let blobURL = "\(registryBase)/v2/\(imageRef.name)/blobs/\(digest)"
        
        logger.info("Downloading blob from \(blobURL)")
        
        var request = try HTTPClient.Request(url: blobURL)
        
        // Add auth header if token available
        if let token = authToken {
            request.headers.add(name: "Authorization", value: "Bearer \(token)")
        }
        
        let response = try await httpClient.execute(request: request).get()
        
        guard response.status == .ok else {
            if response.status.code == 401 {
                throw OCIRegistryError.unauthorized(statusCode: 401)
            }
            throw ContainerError.imageNotFound("Failed to download blob \(digest): HTTP \(response.status.code)")
        }
        
        guard let body = response.body else {
            throw ContainerError.imageNotFound("Empty blob response")
        }
        
        let blobData = body.getData(at: 0, length: body.readableBytes) ?? Data()
        logger.info("Downloaded blob \(digest) (\(blobData.count) bytes)")
        return blobData
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
                        self.logStore.append(containerID: containerID, line: line)
                        
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

/// OCI Registry-specific errors
private enum OCIRegistryError: Error {
    case unauthorized(statusCode: Int)
    
    var statusCode: Int {
        switch self {
        case .unauthorized(let code):
            return code
        }
    }
}
