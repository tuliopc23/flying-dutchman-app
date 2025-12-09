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

    public static func fetchContainer(id: UUID) async throws -> ContainerSummary {
        let url = URL(string: "http://\(AppConfig.Engine.host):\(AppConfig.Engine.port)/containers/\(id.uuidString)")!
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
        let url = URL(string: "http://\(AppConfig.Engine.host):\(AppConfig.Engine.port)/containers/\(id.uuidString)/\(action)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    public static func listImages() async throws -> [ImageSummary] {
        let url = URL(string: "http://\(AppConfig.Engine.host):\(AppConfig.Engine.port)/images")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ImageSummary].self, from: data)
    }

    public static func listStacks() async throws -> [StackSummary] {
        let url = URL(string: "http://\(AppConfig.Engine.host):\(AppConfig.Engine.port)/stacks")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([StackSummary].self, from: data)
    }
}
