import Foundation
import Shared
import FlyingDutchmanPersistence

/// Adapter that attempts to use the `container` CLI for basic lifecycle operations.
/// Falls back to in-memory fixtures when the CLI is unavailable or returns errors.
public actor ContainerCLIRuntime: ContainerRuntimeProtocol {
    public nonisolated var name: String { "CLI Runtime" }
    
    private let cliPath: String
    private let fallback: StubContainerRuntime
    public let eventStore: EventRecorder?

    public init?(store: AnyContainerStore? = nil, logStore: (any ContainerLogStoring)? = nil, eventStore: EventRecorder? = nil) {
        let path = ProcessInfo.processInfo.environment["FD_CONTAINER_CLI"] ?? "/usr/bin/container"
        guard FileManager.default.isExecutableFile(atPath: path) else { return nil }
        cliPath = path
        self.eventStore = eventStore
        fallback = StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
    }

    public func listContainers() async throws -> [ContainerSummary] {
        if let data = runCLI(args: ["list", "--format", "json"]),
           let decoded = try? JSONDecoder().decode([CLISummary].self, from: data) {
            return decoded.map { $0.toSummary() }
        }
        return try await fallback.listContainers()
    }

    public func startContainer(id: UUID) async throws -> ContainerSummary {
        if runCLI(args: ["start", id.uuidString]) != nil {
             if let container = try? await fetch(containerID: id) {
                 return container
             }
        }
        return try await fallback.startContainer(id: id)
    }

    public func stopContainer(id: UUID) async throws -> ContainerSummary {
        if runCLI(args: ["stop", id.uuidString]) != nil {
             if let container = try? await fetch(containerID: id) {
                 return container
             }
        }
        return try await fallback.stopContainer(id: id)
    }
    
    public func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary {
        // CLI create support TBD
        return try await fallback.createContainer(name: name, image: image, config: config)
    }
    
    public func removeContainer(id: UUID) async throws {
        _ = runCLI(args: ["rm", id.uuidString])
        try await fallback.removeContainer(id: id)
    }

    public func getContainerLogs(id: UUID) async throws -> AsyncStream<String> {
        if let data = runCLI(args: ["logs", id.uuidString]) {
            let lines = String(decoding: data, as: UTF8.self)
                .split(separator: "\n")
                .map(String.init)
            
            return AsyncStream { continuation in
                for line in lines {
                    continuation.yield(line)
                }
                continuation.finish()
            }
        }
        return try await fallback.getContainerLogs(id: id)
    }
    
    public func listImages() async throws -> [ImageSummary] {
        return try await fallback.listImages()
    }
    
    public func pullImage(reference: String) async throws -> ImageSummary {
        return try await fallback.pullImage(reference: reference)
    }

    public func eventStream() -> AsyncStream<ContainerEvent> {
        AsyncStream { $0.finish() }
    }

    // MARK: - Helpers

    private func fetch(containerID: UUID) async throws -> ContainerSummary? {
        (try await listContainers()).first { $0.id == containerID }
    }

    private func runCLI(args: [String]) -> Data? {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: cliPath)
        process.arguments = args

        let stdout = Pipe()
        let stderr = Pipe()
        process.standardOutput = stdout
        process.standardError = stderr

        do {
            try process.run()
            process.waitUntilExit()
            guard process.terminationStatus == 0 else { return nil }
            return stdout.fileHandleForReading.readDataToEndOfFile()
        } catch {
            return nil
        }
    }

    private struct CLISummary: Decodable {
        let id: String
        let name: String
        let image: String
        let status: String
        let ports: [String]?

        func toSummary() -> ContainerSummary {
            ContainerSummary(
                id: UUID(uuidString: id) ?? UUID(),
                name: name,
                image: image,
                status: ContainerSummary.Status(rawValue: status) ?? .stopped,
                ports: ports ?? []
            )
        }
    }
}