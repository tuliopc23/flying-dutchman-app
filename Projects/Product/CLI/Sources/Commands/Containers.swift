import ArgumentParser
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Foundation
import Shared

struct Containers: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Container operations",
        subcommands: [List.self, Run.self, Start.self, Stop.self, Restart.self, Logs.self],
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
                            ports.isEmpty ? "—" : ports,
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
            return ContainerData(containers: SeedData.sampleContainers, engineReachable: false, warning: warning)
        }
    }
}
