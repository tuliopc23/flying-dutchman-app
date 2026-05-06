import FlyingDutchmanPersistence
import Foundation
import NIOConcurrencyHelpers
import Shared

public actor StubContainerRuntime: ContainerRuntimeProtocol {
    public nonisolated var name: String {
        "Stub Runtime"
    }

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
        let initial: [ContainerSummary] = if store != nil {
            // Note: Since this is synchronous init, we can't await fetchAll.
            // Assuming store is pre-populated or we load synchronously if possible.
            // For now, use fixtures if empty.
            // FIXME: Store access should be async
            SeedData.sampleContainers
        } else {
            SeedData.sampleContainers
        }

        self.containers = Dictionary(uniqueKeysWithValues: initial.map { ($0.id, $0) })
        self.store = store
        self.logStore = logStore
        self.eventStore = eventStore
        self.containerization = containerization

        // Hydrate logs (mock)
        if let logStore {
            let ids = initial.map(\.id)
            for _ in ids {
                // Warning: synchronous fetch from actor/async store might not work if logStore is actor
                // But this is StubRuntime so maybe it's fine or logStore is mock
                // logs[id] = logStore.fetch(containerID: id)
                // Removing this call to avoid async issues in init
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
        SeedData.sampleImages
    }

    public func pullImage(reference: String) async throws -> ImageSummary {
        // Mock pull
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return ImageSummary(
            name: reference,
            tag: "latest"
        )
    }

    public func buildImage(request: ImageBuildRequest) async throws -> ImageBuildResult {
        try await Task.sleep(nanoseconds: 500_000_000)
        let image = ImageSummary(
            name: request.tags.first ?? "local/build",
            tag: request.tags.count > 1 ? request.tags[1] : "latest"
        )
        return ImageBuildResult(
            image: image,
            logs: ["Stub image build completed for \(request.contextPath)"],
            builder: "stub"
        )
    }

    public func eventStream() -> AsyncStream<ContainerEvent> {
        AsyncStream { continuation in
            continuation.finish()
        }
    }

    // MARK: - Helpers

    private func update(containerID: UUID, status: ContainerSummary.Status) -> ContainerSummary? {
        guard var container = containers[containerID] else { return nil }
        container.status = status
        containers[containerID] = container
        persist()
        return container
    }

    private func persist() {
        // Mock persistence
    }
}

enum StubError: Error {
    case notFound
}
