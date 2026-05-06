import AsyncHTTPClient
import Containerization
import ContainerizationExtras
import ContainerizationOCI
import FlyingDutchmanPersistence
import Foundation
import Logging
import NIOCore
import NIOTransportServices
import Shared
import SystemPackage

public extension ContainerizationRuntime {
    func listContainers() async throws -> [ContainerSummary] {
        // Return containers from GRDB, sync state machines
        let stored = containerStore.fetchAll()

        // Update status based on state machines and active VMs
        return stored.map { container in
            var updated = container

            // If we have a state machine for this container, use its current state
            if let stateMachine = stateMachines[container.id] {
                updated.status = stateMachine.currentState
            } else if updated.status == .running, activeContainers[container.id] == nil {
                // No state machine and DB says running but VM is gone - mark as stopped
                updated.status = .stopped
            }

            return updated
        }
    }

    func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary {
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
            mounts: mounts,
            labels: config.labels
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
                throw ContainerError
                    .configurationInvalid(
                        "Invalid mount spec: \(volumeSpec). Expected format: 'source:destination[:mode]'"
                    )
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

    func startContainer(id: UUID) async throws -> ContainerSummary {
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

        logger
            .info("Container \(container.id) configured with \(cpuCount) CPUs, \(memoryBytes / (1024 * 1024))MB memory")

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
                await registerKubernetesDomainsIfNeeded(container: updated, config: config, routingTable: routingTable)
                logger.info("Registered \(AppConfig.Networking.hostname(for: updated.name)) in routing table")
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

    func stopContainer(id: UUID) async throws -> ContainerSummary {
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
                "container": .string(id.uuidString),
            ])
        } catch {
            // Non-fatal: log warning and continue
            logger.warning("Failed to unmount rootfs", metadata: [
                "container": .string(id.uuidString),
                "error": .string(error.localizedDescription),
            ])
        }

        // Remove port forwards
        do {
            try await portForwardManager.removeForwards(containerID: id)
            logger.info("Removed port forwards", metadata: [
                "container": .string(id.uuidString),
            ])
        } catch {
            logger.warning("Failed to remove port forwards", metadata: [
                "container": .string(id.uuidString),
                "error": .string(error.localizedDescription),
            ])
        }

        // Release IP
        // Note: For now we assume default network. In future, track network ID in container record.
        if let defaultNetwork = try? await networkManager.ensureDefaultNetwork(), let ip = container.ipAddress {
            try? await networkManager.releaseIP(networkID: defaultNetwork.id, containerID: id, ip: ip)
            logger.info("Released IP \(ip)", metadata: [
                "container": .string(id.uuidString),
            ])
        }

        // Cleanup state
        activeContainers.removeValue(forKey: id)

        // Unregister from routing table
        if let routingTable = self.routingTable {
            await routingTable.unregister(containerID: id)
            await unregisterKubernetesDomainsIfNeeded(containerID: id, routingTable: routingTable)
            logger.info("Unregistered container \(id) from routing table")
        }

        // Update state machine and status to stopped
        try stateMachine.transition(to: .stopped)
        updated.status = .stopped
        updated.rootfsPath = nil // Clear rootfs path when stopped
        updated.ipAddress = nil // Clear IP when stopped
        try await containerStore.update(updated)

        logger.info("Container \(container.id) stopped successfully")
        return updated
    }

    func removeContainer(id: UUID) async throws {
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

    func getContainerLogs(id: UUID) async throws -> AsyncStream<String> {
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
                    if let linuxContainer {
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
}
