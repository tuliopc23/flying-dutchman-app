import FlyingDutchmanContainers
import Foundation
import Shared

public enum EngineClient {
    @MainActor private static var configuredHost: String = AppConfig.Engine.host
    @MainActor private static var configuredPort: Int = AppConfig.Engine.port

    @MainActor public static func configure(host: String, port: Int) {
        configuredHost = host
        configuredPort = port
    }

    @MainActor private static var baseURL: String {
        "http://\(configuredHost):\(configuredPort)"
    }

    @MainActor public static func fetchHealth() async throws -> EngineStatus {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "\(baseURL)/health")!)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatus.self, from: data)
    }

    @MainActor public static func fetchStatus() async throws -> EngineStatusDetail {
        let url = URL(string: "\(baseURL)/status")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatusDetail.self, from: data)
    }

    @MainActor public static func getStatus() async throws -> EngineStatusDetail {
        try await fetchStatus()
    }

    @MainActor public static func listContainers() async throws -> [ContainerSummary] {
        let url = URL(string: "\(baseURL)/containers")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ContainerSummary].self, from: data)
    }

    @MainActor public static func createContainer(
        name: String,
        image: String,
        config: ContainerConfig
    ) async throws -> ContainerSummary {
        let url = URL(string: "\(baseURL)/containers/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        struct CreateRequest: Encodable {
            let name: String
            let image: String
            let config: ContainerConfig
        }

        let payload = CreateRequest(name: name, image: image, config: config)
        request.httpBody = try JSONEncoder().encode(payload)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard http.statusCode == 200 || http.statusCode == 201 else {
            // Try to parse error message
            if let errorPayload = try? JSONDecoder().decode([String: String].self, from: data),
               let errorMessage = errorPayload["error"]
            {
                throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: errorMessage])
            }
            throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: "HTTP \(http.statusCode)"])
        }

        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    @MainActor public static func fetchContainer(id: UUID) async throws -> ContainerSummary {
        let url = URL(string: "\(baseURL)/containers/\(id.uuidString)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    @MainActor public static func startContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "start")
    }

    @MainActor public static func stopContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "stop")
    }

    @MainActor public static func restartContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "restart")
    }

    @MainActor public static func removeContainer(id: UUID) async throws {
        let url = URL(string: "\(baseURL)/containers/\(id.uuidString)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200 ..< 300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }

    @MainActor private static func mutateContainer(id: UUID, action: String) async throws -> ContainerSummary {
        let url = URL(string: "\(baseURL)/containers/\(id.uuidString)/\(action)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    @MainActor public static func login(registry: String, username: String, password: String) async throws {
        let url = URL(string: "\(baseURL)/auth/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload: [String: String] = [
            "registry": registry,
            "username": username,
            "password": password,
        ]

        request.httpBody = try JSONEncoder().encode(payload)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard http.statusCode == 200 else {
            // Try to parse error message
            if let errorPayload = try? JSONDecoder().decode([String: String].self, from: data),
               let errorMessage = errorPayload["error"]
            {
                throw AuthenticationError.failed(message: errorMessage)
            }
            throw AuthenticationError.failed(message: "HTTP \(http.statusCode)")
        }
    }

    @MainActor public static func logout(registry: String) async throws {
        let url = URL(string: "\(baseURL)/auth/logout")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload: [String: String] = [
            "registry": registry,
        ]

        request.httpBody = try JSONEncoder().encode(payload)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard http.statusCode == 200 else {
            // Try to parse error message
            if let errorPayload = try? JSONDecoder().decode([String: String].self, from: data),
               let errorMessage = errorPayload["error"]
            {
                throw AuthenticationError.failed(message: errorMessage)
            }
            throw AuthenticationError.failed(message: "HTTP \(http.statusCode)")
        }
    }

    public enum AuthenticationError: Error, LocalizedError {
        case failed(message: String)

        public var errorDescription: String? {
            switch self {
            case let .failed(message):
                "Authentication failed: \(message)"
            }
        }
    }

    @MainActor public static func listImages() async throws -> [ImageSummary] {
        let url = URL(string: "\(baseURL)/images")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ImageSummary].self, from: data)
    }

    @MainActor public static func pullImage(reference: String) async throws -> String {
        let url = URL(string: "\(baseURL)/images/pull")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(["reference": reference])
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200 ..< 300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let payload = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return payload?["message"] as? String ?? "Pull started"
    }

    @MainActor public static func listStacks() async throws -> [StackSummary] {
        let url = URL(string: "\(baseURL)/stacks")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([StackSummary].self, from: data)
    }

    @MainActor public static func createStack(_ request: StackCreateRequest) async throws -> StackSummary {
        let url = URL(string: "\(baseURL)/stacks")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try JSONEncoder().encode(request)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let http = response as? HTTPURLResponse, (200 ..< 300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(StackSummary.self, from: data)
    }

    @MainActor public static func startStack(id: UUID) async throws -> StackActionResponse {
        try await mutateStack(id: id, action: "start")
    }

    @MainActor public static func stopStack(id: UUID) async throws -> StackActionResponse {
        try await mutateStack(id: id, action: "stop")
    }

    @MainActor private static func mutateStack(id: UUID, action: String) async throws -> StackActionResponse {
        let url = URL(string: "\(baseURL)/stacks/\(id.uuidString)/\(action)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200 ..< 300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(StackActionResponse.self, from: data)
    }

    @MainActor public static func listVolumes() async throws -> [VolumeSummary] {
        let url = URL(string: "\(baseURL)/volumes")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([VolumeSummary].self, from: data)
    }

    @MainActor public static func listNetworks() async throws -> [NetworkSummary] {
        let url = URL(string: "\(baseURL)/networks")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([NetworkSummary].self, from: data)
    }

    @MainActor public static func containerLogs(containerID: UUID) async throws -> [String] {
        let url = URL(string: "\(baseURL)/containers/\(containerID.uuidString)/logs")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let text = String(data: data, encoding: .utf8) ?? ""
        return text.split(separator: "\n").map(String.init)
    }

    @MainActor public static func fetchLogs(id: UUID) async throws -> [String] {
        try await containerLogs(containerID: id)
    }

    @MainActor public static func fetchEvents(stream: Bool = false, limit: Int = 50) async throws -> [DockerEvent] {
        var request = URLRequest(url: URL(string: "\(baseURL)/events")!)
        if limit != 50 {
            request.url = URL(string: "\(baseURL)/events?limit=\(limit)")!
        }
        if stream {
            request.setValue("text/event-stream", forHTTPHeaderField: "Accept")
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let text = String(data: data, encoding: .utf8) ?? ""
        let decoder = JSONDecoder()
        return text
            .split(separator: "\n")
            .compactMap { line in
                guard !line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
                return try? decoder.decode(DockerEvent.self, from: Data(line.utf8))
            }
    }

    public static func streamRuntimeEvents() -> AsyncThrowingStream<RuntimeEvent, Error> {
        AsyncThrowingStream { [
            configuredHost = AppConfig.Engine.host,
            configuredPort = AppConfig.Engine.port
        ] continuation in
            let baseURL = "http://\(configuredHost):\(configuredPort)"
            let task = Task {
                do {
                    var request = URLRequest(url: URL(string: "\(baseURL)/runtime-events")!)
                    request.setValue("text/event-stream", forHTTPHeaderField: "Accept")

                    let (bytes, response) = try await URLSession.shared.bytes(for: request)
                    guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }

                    let decoder = JSONDecoder()
                    for try await line in bytes.lines {
                        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard trimmed.hasPrefix("data:") else { continue }
                        let payload = trimmed.dropFirst("data:".count).trimmingCharacters(in: .whitespaces)
                        guard !payload.isEmpty else { continue }
                        do {
                            let event = try decoder.decode(RuntimeEvent.self, from: Data(payload.utf8))
                            continuation.yield(event)
                        } catch {
                            continue
                        }
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }

            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }

    // MARK: - Machine Management

    @MainActor public static func listMachines() async throws -> [Machine] {
        let url = URL(string: "\(baseURL)/machines")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([Machine].self, from: data)
    }

    @MainActor public static func createMachine(name: String, config: MachineConfig) async throws -> Machine {
        let url = URL(string: "\(baseURL)/machines/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        struct CreateRequest: Encodable {
            let name: String
            let config: MachineConfig
        }

        let body = CreateRequest(name: name, config: config)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(Machine.self, from: data)
    }

    @MainActor public static func startMachine(nameOrID: String) async throws -> Machine {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)/start")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(Machine.self, from: data)
    }

    @MainActor public static func stopMachine(nameOrID: String) async throws -> Machine {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)/stop")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(Machine.self, from: data)
    }

    @MainActor public static func restartMachine(nameOrID: String) async throws -> Machine {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)/restart")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(Machine.self, from: data)
    }

    @MainActor public static func deleteMachine(nameOrID: String) async throws {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        let (_, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }

    @MainActor public static func executeMachineCommand(nameOrID: String, command: String) async throws -> String {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)/exec")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        struct ExecRequest: Encodable {
            let command: String
        }

        let body = ExecRequest(command: command)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        struct ExecResponse: Decodable {
            let output: String
        }

        let result = try JSONDecoder().decode(ExecResponse.self, from: data)
        return result.output
    }
}
