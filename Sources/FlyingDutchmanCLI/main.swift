import Foundation
import ArgumentParser
import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking

@main
struct FlyingDutchmanCLI: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "flyingdutchman",
        abstract: "Flying Dutchman CLI (foundation stub)",
        version: AppConfig.version,
        subcommands: [Version.self, Doctor.self, Containers.self, Images.self, Stacks.self, Volumes.self, Networks.self, Events.self]
    )
}

struct Version: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Show version")
    func run() throws {
        CLIOutput.section("Flying Dutchman")
        CLIOutput.line("Version", AppConfig.version)
    }
}

struct Doctor: AsyncParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Show diagnostics")
    @Flag(help: "Output as JSON")
    var json: Bool = false
    func run() async throws {
        let report = await DoctorReport.fetch()
        if json {
            CLIOutput.json(report)
        } else {
            CLIOutput.section("Platform")
            if report.platform.isSupported {
                CLIOutput.line("Compatibility", report.platform.message)
            } else {
                CLIOutput.warn("Compatibility", report.platform.message)
            }
            if report.containerization.status == "ok" {
                CLIOutput.line("Containerization", "\(report.containerization.status) – \(report.containerization.message)")
            } else {
                CLIOutput.warn("Containerization", "\(report.containerization.status) – \(report.containerization.message)")
            }
            CLIOutput.line("container CLI", "\(report.containerTool.status) – \(report.containerTool.message)")

            CLIOutput.section("Engine")
            if let health = report.http {
                CLIOutput.line("HTTP", "\(health.status) – engine: \(health.engine)")
            } else if let error = report.httpError {
                CLIOutput.warn("HTTP", error)
            }

            if let detail = report.detail {
                CLIOutput.line("Uptime", "\(detail.uptimeSeconds)s")
                CLIOutput.line("Workers", detail.workers.isEmpty ? "unknown" : detail.workers.map { "\($0.key)=\($0.value)" }.joined(separator: ", "))
                if let mode = detail.mode {
                    CLIOutput.line("Runtime", "containerization=\(mode)")
                }
            }

            if let xpc = report.xpc {
                CLIOutput.line("XPC", xpc.engine)
            } else if let error = report.xpcError {
                CLIOutput.warn("XPC", error)
            }

            if !report.platform.isSupported {
                CLIOutput.hint("Run on macOS 15+ Apple Silicon to match Tahoe requirements.")
            }
        }
    }
}

struct Containers: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Container operations",
        subcommands: [List.self, Start.self, Stop.self, Restart.self, Logs.self],
        defaultSubcommand: List.self
    )
}

extension Containers {
    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List containers")
        @Flag(help: "Output as JSON")
        var json: Bool = false

