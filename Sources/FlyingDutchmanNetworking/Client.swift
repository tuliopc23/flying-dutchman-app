import Foundation
import Shared

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
}
