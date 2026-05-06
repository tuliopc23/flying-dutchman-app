import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func listContainers() async throws -> [ContainerSummary] {
        let url = URL(string: "\(baseURL)/containers")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ContainerSummary].self, from: data)
    }

    @MainActor static func createContainer(
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
            if let errorPayload = try? JSONDecoder().decode([String: String].self, from: data),
               let errorMessage = errorPayload["error"] {
                throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: errorMessage])
            }
            throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: "HTTP \(http.statusCode)"])
        }
        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    @MainActor static func fetchContainer(id: UUID) async throws -> ContainerSummary {
        let url = URL(string: "\(baseURL)/containers/\(id.uuidString)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ContainerSummary.self, from: data)
    }

    @MainActor static func startContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "start")
    }

    @MainActor static func stopContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "stop")
    }

    @MainActor static func restartContainer(id: UUID) async throws -> ContainerSummary {
        try await mutateContainer(id: id, action: "restart")
    }

    @MainActor static func removeContainer(id: UUID) async throws {
        let url = URL(string: "\(baseURL)/containers/\(id.uuidString)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200 ..< 300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }

    @MainActor static func containerLogs(containerID: UUID) async throws -> [String] {
        let url = URL(string: "\(baseURL)/containers/\(containerID.uuidString)/logs")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let text = String(data: data, encoding: .utf8) ?? ""
        return text.split(separator: "\n").map(String.init)
    }

    @MainActor static func fetchLogs(id: UUID) async throws -> [String] {
        try await containerLogs(containerID: id)
    }

    // MARK: - Private

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
}
