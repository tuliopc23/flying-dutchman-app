import Foundation
import Shared

/// Configuration for creating a container
public struct ContainerConfig: Codable, Sendable {
    public let ports: [String]?
    public let env: [String: String]?
    public let volumes: [String]?
    public let networkMode: String?
    public let cpuLimit: Int?  // millicores (1000 = 1 CPU)
    public let memoryLimit: Int?  // bytes
    public let command: [String]?
    public let workingDir: String?
    
    public init(
        ports: [String]? = nil,
        env: [String: String]? = nil,
        volumes: [String]? = nil,
        networkMode: String? = nil,
        cpuLimit: Int? = nil,
        memoryLimit: Int? = nil,
        command: [String]? = nil,
        workingDir: String? = nil
    ) {
        self.ports = ports
        self.env = env
        self.volumes = volumes
        self.networkMode = networkMode
        self.cpuLimit = cpuLimit
        self.memoryLimit = memoryLimit
        self.command = command
        self.workingDir = workingDir
    }
    
    public static let `default` = ContainerConfig()
}

/// Protocol that all container runtimes must implement
public protocol ContainerRuntimeProtocol: Actor {
    /// Human-readable name of the runtime
    var name: String { get }

    /// List all containers
    func listContainers() async throws -> [ContainerSummary]

    /// Create a new container
    func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary

    /// Start an existing container
    func startContainer(id: UUID) async throws -> ContainerSummary

    /// Stop a running container
    func stopContainer(id: UUID) async throws -> ContainerSummary

    /// Remove a container
    func removeContainer(id: UUID) async throws

    /// Get logs for a container
    func getContainerLogs(id: UUID) async throws -> AsyncStream<String>

    /// Pull an image from a registry
    func pullImage(reference: String) async throws -> ImageSummary

    /// List all images
    func listImages() async throws -> [ImageSummary]

    /// Get a stream of container events (state changes, logs, resource updates)
    func eventStream() -> AsyncStream<ContainerEvent>
}