        func run() async throws {
            let data = await ContainerData.fetch()
            if let warning = data.warning {
                CLIOutput.warn("Engine", warning)
            }

            if json {
                CLIOutput.json(data.containers)
            } else {
                CLIOutput.section(data.engineReachable ? "Containers" : "Containers (mock)")
                CLIOutput.table(
                    headers: ["Name", "Image", "Status", "Ports"],
                    rows: data.containers.map { container in
                        let ports = container.ports.joined(separator: ", ")
                        return [
                            container.name,
                            container.image,
                            container.status.rawValue,
                            ports.isEmpty ? "—" : ports
                        ]
                    }
                )
            }

            if !data.engineReachable {
                CLIOutput.hint("Mock data shown. Start FlyingDutchmanEngine for live data.")
            }
        }
    }

    struct Start: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Start a container by id or name")

        @Argument(help: "Container UUID or name")
        var identifier: String

        func run() async throws {
            let data = await ContainerData.fetch()
            guard let target = data.resolve(identifier: identifier) else {
                let available = data.containers.map(\.name).joined(separator: ", ")
                throw ValidationError("Container '\(identifier)' not found (available: \(available))")
            }

            do {
                let updated = try await EngineClient.startContainer(id: target.id)
                CLIOutput.line("Started", "\(updated.name) (\(updated.id.uuidString.prefix(8)))")
            } catch {
                if !data.engineReachable {
                    CLIOutput.warn("Engine", "Unreachable. Showing mock data.")
                }
                CLIOutput.warn("Start", "Failed to start \(target.name): \(error.localizedDescription)")
            }
        }
    }

    struct Stop: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Stop a container by id or name")

        @Argument(help: "Container UUID or name")
        var identifier: String

        func run() async throws {
            let data = await ContainerData.fetch()
            guard let target = data.resolve(identifier: identifier) else {
                let available = data.containers.map(\.name).joined(separator: ", ")
                throw ValidationError("Container '\(identifier)' not found (available: \(available))")
            }

            do {
                let updated = try await EngineClient.stopContainer(id: target.id)
                CLIOutput.line("Stopped", "\(updated.name) (\(updated.id.uuidString.prefix(8)))")
            } catch {
                if !data.engineReachable {
                    CLIOutput.warn("Engine", "Unreachable. Showing mock data.")
                }
                CLIOutput.warn("Stop", "Failed to stop \(target.name): \(error.localizedDescription)")
            }
        }
    }

    struct Restart: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Restart a container by id or name")

        @Argument(help: "Container UUID or name")
        var identifier: String

        func run() async throws {
            let data = await ContainerData.fetch()
            guard let target = data.resolve(identifier: identifier) else {
                let available = data.containers.map(\.name).joined(separator: ", ")
                throw ValidationError("Container '\(identifier)' not found (available: \(available))")
            }

            do {
                let updated = try await EngineClient.restartContainer(id: target.id)
                CLIOutput.line("Restarted", "\(updated.name) (\(updated.id.uuidString.prefix(8)))")
            } catch {
                if !data.engineReachable {
                    CLIOutput.warn("Engine", "Unreachable. Showing mock data.")
                }
                CLIOutput.warn("Restart", "Failed to restart \(target.name): \(error.localizedDescription)")
            }
        }
    }

    struct Logs: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Fetch container logs (stubbed if engine offline)")

        @Argument(help: "Container UUID or name")
        var identifier: String

        @Flag(help: "Output logs as JSON array")
        var json: Bool = false

        func run() async throws {
            let data = await ContainerData.fetch()
            guard let target = data.resolve(identifier: identifier) else {
                let available = data.containers.map(\.name).joined(separator: ", ")
                throw ValidationError("Container '\(identifier)' not found (available: \(available))")
            }

            do {
                let lines = try await EngineClient.fetchLogs(id: target.id)
                if json {
                    let jsonData = try JSONSerialization.data(withJSONObject: lines, options: [.prettyPrinted])
                    if let string = String(data: jsonData, encoding: .utf8) {
                        print(string)
                    }
                } else {
                    lines.forEach { print($0) }
                }
            } catch {
                CLIOutput.warn("Logs", "Failed to fetch logs: \(error.localizedDescription)")
                CLIOutput.hint("Stub mode returns local shim logs only.")
            }
        }
    }
}

private struct ContainerData {
    let containers: [ContainerSummary]
    let engineReachable: Bool
    let warning: String?

    func resolve(identifier: String) -> ContainerSummary? {
        if let uuid = UUID(uuidString: identifier) {
            return containers.first { $0.id == uuid }
        }
        return containers.first { $0.name.lowercased() == identifier.lowercased() }
    }

    static func fetch() async -> ContainerData {
        do {
            let containers = try await EngineClient.listContainers()
            return ContainerData(containers: containers, engineReachable: true, warning: nil)
        } catch {
            let warning = "Unreachable. \(error.localizedDescription)"
            return ContainerData(containers: ContainerFixtures.sampleContainers, engineReachable: false, warning: warning)
        }
    }
}

struct Images: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Image operations",
        subcommands: [List.self, Pull.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List images (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let images = try await EngineClient.listImages()
                if json {
                    CLIOutput.json(images)
                } else {
                    CLIOutput.section("Images")
                    CLIOutput.table(headers: ["Name", "Tag", "Digest", "Size"], rows: images.map { img in
                        [
                            img.name,
                            img.tag,
                            img.digest ?? "—",
                            img.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—"
                        ]
                    })
                }
            } catch {
                CLIOutput.warn("Images", "Unreachable. Showing mock data.")
                let fallback = ContainerFixtures.sampleImages
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(headers: ["Name", "Tag", "Digest", "Size"], rows: fallback.map { img in
                        [
                            img.name,
                            img.tag,
                            img.digest ?? "—",
                            img.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—"
                        ]
                    })
                }
            }
        }
    }

    struct Pull: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Pull an image reference (stubbed)")

        @Argument(help: "Image reference, e.g., ghcr.io/fd/api:dev")
        var reference: String

        func run() async throws {
            do {
                let message = try await EngineClient.pullImage(reference: reference)
                CLIOutput.line("Pull", message)
            } catch {
                CLIOutput.warn("Pull", "Failed to start pull: \(error.localizedDescription)")
                CLIOutput.hint("Ensure engine is running; stub mode does not pull real bytes.")
            }
        }
    }
}

