import Dependencies
import Foundation
import FlyingDutchmanPersistence

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

// MARK: - Protocol Definition

public protocol ContainerRuntimeProtocol: Sendable {
    func listContainers() async throws -> [ContainerSummary]
    func startContainer(id: UUID) async throws -> ContainerSummary
    func stopContainer(id: UUID) async throws -> ContainerSummary
    func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary
}

// MARK: - Helper Types

public struct ContainerConfig: Codable, Sendable {
    public var ports: [String]?
    public init(ports: [String]? = nil) {
        self.ports = ports
    }
}

// MARK: - Mock Implementations

public final class MockRuntime: ContainerRuntimeProtocol, @unchecked Sendable {
    public init() {}
    public func listContainers() async throws -> [ContainerSummary] {
        [ContainerSummary(name: "mock-nginx", image: "nginx:latest", status: .running, ports: ["80:80"])]
    }
    public func startContainer(id: UUID) async throws -> ContainerSummary { throw fatalError("Mock") }
    public func stopContainer(id: UUID) async throws -> ContainerSummary { throw fatalError("Mock") }
    public func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary { throw fatalError("Mock") }
}

public final class UnimplementedRuntime: ContainerRuntimeProtocol, @unchecked Sendable {
    public init() {}
    public func listContainers() async throws -> [ContainerSummary] { fatalError() }
    public func startContainer(id: UUID) async throws -> ContainerSummary { fatalError() }
    public func stopContainer(id: UUID) async throws -> ContainerSummary { fatalError() }
    public func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary { fatalError() }
}
