import Foundation
import NIOConcurrencyHelpers
import Shared
import FlyingDutchmanPersistence

public actor StubContainerRuntime: ContainerRuntimeProtocol {
    public nonisolated var name: String { "Stub Runtime" }
    
    private var containers: [UUID: ContainerSummary]
    private let containerization: ContainerizationClient
    private var logs: [UUID: [String]] = [:]
    private let store: AnyContainerStore?
    private let logStore: (any ContainerLogStoring)?
    public let eventStore: EventRecorder?

    public init(
        store: AnyContainerStore? = nil,
        logStore: (any ContainerLogStoring)? = nil,
        eventStore: EventRecorder? = nil,
        containerization: ContainerizationClient = .shared
    ) {
        let initial: [ContainerSummary]
        if let store = store {
            // Note: Since this is synchronous init, we can't await fetchAll.
            // Assuming store is pre-populated or we load synchronously if possible.
            // For now, use fixtures if empty.
            // FIXME: Store access should be async
            initial = SeedData.sampleContainers 
        } else {
            initial = SeedData.sampleContainers
        }
        
        self.containers = Dictionary(uniqueKeysWithValues: initial.map { ($0.id, $0) })
        self.store = store
        self.logStore = logStore
        self.eventStore = eventStore
        self.containerization = containerization
        
        // Hydrate logs (mock)
        if let logStore {
             let ids = initial.map(\.id)
             for id in ids {
                 logs[id] = logStore.fetch(containerID: id)
             }
        }
    }

    public func listContainers() async throws -> [ContainerSummary] {
        containers.values.sorted { $0.name < $1.name }
    }
    
    public func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary {
        let container = ContainerSummary(
            name: name,
            image: image,
            status: .stopped,
            ports: config.ports ?? []
        )
        containers[container.id] = container
        persist()
        return container
    }

    public func startContainer(id: UUID) async throws -> ContainerSummary {
        guard containers[id] != nil else {
             throw StubError.notFound
        }
        // Simulate startup delay
        try await Task.sleep(nanoseconds: 500_000_000)
        
        if let updated = update(containerID: id, status: .running) {
            return updated
        }
        throw StubError.notFound
    }

    public func stopContainer(id: UUID) async throws -> ContainerSummary {
        guard containers[id] != nil else {
             throw StubError.notFound
        }
        // Simulate shutdown delay
        try await Task.sleep(nanoseconds: 500_000_000)
        
        if let updated = update(containerID: id, status: .stopped) {
            return updated
        }
        throw StubError.notFound
    }
    
    public func removeContainer(id: UUID) async throws {
        containers.removeValue(forKey: id)
        persist()
    }

    public func getContainerLogs(id: UUID) async throws -> AsyncStream<String> {
        let currentLogs = logs[id] ?? ["stub: no logs available"]
        return AsyncStream { continuation in
            for line in currentLogs {
                continuation.yield(line)
            }
            continuation.finish()
        }
    }
    
    public func listImages() async throws -> [ImageSummary] {
        return ContainerFixtures.sampleImages
    }
    
    public func pullImage(reference: String) async throws -> ImageSummary {
        // Simulate pull
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return ContainerFixtures.sampleImages.first { $0.displayName == reference } 
            ?? ImageSummary(name: "stub", tag: "latest", sizeBytes: 100)
    }

    public func eventStream() -> AsyncStream<ContainerEvent> {
        AsyncStream { $0.finish() }
    }

    // MARK: - Helpers

    private func update(containerID: UUID, status: ContainerSummary.Status) -> ContainerSummary? {
        guard var container = containers[containerID] else { return nil }
        container.status = status
        containers[containerID] = container
        
        var containerLogs = logs[containerID] ?? []
        let logLine = "\(Date()): status -> \(status.rawValue)"
        containerLogs.append(logLine)
        logs[containerID] = containerLogs.suffix(200)
        
        logStore?.append(containerID: containerID, line: logLine)
        eventStore?.record(status: status.rawValue, containerId: containerID, image: container.image, kind: "state")
        
        persist()
        return container
    }

    private func persist() {
        guard let store else { return }
        store.replaceAll(with: Array(containers.values))
    }
}

enum StubError: Error {
    case notFound
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

