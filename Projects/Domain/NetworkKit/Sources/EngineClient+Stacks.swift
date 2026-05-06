import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func listStacks() async throws -> [StackSummary] {
        let url = URL(string: "\(baseURL)/stacks")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([StackSummary].self, from: data)
    }

    @MainActor static func createStack(_ request: StackCreateRequest) async throws -> StackSummary {
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

    @MainActor static func startStack(id: UUID) async throws -> StackActionResponse {
        try await mutateStack(id: id, action: "start")
    }

    @MainActor static func stopStack(id: UUID) async throws -> StackActionResponse {
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
}
