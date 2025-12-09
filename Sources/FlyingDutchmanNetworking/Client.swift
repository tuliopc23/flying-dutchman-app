import Foundation
import Shared
import FlyingDutchmanContainers

public enum EngineClient {
    public static func fetchHealth() async throws -> EngineStatus {
        let (data, response) = try await URLSession.shared.data(from: AppConfig.Engine.healthURL)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatus.self, from: data)
    }

    public static func fetchStatus() async throws -> EngineStatusDetail {
        let url = URL(string: "http://\(AppConfig.Engine.host):\(AppConfig.Engine.port)/status")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatusDetail.self, from: data)
    }

    public static func listContainers() async throws -> [ContainerSummary] {
        let url = URL(string: "http://\(AppConfig.Engine.host):\(AppConfig.Engine.port)/containers")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ContainerSummary].self, from: data)
    }

    public static func startContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "start")
    }

    public static func stopContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "stop")
    }

    private static func mutateContainer(id: UUID, action: String) async throws -> ContainerSummary {
        let url = URL(string: "http://\(AppConfig.Engine.host):\(AppConfig.Engine.port)/containers/\(id.uuidString)/\(action)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }
}
