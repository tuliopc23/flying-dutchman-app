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

/// Type alias to disambiguate our VolumeManager's Mount from Containerization's Mount
private typealias ContainerMount = Containerization.Mount

/// Runtime implementation using Apple's Containerization framework
/// This provides lightweight VMs per container (OrbStack-style architecture)
public actor ContainerizationRuntime: ContainerRuntimeProtocol {
    let logger = Loggers.make(category: .containers)
    let containerStore = ContainerStore()
    let imageStore = ImageStore()
    let eventStore = ContainerEventStore()
    let logStore = ContainerLogStore()
    let imageCache = ImageCacheManager()
    let imageFilesystem = ImageFilesystemManager()
    let volumeManager = VolumeManager()
    let filesystemManager = ContainerFilesystemManager()
    let authManager = RegistryAuthManager()
    let portForwardManager = PortForwardManager()
    let networkManager = NetworkManager()
    let routingTable: DomainRoutingTable?

    // NIO Transport
    private let group = NIOTSEventLoopGroup(loopCount: 1)
    let httpClient: HTTPClient

    /// Container Manager - handles lifecycle via Apple's framework
    private var containerManager: ContainerManager?

    /// Active State - maps our UUIDs to LinuxContainers
    var activeContainers: [UUID: LinuxContainer] = [:]

    /// State machines for each container
    var stateMachines: [UUID: ContainerStateMachine] = [:]

    // Event streaming
    var eventContinuation: AsyncStream<ContainerEvent>.Continuation?
    var _eventStream: AsyncStream<ContainerEvent>?

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
    func ensureManager() async throws -> ContainerManager {
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
                logger
                    .info(
                        "Reconciled container \(container.id): \(container.status.rawValue) -> stopped (transient state)"
                    )

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

    public nonisolated var name: String {
        "Apple Containerization"
    }

    // MARK: - Static Helpers

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

    static func containerDirectory(for id: UUID) -> FilePath {
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

    static func containerConfigPath(for id: UUID) -> FilePath {
        containerDirectory(for: id).appending("config.json")
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
}

// MARK: - Supporting Types

struct StoredManifest: Codable {
    let layers: [String]
}

struct OCIManifest: Codable {
    let config: OCIConfigDescriptor
    let layers: [OCILayerDescriptor]
    let schemaVersion: Int?
}

struct OCIConfigDescriptor: Codable {
    let mediaType: String
    let digest: String
    let size: Int
}

struct OCILayerDescriptor: Codable {
    let mediaType: String
    let digest: String
    let size: Int
}

struct ImageReference {
    let registry: String
    let name: String
    let tag: String
}

/// OCI Registry-specific errors
enum OCIRegistryError: Error {
    case unauthorized(statusCode: Int)

    var statusCode: Int {
        switch self {
        case let .unauthorized(code):
            code
        }
    }
}
