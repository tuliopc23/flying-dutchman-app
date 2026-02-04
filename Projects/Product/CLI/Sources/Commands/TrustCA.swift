import ArgumentParser
import Foundation
import Shared

struct TrustCA: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "trust-ca",
        abstract: "Trust the Flying Dutchman Root CA certificate"
    )

    func run() async throws {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let appSupportDir = base.appendingPathComponent("flyingdutchman", isDirectory: true)
        let certsDir = appSupportDir.appendingPathComponent("certs", isDirectory: true)
        let caCertPath = certsDir.appendingPathComponent("ca-cert.pem")

        guard fm.fileExists(atPath: caCertPath.path) else {
            CLIOutput.warn("CA Certificate Not Found", "The Root CA certificate has not been generated yet.")
            CLIOutput.hint("Start the Flying Dutchman engine first to generate the certificate.")
            throw ExitCode.failure
        }

        CLIOutput.section("Trust Root CA")
        CLIOutput.line("Certificate Path", caCertPath.path)
        CLIOutput.line("Action", "Adding to macOS Keychain (requires sudo)")

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/security")
        process.arguments = [
            "add-trusted-cert",
            "-d",
            "-r", "trustRoot",
            "-k", "/Library/Keychains/System.keychain",
            caCertPath.path,
        ]

        do {
            try process.run()
            process.waitUntilExit()

            if process.terminationStatus == 0 {
                CLIOutput.line("Status", "✓ Certificate trusted successfully")
                CLIOutput
                    .hint(
                        "You can now access containers via https://<container-name>.flyingdutchman.local:\(AppConfig.Networking.httpsProxyPort)"
                    )
            } else {
                CLIOutput.warn("Failed", "security command returned status \(process.terminationStatus)")
                CLIOutput.hint("You may need to run this command with sudo privileges")
                throw ExitCode.failure
            }
        } catch {
            CLIOutput.warn("Error", error.localizedDescription)
            CLIOutput.hint("Ensure you have permission to modify the System keychain")
            throw ExitCode.failure
        }
    }
}
