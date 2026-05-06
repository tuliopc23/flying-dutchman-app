import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func fetchHealth() async throws -> EngineStatus {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "\(baseURL)/health")!)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatus.self, from: data)
    }

    @MainActor static func fetchStatus() async throws -> EngineStatusDetail {
        let url = URL(string: "\(baseURL)/status")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(EngineStatusDetail.self, from: data)
    }

    @MainActor static func getStatus() async throws -> EngineStatusDetail {
        try await fetchStatus()
    }
}
