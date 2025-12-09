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
}
