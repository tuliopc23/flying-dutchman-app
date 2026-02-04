import Dependencies
import Foundation

// MARK: - Dependency Keys

public enum ContainerRuntimeKey: DependencyKey {
    public static let liveValue: any ContainerRuntimeProtocol = {
        // This will be initialized in the Engine
        fatalError("Runtime must be registered at engine startup")
    }()
    
    public static let testValue: any ContainerRuntimeProtocol = UnimplementedRuntime()
    public static let previewValue: any ContainerRuntimeProtocol = MockRuntime()
}

public extension DependencyValues {
    var containerRuntime: any ContainerRuntimeProtocol {
        get { self[ContainerRuntimeKey.self] }
        set { self[ContainerRuntimeKey.self] = newValue }
    }
}

// MARK: - Mock Implementations

public actor MockRuntime: ContainerRuntimeProtocol {
    public nonisolated let name = "Mock"
    
    public init() {}
    public func listContainers() async throws -> [ContainerSummary] {
        [ContainerSummary(name: "mock-nginx", image: "nginx:latest", status: .running, ports: ["80:80"])]
    }
    public func startContainer(id: UUID) async throws -> ContainerSummary { throw fatalError("Mock") }
    public func stopContainer(id: UUID) async throws -> ContainerSummary { throw fatalError("Mock") }
    public func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary { throw fatalError("Mock") }
    public func removeContainer(id: UUID) async throws { throw fatalError("Mock") }
    public func getContainerLogs(id: UUID) async throws -> AsyncStream<String> { throw fatalError("Mock") }
    public func pullImage(reference: String) async throws -> ImageSummary { throw fatalError("Mock") }
    public func listImages() async throws -> [ImageSummary] { [] }
    public func eventStream() -> AsyncStream<ContainerEvent> { AsyncStream { $0.finish() } }
}

public actor UnimplementedRuntime: ContainerRuntimeProtocol {
    public nonisolated let name = "Unimplemented"
    public init() {}
    public func listContainers() async throws -> [ContainerSummary] { fatalError() }
    public func startContainer(id: UUID) async throws -> ContainerSummary { fatalError() }
    public func stopContainer(id: UUID) async throws -> ContainerSummary { fatalError() }
    public func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary { fatalError() }
    public func removeContainer(id: UUID) async throws { fatalError() }
    public func getContainerLogs(id: UUID) async throws -> AsyncStream<String> { fatalError() }
    public func pullImage(reference: String) async throws -> ImageSummary { fatalError() }
    public func listImages() async throws -> [ImageSummary] { fatalError() }
    public func eventStream() -> AsyncStream<ContainerEvent> { fatalError() }
}