struct Stacks: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Stack operations",
        subcommands: [List.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List stacks (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let stacks = try await EngineClient.listStacks()
                if json {
                    CLIOutput.json(stacks)
                } else {
                    CLIOutput.section("Stacks")
                    CLIOutput.table(headers: ["Name", "Description", "Containers"], rows: stacks.map { stack in
                        [
                            stack.name,
                            stack.description ?? "—",
                            stack.containerNames.isEmpty ? "—" : stack.containerNames.joined(separator: ", ")
                        ]
                    })
                }
            } catch {
                CLIOutput.warn("Stacks", "Unreachable. Showing mock data.")
                let fallback = ContainerFixtures.sampleStacks
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(headers: ["Name", "Description", "Containers"], rows: fallback.map { stack in
                        [
                            stack.name,
                            stack.description ?? "—",
                            stack.containerNames.isEmpty ? "—" : stack.containerNames.joined(separator: ", ")
                        ]
                    })
                }
            }
        }
    }
}

struct Volumes: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Volume operations",
        subcommands: [List.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List volumes (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let volumes = try await EngineClient.listVolumes()
                if json {
                    CLIOutput.json(volumes)
                } else {
                    CLIOutput.section("Volumes")
                    CLIOutput.table(
                        headers: ["Name", "Mount", "Size"],
                        rows: volumes.map { volume in
                            let size = volume.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—"
                            return [volume.name, volume.mountPath, size]
                        }
                    )
                }
            } catch {
                CLIOutput.warn("Volumes", "Unreachable. Showing mock data.")
                let fallback = ContainerFixtures.sampleVolumes
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(
                        headers: ["Name", "Mount", "Size"],
                        rows: fallback.map { volume in
                            let size = volume.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—"
                            return [volume.name, volume.mountPath, size]
                        }
                    )
                }
            }
        }
    }
}

struct Networks: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Network operations",
        subcommands: [List.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List networks (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let networks = try await EngineClient.listNetworks()
                if json {
                    CLIOutput.json(networks)
                } else {
                    CLIOutput.section("Networks")
                    CLIOutput.table(
                        headers: ["Name", "Subnet", "Containers"],
                        rows: networks.map { network in
                            let count = network.connectedContainerIDs.count
                            return [network.name, network.subnet ?? "—", count == 0 ? "—" : "\(count)"]
                        }
                    )
                }
            } catch {
                CLIOutput.warn("Networks", "Unreachable. Showing mock data.")
                let fallback = ContainerFixtures.sampleNetworks
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(
                        headers: ["Name", "Subnet", "Containers"],
                        rows: fallback.map { network in
                            [network.name, network.subnet ?? "—", network.connectedContainerIDs.isEmpty ? "—" : "\(network.connectedContainerIDs.count)"]
                        }
                    )
                }
            }
        }
    }
}

struct Events: AsyncParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Show recent engine/shim events (stub)")

    @Flag(help: "Output as JSON")
    var json: Bool = false
    @Flag(help: "Stream as SSE (Accept: text/event-stream)")
    var stream: Bool = false
    @Option(help: "Limit events returned (default 50)")
    var limit: Int = 50

    func run() async throws {
        do {
            let events = try await EngineClient.fetchEvents(stream: stream, limit: limit)
            if json {
                CLIOutput.json(events)
            } else {
                CLIOutput.section("Events")
                for event in events {
                    CLIOutput.line(event.id, "\(event.action) · \(event.status) · \(event.time)")
                }
            }
        } catch {
            CLIOutput.warn("Events", "Failed to fetch events: \(error.localizedDescription)")
            CLIOutput.hint("Requires engine/shim reachable on /events")
        }
    }
}

private enum CLIOutput {
    static func section(_ title: String) {
        print("\n\(title.uppercased())")
        print(String(repeating: "-", count: max(8, title.count)))
    }

    static func line(_ key: String, _ value: String) {
        print("• \(key): \(value)")
    }

    static func warn(_ key: String, _ value: String) {
        fputs("[warn] \(key): \(value)\n", stderr)
    }

