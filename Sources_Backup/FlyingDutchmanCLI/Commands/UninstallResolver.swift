import ArgumentParser
import Foundation
import Shared

struct UninstallResolver: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "uninstall-resolver",
        abstract: "Remove DNS resolver configuration for .fd.local domains"
    )

    func run() async throws {
        let resolverFile = "/etc/resolver/fd.local"

        guard FileManager.default.fileExists(atPath: resolverFile) else {
            CLIOutput.line("Status", "Resolver not installed")
            return
        }

        CLIOutput.section("Uninstall DNS Resolver")
        CLIOutput.line("Target", resolverFile)
        CLIOutput.line("Action", "Removing resolver configuration (requires sudo)")

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/sudo")
        process.arguments = ["rm", "-f", resolverFile]

        do {
            try process.run()
            process.waitUntilExit()

            if process.terminationStatus == 0 {
                CLIOutput.line("Status", "✓ Resolver uninstalled successfully")
                CLIOutput.hint("*.fd.local domains will no longer resolve")
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
