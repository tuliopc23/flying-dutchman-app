import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func login(registry: String, username: String, password: String) async throws {
        let url = URL(string: "\(baseURL)/auth/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let payload: [String: String] = ["registry": registry, "username": username, "password": password]
        request.httpBody = try JSONEncoder().encode(payload)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        guard http.statusCode == 200 else {
            if let errorPayload = try? JSONDecoder().decode([String: String].self, from: data),
               let errorMessage = errorPayload["error"]
            {
                throw AuthenticationError.failed(message: errorMessage)
            }
            throw AuthenticationError.failed(message: "HTTP \(http.statusCode)")
        }
    }

    @MainActor static func logout(registry: String) async throws {
        let url = URL(string: "\(baseURL)/auth/logout")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let payload: [String: String] = ["registry": registry]
        request.httpBody = try JSONEncoder().encode(payload)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        guard http.statusCode == 200 else {
            if let errorPayload = try? JSONDecoder().decode([String: String].self, from: data),
               let errorMessage = errorPayload["error"]
            {
                throw AuthenticationError.failed(message: errorMessage)
            }
            throw AuthenticationError.failed(message: "HTTP \(http.statusCode)")
        }
    }
}
