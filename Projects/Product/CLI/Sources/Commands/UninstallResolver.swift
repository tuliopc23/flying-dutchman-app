import ArgumentParser
import Foundation
import Shared

struct UninstallResolver: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "uninstall-resolver",
        abstract: "Remove DNS resolver configuration for Flying Dutchman domains"
    )

    func run() async throws {
        let resolverDir = "/etc/resolver"
        let domains = AppConfig.Networking.resolverDomainSuffixes
        let resolverFiles = domains.map { "\(resolverDir)/\($0)" }

        let existingFiles = resolverFiles.filter { FileManager.default.fileExists(atPath: $0) }
        guard !existingFiles.isEmpty else {
            CLIOutput.line("Status", "Resolver not installed")
            return
        }

        CLIOutput.section("Uninstall DNS Resolver")
        CLIOutput.line("Targets", existingFiles.joined(separator: ", "))
        CLIOutput.line("Action", "Removing resolver configurations (requires sudo)")

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/sudo")
        process.arguments = ["rm", "-f"] + existingFiles

        do {
            try process.run()
            process.waitUntilExit()

            if process.terminationStatus == 0 {
                CLIOutput.line("Status", "✓ Resolver uninstalled successfully")
                CLIOutput.hint("Flying Dutchman domains will no longer resolve")
            } else {
                CLIOutput.warn("Failed", "Could not remove resolver file")
                throw ExitCode.failure
            }
        } catch {
            CLIOutput.warn("Error", error.localizedDescription)
            CLIOutput.hint("Ensure you have sudo privileges")
            throw ExitCode.failure
        }
    }
}
