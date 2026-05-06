import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func listVolumes() async throws -> [VolumeSummary] {
        let url = URL(string: "\(baseURL)/volumes")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([VolumeSummary].self, from: data)
    }

    @MainActor static func listNetworks() async throws -> [NetworkSummary] {
        let url = URL(string: "\(baseURL)/networks")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([NetworkSummary].self, from: data)
    }
}
