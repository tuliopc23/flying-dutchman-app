import Foundation
import NIOConcurrencyHelpers
import Shared

/// Stub runtime layer that mimics Containerization operations for early phases.
public final class ContainerRuntime {
    public static let shared = ContainerRuntime()

    private let lock = NIOLock()
    private var containers: [UUID: ContainerSummary]

    public convenience init(store: AnyContainerStore? = nil) {
        if let store = store {
            self.init(initialContainers: store.fetchAll())
        } else {
            self.init(initialContainers: ContainerFixtures.sampleContainers)
        }
    }

    private init(initialContainers: [ContainerSummary]) {
        containers = Dictionary(uniqueKeysWithValues: initialContainers.map { ($0.id, $0) })
    }

    public func list() -> [ContainerSummary] {
        lock.withLock {
            containers.values.sorted { $0.name < $1.name }
        }
    }

    @discardableResult
    public func start(containerID: UUID) -> ContainerSummary? {
        update(containerID: containerID, status: .running)
    }

    @discardableResult
    public func stop(containerID: UUID) -> ContainerSummary? {
        update(containerID: containerID, status: .stopped)
    }

    @discardableResult
    public func restart(containerID: UUID) -> ContainerSummary? {
        _ = stop(containerID: containerID)
        return start(containerID: containerID)
    }

    public func export(to store: AnyContainerStore) {
        store.replaceAll(with: list())
    }

    private func update(containerID: UUID, status: ContainerSummary.Status) -> ContainerSummary? {
        lock.withLock {
            guard var container = containers[containerID] else { return nil }
            container.status = status
            containers[containerID] = container
            return container
        }
    }
}

public protocol AnyContainerStore {
    func fetchAll() -> [ContainerSummary]
    func replaceAll(with summaries: [ContainerSummary])
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
}
