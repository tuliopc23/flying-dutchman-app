import ArgumentParser
import FlyingDutchmanNetworking
import Foundation
import Shared

struct Shell: AsyncParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Open an interactive shell in a running container")

    @Argument(help: "Container name or ID")
    var container: String

    @Argument(help: "Shell command (default: /bin/sh)")
    var command: [String] = []

    func run() async throws {
        let containers = try await EngineClient.listContainers()
        guard let target = containers.first(where: { $0.name == container || $0.id.uuidString == container }) else {
            CLIOutput.warn("Error", "Container not found: \(container)")
            throw ExitCode.failure
        }

        guard target.status == .running else {
            CLIOutput.warn("Error", "Container is not running")
            CLIOutput.hint("Start it with: fd containers start \(target.name)")
            throw ExitCode.failure
        }

        let cliPath = ProcessInfo.processInfo.environment["FD_CONTAINER_CLI"] ?? "/usr/bin/container"
        guard FileManager.default.isExecutableFile(atPath: cliPath) else {
            CLIOutput.warn("Error", "container CLI not found at \(cliPath)")
            CLIOutput.hint("Install Apple Containerization CLI or set FD_CONTAINER_CLI")
            throw ExitCode.failure
        }

        let shellCommand = command.isEmpty ? ["/bin/sh"] : command
        let process = Process()
        process.executableURL = URL(fileURLWithPath: cliPath)
        process.arguments = ["exec", "--tty", "--interactive", target.id.uuidString] + shellCommand
        process.standardInput = FileHandle.standardInput
        process.standardOutput = FileHandle.standardOutput
        process.standardError = FileHandle.standardError

        try process.run()
        process.waitUntilExit()
        if process.terminationStatus != 0 {
            throw ExitCode.failure
        }
    }
}
