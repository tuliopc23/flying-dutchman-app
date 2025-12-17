import Foundation
import NIOConcurrencyHelpers
import Shared

/// Stub runtime layer that mimics Containerization operations for early phases.
public protocol ContainerRuntimeProtocol: Sendable {
    var mode: ContainerRuntime.Mode { get }
    var eventStore: EventRecorder? { get }
    func list() -> [ContainerSummary]
    @discardableResult func start(containerID: UUID) -> ContainerSummary?
    @discardableResult func stop(containerID: UUID) -> ContainerSummary?
    @discardableResult func restart(containerID: UUID) -> ContainerSummary?
    func export(to store: AnyContainerStore)
    func importContainer(_ container: ContainerSummary)
    func logs(for id: UUID) -> [String]
    func workerStatuses() -> [String: String]
}

public final class ContainerRuntime: ContainerRuntimeProtocol, @unchecked Sendable {
    public enum Mode: String {
        case containerization
        case stub
    }

    public static let shared = ContainerRuntime()

    private let lock = NIOLock()
    private var containers: [UUID: ContainerSummary]
    private let containerization: ContainerizationClient
    public let mode: Mode
    private var logs: [UUID: [String]] = [:]
    private let store: AnyContainerStore?
    private let logStore: (any ContainerLogStoring)?
    public let eventStore: EventRecorder?

    public convenience init(
        store: AnyContainerStore? = nil,
        logStore: (any ContainerLogStoring)? = nil,
        eventStore: EventRecorder? = nil,
        containerization: ContainerizationClient = .shared
    ) {
        let initial: [ContainerSummary]
        if let store = store {
            let stored = store.fetchAll()
            if stored.isEmpty {
                initial = ContainerFixtures.sampleContainers
                store.replaceAll(with: initial)
            } else {
                initial = stored
            }
        } else {
            initial = ContainerFixtures.sampleContainers
        }
        self.init(initialContainers: initial, containerization: containerization, store: store, logStore: logStore, eventStore: eventStore)
    }

    private init(
        initialContainers: [ContainerSummary],
        containerization: ContainerizationClient,
        store: AnyContainerStore?,
        logStore: (any ContainerLogStoring)?,
        eventStore: EventRecorder?
    ) {
        containers = Dictionary(uniqueKeysWithValues: initialContainers.map { ($0.id, $0) })
        self.store = store
        self.logStore = logStore
        self.eventStore = eventStore
        self.containerization = containerization
        mode = containerization.isNativeAvailable ? .containerization : .stub
        hydrateLogs()
    }

    public func list() -> [ContainerSummary] {
        lock.withLock {
            containers.values.sorted { $0.name < $1.name }
        }
    }

    @discardableResult
    public func start(containerID: UUID) -> ContainerSummary? {
        if containerization.isNativeAvailable {
            // TODO: Once Containerization.framework is fully integrated:
            // 1. Look up container by ID in containerization framework
            // 2. Call .start() on the container instance
            // 3. Wait for state transition to .running
            // 4. Update local state + persist
            // For now, we simulate the native behavior:
            logStore?.append(containerID: containerID, line: "\(Date()): [native] starting container")
            eventStore?.record(status: "starting", containerId: containerID, image: containers[containerID]?.image ?? "", kind: "native-start")
        }
        return update(containerID: containerID, status: .running)
    }

    @discardableResult
    public func stop(containerID: UUID) -> ContainerSummary? {
        if containerization.isNativeAvailable {
            // TODO: Once Containerization.framework is fully integrated:
            // 1. Look up container by ID in containerization framework
            // 2. Call .stop() on the container instance
            // 3. Wait for graceful shutdown
            // 4. Update local state + persist
            // For now, we simulate the native behavior:
            logStore?.append(containerID: containerID, line: "\(Date()): [native] stopping container")
            eventStore?.record(status: "stopping", containerId: containerID, image: containers[containerID]?.image ?? "", kind: "native-stop")
        }
        return update(containerID: containerID, status: .stopped)
    }

