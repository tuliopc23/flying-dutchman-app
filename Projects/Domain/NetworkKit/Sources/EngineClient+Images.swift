import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func listImages() async throws -> [ImageSummary] {
        let url = URL(string: "\(baseURL)/images")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([ImageSummary].self, from: data)
    }

    @MainActor static func pullImage(reference: String) async throws -> String {
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
        return payload?["message"] as? String ?? "Pull completed"
    }

    @MainActor static func buildImage(_ requestPayload: ImageBuildRequest) async throws -> ImageBuildResult {
        let url = URL(string: "\(baseURL)/images/build")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(requestPayload)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, (200 ..< 300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(ImageBuildResult.self, from: data)
    }
}
