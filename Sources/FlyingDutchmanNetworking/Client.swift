import Foundation
import Shared
import FlyingDutchmanContainers

public enum EngineClient {
    private static var configuredHost: String = AppConfig.Engine.host
    private static var configuredPort: Int = AppConfig.Engine.port

    public static func configure(host: String, port: Int) {
        configuredHost = host
        configuredPort = port
    }

    private static var baseURL: String {
        "http://\(configuredHost):\(configuredPort)"
    }

    public static func fetchHealth() async throws -> EngineStatus {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "\(baseURL)/health")!)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatus.self, from: data)
    }

    public static func fetchStatus() async throws -> EngineStatusDetail {
        let url = URL(string: "\(baseURL)/status")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatusDetail.self, from: data)
    }

    public static func listContainers() async throws -> [ContainerSummary] {
        let url = URL(string: "\(baseURL)/containers")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ContainerSummary].self, from: data)
    }

    public static func fetchContainer(id: UUID) async throws -> ContainerSummary {
        let url = URL(string: "\(baseURL)/containers/\(id.uuidString)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    public static func startContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "start")
    }

    public static func stopContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "stop")
    }

    public static func restartContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "restart")
    }

    private static func mutateContainer(id: UUID, action: String) async throws -> ContainerSummary {
        let url = URL(string: "\(baseURL)/containers/\(id.uuidString)/\(action)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    public static func listImages() async throws -> [ImageSummary] {
        let url = URL(string: "\(baseURL)/images")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ImageSummary].self, from: data)
    }

    public static func pullImage(reference: String) async throws -> String {
        let url = URL(string: "\(baseURL)/images/pull")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(["reference": reference])
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let payload = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return payload?["message"] as? String ?? "Pull started"
    }

    public static func listStacks() async throws -> [StackSummary] {
        let url = URL(string: "\(baseURL)/stacks")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([StackSummary].self, from: data)
    }

    public static func createStack(_ request: StackCreateRequest) async throws -> StackSummary {
        let url = URL(string: "\(baseURL)/stacks")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try JSONEncoder().encode(request)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(StackSummary.self, from: data)
    }

    public static func startStack(id: UUID) async throws -> StackActionResponse {
        try await mutateStack(id: id, action: "start")
    }

    public static func stopStack(id: UUID) async throws -> StackActionResponse {
        try await mutateStack(id: id, action: "stop")
    }

    private static func mutateStack(id: UUID, action: String) async throws -> StackActionResponse {
        let url = URL(string: "\(baseURL)/stacks/\(id.uuidString)/\(action)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(StackActionResponse.self, from: data)
    }

    public static func listVolumes() async throws -> [VolumeSummary] {
        let url = URL(string: "\(baseURL)/volumes")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([VolumeSummary].self, from: data)
    }

    public static func listNetworks() async throws -> [NetworkSummary] {
        let url = URL(string: "\(baseURL)/networks")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([NetworkSummary].self, from: data)
    }

    public static func containerLogs(containerID: UUID) async throws -> [String] {
        let url = URL(string: "\(baseURL)/containers/\(containerID.uuidString)/logs")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let text = String(data: data, encoding: .utf8) ?? ""
        return text.split(separator: "\n").map(String.init)
    }
    
    public static func fetchLogs(id: UUID) async throws -> [String] {
        try await containerLogs(containerID: id)
    }

    public static func fetchEvents(stream: Bool = false, limit: Int = 50) async throws -> [DockerEvent] {
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
}
