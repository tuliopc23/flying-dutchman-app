import ArgumentParser
import FlyingDutchmanNetworking
import Foundation
import Shared

struct Events: AsyncParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Show recent runtime events")

    @Flag(help: "Output as JSON")
    var json: Bool = false
    @Flag(help: "Stream as SSE (Accept: text/event-stream)")
    var stream: Bool = false
    @Option(help: "Limit events returned (default 50)")
    var limit: Int = 50

    func run() async throws {
        do {
            if stream {
                try await streamEvents()
            } else {
                let events = try await collectEvents(limit: max(0, limit))
                if json {
                    CLIOutput.json(events)
                } else {
                    CLIOutput.section("Runtime Events")
                    for event in events {
                        CLIOutput.line(event.id, formatSummary(event))
                    }
                }
            }
        } catch {
            CLIOutput.warn("Events", "Failed to fetch events: \(error.localizedDescription)")
            CLIOutput.hint("Requires engine reachable on /runtime-events")
        }
    }

    private func collectEvents(limit: Int) async throws -> [RuntimeEvent] {
        guard limit > 0 else { return [] }
        var collected: [RuntimeEvent] = []
        for try await event in EngineClient.streamRuntimeEvents() {
            collected.append(event)
            if collected.count >= limit {
                break
            }
        }
        return collected
    }

    private func streamEvents() async throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        CLIOutput.section("Runtime Events (Streaming)")
        for try await event in EngineClient.streamRuntimeEvents() {
            if json {
                if let data = try? encoder.encode(event), let line = String(data: data, encoding: .utf8) {
                    print(line)
                }
            } else {
                CLIOutput.line(event.id, formatSummary(event))
            }
        }
    }

    private func formatSummary(_ event: RuntimeEvent) -> String {
        let timestamp = Self.timestampFormatter.string(from: event.timestamp)
        let detail: String
        switch event.type {
        case let .stateChanged(from, to):
            detail = "state \(from.displayName) -> \(to.displayName)"
        case let .logOutput(message):
            detail = "log \(truncate(message, limit: 160))"
        case let .resourceUpdate(info):
            let memoryMB = Double(info.memoryBytes) / 1024 / 1024
            detail = String(format: "cpu %.1f%% mem %.0fMB (%.1f%%)", info.cpuPercent, memoryMB, info.memoryPercent)
        }
        return "\(timestamp) · \(event.containerId) · \(detail)"
    }

    private func truncate(_ value: String, limit: Int) -> String {
        guard value.count > limit else { return value }
        let index = value.index(value.startIndex, offsetBy: limit)
        return String(value[..<index]) + "..."
    }

    private nonisolated(unsafe) static let timestampFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter
    }()
}
