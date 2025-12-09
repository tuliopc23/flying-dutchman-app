import Foundation
import ArgumentParser
import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking

@main
struct FlyingDutchmanCLI: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "flyingdutchman",
        abstract: "Flying Dutchman CLI (foundation stub)",
        version: AppConfig.version,
        subcommands: [Version.self, Doctor.self, Containers.self]
    )
}

struct Version: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Show version")
    func run() throws {
        CLIOutput.section("Flying Dutchman")
        CLIOutput.line("Version", AppConfig.version)
    }
}

struct Doctor: AsyncParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Show diagnostics")
    func run() async throws {
        let report = await DoctorReport.fetch()
        CLIOutput.section("Platform")
        CLIOutput.line("Compatibility", report.platform.message)
        CLIOutput.line("Containerization", "\(report.containerization.status) – \(report.containerization.message)")
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

struct Containers: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Container operations",
        subcommands: [List.self, Start.self, Stop.self],
        defaultSubcommand: List.self
    )
}

extension Containers {
    struct List: AsyncParsableCommand {
        static var configuration = CommandConfiguration(abstract: "List containers")

        func run() async throws {
            let data = await ContainerData.fetch()
            if let warning = data.warning {
                CLIOutput.warn("Engine", warning)
            }

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

            if !data.engineReachable {
                CLIOutput.hint("Mock data shown. Start FlyingDutchmanEngine for live data.")
            }
        }
    }

    struct Start: AsyncParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Start a container by id or name")

        @Argument(help: "Container UUID or name")
        var identifier: String

        func run() async throws {
            let data = await ContainerData.fetch()
            guard let target = data.resolve(identifier: identifier) else {
                throw ValidationError("Container '\(identifier)' not found (available: \(data.containers.map { $0.name }.joined(separator: \", \")))")
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
        static var configuration = CommandConfiguration(abstract: "Stop a container by id or name")

        @Argument(help: "Container UUID or name")
        var identifier: String

        func run() async throws {
            let data = await ContainerData.fetch()
            guard let target = data.resolve(identifier: identifier) else {
                throw ValidationError("Container '\(identifier)' not found (available: \(data.containers.map { $0.name }.joined(separator: \", \")))")
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
}

private struct DoctorReport {
    let platform: RuntimeChecks.PlatformStatus
    let containerTool: RuntimeChecks.ToolCheck
    let containerization: RuntimeChecks.ToolCheck
    let http: EngineStatus?
    let detail: EngineStatusDetail?
    let xpc: EngineXPCStatus?
    let httpError: String?
    let xpcError: String?

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
