import Foundation
import ArgumentParser
import Shared
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
        print("Flying Dutchman version \(AppConfig.version)")
    }
}

struct Doctor: AsyncParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Show diagnostics")
    func run() async throws {
        do {
            let health = try await EngineClient.fetchHealth()
            print("Engine: \(health.status)")
            if let detail = try? await EngineClient.fetchStatus() {
                print("Uptime: \(detail.uptimeSeconds)s, Workers: \(detail.workers)")
            }
        } catch {
            print("Engine unreachable. Start FlyingDutchmanEngine. Error: \(error.localizedDescription)")
        }

        let containerCheck = RuntimeChecks.containerToolVersion()
        print("container tool: \(containerCheck.status) — \(containerCheck.message)")
    }
}

struct Containers: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "List containers (stub)")
    func run() throws {
        print("No containers. Engine stub not implemented yet.")
    }
}
