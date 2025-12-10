import Foundation
import Shared

/// Adapter that attempts to use the `container` CLI for basic lifecycle operations.
/// Falls back to in-memory fixtures when the CLI is unavailable or returns errors.
public final class ContainerCLIRuntime: ContainerRuntimeProtocol {
    public let mode: ContainerRuntime.Mode = .containerization
    public let eventStore: EventRecorder?

    private let cliPath: String
    private let fallback: ContainerRuntime

    public init?(store: AnyContainerStore? = nil, logStore: ContainerLogStore? = nil, eventStore: EventRecorder? = nil) {
        let path = ProcessInfo.processInfo.environment["FD_CONTAINER_CLI"] ?? "/usr/bin/container"
        guard FileManager.default.isExecutableFile(atPath: path) else { return nil }
        cliPath = path
        self.eventStore = eventStore
        fallback = ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
    }

    public func list() -> [ContainerSummary] {
        if let data = runCLI(args: ["list", "--format", "json"]),
           let decoded = try? JSONDecoder().decode([CLISummary].self, from: data) {
            return decoded.map { $0.toSummary() }
        }
        return fallback.list()
    }

    @discardableResult
    public func start(containerID: UUID) -> ContainerSummary? {
        guard runCLI(args: ["start", containerID.uuidString]) != nil else {
            return fallback.start(containerID: containerID)
        }
        return fetch(containerID: containerID) ?? fallback.start(containerID: containerID)
    }

    @discardableResult
    public func stop(containerID: UUID) -> ContainerSummary? {
        guard runCLI(args: ["stop", containerID.uuidString]) != nil else {
            return fallback.stop(containerID: containerID)
        }
        return fetch(containerID: containerID) ?? fallback.stop(containerID: containerID)
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
        fallback.importContainer(container)
    }

    public func logs(for id: UUID) -> [String] {
        if let data = runCLI(args: ["logs", id.uuidString]) {
            return String(decoding: data, as: UTF8.self)
                .split(separator: "\n")
                .map(String.init)
        }
        return fallback.logs(for: id)
    }

    public func workerStatuses() -> [String: String] {
        ["containerization": "cli"]
    }

    // MARK: - Helpers

    private func fetch(containerID: UUID) -> ContainerSummary? {
        list().first { $0.id == containerID }
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
