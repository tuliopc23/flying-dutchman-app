import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func fetchEvents(stream: Bool = false, limit: Int = 50) async throws -> [DockerEvent] {
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

    static func streamRuntimeEvents() -> AsyncThrowingStream<RuntimeEvent, Error> {
        AsyncThrowingStream { [
            configuredHost = AppConfig.Engine.host,
            configuredPort = AppConfig.Engine.port
        ] continuation in
            let baseURL = "http://\(configuredHost):\(configuredPort)"
            let task = Task {
                do {
                    var request = URLRequest(url: URL(string: "\(baseURL)/runtime-events")!)
                    request.setValue("text/event-stream", forHTTPHeaderField: "Accept")
                    let (bytes, response) = try await URLSession.shared.bytes(for: request)
                    guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    let decoder = JSONDecoder()
                    for try await line in bytes.lines {
                        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard trimmed.hasPrefix("data:") else { continue }
                        let payload = trimmed.dropFirst("data:".count).trimmingCharacters(in: .whitespaces)
                        guard !payload.isEmpty else { continue }
                        do {
                            let event = try decoder.decode(RuntimeEvent.self, from: Data(payload.utf8))
                            continuation.yield(event)
                        } catch { continue }
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { _ in task.cancel() }
        }
    }
}