    @discardableResult
    public func restart(containerID: UUID) -> ContainerSummary? {
        _ = stop(containerID: containerID)
        return start(containerID: containerID)
    }

    public func export(to store: AnyContainerStore) {
        store.replaceAll(with: list())
    }

    public func importContainer(_ container: ContainerSummary) {
        lock.withLock {
            containers[container.id] = container
            logs[container.id] = logs[container.id] ?? []
        }
        logStore?.append(containerID: container.id, line: "\(Date()): created via shim")
        eventStore?.record(status: "shim", containerId: container.id, image: container.image, kind: "create")
        persist()
        pruneLogs()
    }

    public func logs(for id: UUID) -> [String] {
        lock.withLock {
            logs[id] ?? ["stub: no logs available"]
        }
    }

    public func pruneLogs(maxEntries: Int = 500) {
        lock.withLock {
            for key in logs.keys {
                logs[key] = logs[key]?.suffix(maxEntries)
            }
        }
    }

    public func workerStatuses() -> [String: String] {
        [
            "containerization": containerization.workerStatus
        ]
    }

    private func update(containerID: UUID, status: ContainerSummary.Status) -> ContainerSummary? {
        let updated: ContainerSummary? = lock.withLock {
            guard var container = containers[containerID] else { return nil }
            container.status = status
            containers[containerID] = container
            var containerLogs = logs[containerID] ?? []
            containerLogs.append("\(Date()): status -> \(status.rawValue)")
            logs[containerID] = containerLogs.suffix(200)
            logStore?.append(containerID: containerID, line: "\(Date()): status -> \(status.rawValue)")
            eventStore?.record(status: status.rawValue, containerId: containerID, image: container.image, kind: "state")
            return container
        }
        persist()
        pruneLogs()
        return updated
    }

    private func persist() {
        guard let store else { return }
        store.replaceAll(with: list())
    }

    private func hydrateLogs() {
        guard let logStore else { return }
        let ids = list().map(\.id)
        ids.forEach { id in
            logs[id] = logStore.fetch(containerID: id)
        }
    }
}

public enum ContainerFixtures {
    public static let sampleContainers: [ContainerSummary] = [
        .init(name: "api", image: "ghcr.io/fd/api:dev", status: .running, ports: ["8080->8080"]),
        .init(name: "worker", image: "ghcr.io/fd/worker:dev", status: .running, ports: ["5672->5672"]),
        .init(name: "db", image: "postgres:16-alpine", status: .stopped, ports: ["5432->5432"])
    ]

    public static let sampleImages: [ImageSummary] = [
        .init(name: "ghcr.io/fd/api", tag: "dev", digest: "sha256:abc123", sizeBytes: 230_000_000),
        .init(name: "ghcr.io/fd/worker", tag: "dev", digest: "sha256:def456", sizeBytes: 180_000_000),
        .init(name: "postgres", tag: "16-alpine", digest: "sha256:pg16", sizeBytes: 120_000_000)
    ]

    public static let sampleStacks: [StackSummary] = [
        .init(name: "Core Services", description: "API + worker + db", containerNames: ["api", "worker", "db"]),
        .init(name: "Analytics", description: "Clickhouse + ingestion", containerNames: []),
        .init(name: "Empty Stack", description: "Create your first stack", containerNames: [])
    ]

    public static let sampleVolumes: [VolumeSummary] = [
        .init(name: "db-data", mountPath: "/var/lib/postgresql/data", sizeBytes: 5_000_000_000),
        .init(name: "worker-cache", mountPath: "/var/cache/worker")
    ]

    public static let sampleNetworks: [NetworkSummary] = [
        .init(name: "flyingdutchman_default", subnet: "10.42.0.0/16", connectedContainerIDs: []),
        .init(name: "public", subnet: "192.168.64.0/24", connectedContainerIDs: [])
    ]
}