    static func hint(_ text: String) {
        print("Hint: \(text)")
    }

    static func table(headers: [String], rows: [[String]]) {
        let columnWidths: [Int] = headers.indices.map { idx in
            let widestRow = rows.map { row -> Int in
                guard row.indices.contains(idx) else { return 0 }
                return row[idx].count
            }.max() ?? 0
            return max(headers[idx].count, widestRow)
        }

        let headerRow = headers.enumerated().map { idx, title in
            padded(title, to: columnWidths[idx])
        }.joined(separator: "   ")
        print(headerRow)
        print(String(repeating: "-", count: headerRow.count))

        for row in rows {
            let line = row.enumerated().map { idx, value in
                padded(value, to: columnWidths[idx])
            }.joined(separator: "   ")
            print(line)
        }
    }

    private static func padded(_ value: String, to width: Int) -> String {
        guard value.count < width else { return value }
        return value + String(repeating: " ", count: width - value.count)
    }

    static func json<T: Encodable>(_ value: T) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        if let data = try? encoder.encode(value), let string = String(data: data, encoding: .utf8) {
            print(string)
        } else {
            warn("json", "Failed to encode JSON output")
        }
    }
}

private struct DoctorReport: Encodable {
    let platform: RuntimeChecks.PlatformStatus
    let containerTool: RuntimeChecks.ToolCheck
    let containerization: RuntimeChecks.ToolCheck
    let http: EngineStatus?
    let detail: EngineStatusDetail?
    let xpc: EngineXPCStatus?
    let httpError: String?
    let xpcError: String?

    func encode(to encoder: Encoder) throws {
        struct ToolPayload: Encodable {
            let name: String
            let status: String
            let message: String
        }

        struct PlatformPayload: Encodable {
            let osVersion: String
            let isAppleSilicon: Bool
            let isSupported: Bool
            let message: String
        }

        enum CodingKeys: String, CodingKey {
            case platform
            case containerTool
            case containerization
            case http
            case detail
            case xpc
            case httpError
            case xpcError
        }

        var container = encoder.container(keyedBy: CodingKeys.self)

        let os = platform.osVersion
        let platformPayload = PlatformPayload(
            osVersion: "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)",
            isAppleSilicon: platform.isAppleSilicon,
            isSupported: platform.isSupported,
            message: platform.message
        )

        try container.encode(platformPayload, forKey: .platform)
        try container.encode(ToolPayload(name: containerTool.name, status: containerTool.status, message: containerTool.message), forKey: .containerTool)
        try container.encode(ToolPayload(name: containerization.name, status: containerization.status, message: containerization.message), forKey: .containerization)

        try container.encodeIfPresent(http, forKey: .http)
        try container.encodeIfPresent(detail, forKey: .detail)
        try container.encodeIfPresent(xpc, forKey: .xpc)
        try container.encodeIfPresent(httpError, forKey: .httpError)
        try container.encodeIfPresent(xpcError, forKey: .xpcError)
    }

    static func fetch() async -> DoctorReport {
        let platform = RuntimeChecks.platformSupport()
        let containerTool = RuntimeChecks.containerToolVersion()
        let containerization = RuntimeChecks.containerizationFramework()

        let httpResult: Result<EngineStatus, Error>
        let httpDetailResult: Result<EngineStatusDetail, Error>
        let xpcResult: Result<EngineXPCStatus, Error>

        do {
            httpResult = .success(try await EngineClient.fetchHealth())
        } catch {
            httpResult = .failure(error)
        }

        do {
            httpDetailResult = .success(try await EngineClient.fetchStatus())
        } catch {
            httpDetailResult = .failure(error)
        }

        do {
            xpcResult = .success(try await EngineXPCClient.fetchStatus())
        } catch {
            xpcResult = .failure(error)
        }

        let http = try? httpResult.get()
        let detail = try? httpDetailResult.get()
        let xpc = try? xpcResult.get()

        let httpError = http == nil ? httpResult.failureDescription : nil
        let xpcError = xpc == nil ? xpcResult.failureDescription : nil

        return DoctorReport(
            platform: platform,
            containerTool: containerTool,
            containerization: containerization,
            http: http,
            detail: detail,
            xpc: xpc,
            httpError: httpError,
            xpcError: xpcError
        )
    }
}

private extension Result {
    var failureDescription: String? {
        if case let .failure(error) = self {
            return error.localizedDescription
        }
        return nil
    }
}
