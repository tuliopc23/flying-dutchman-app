import ArgumentParser
import FlyingDutchmanNetworking
import Foundation
import Shared

struct TrustCA: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "trust-ca",
        abstract: "Trust the Flying Dutchman Root CA certificate"
    )

    func run() async throws {
        let setupManager = NetworkSetupManager()

        // Check if CA exists (by checking if trust can proceed)
        guard await setupManager.checkCATrustStatus() else {
            CLIOutput.warn("CA Certificate Not Found", "The Root CA certificate has not been generated yet.")
            CLIOutput.hint("Start the Flying Dutchman engine first to generate the certificate.")
            throw ExitCode.failure
        }

        CLIOutput.section("Trust Root CA")
        CLIOutput.line("Action", "Adding to macOS Keychain (requires sudo)")

        do {
            try await setupManager.trustRootCA()
            
            CLIOutput.line("Status", "✓ Certificate trusted successfully")
            CLIOutput.hint("You can now access containers via https://<container-name>.flyingdutchman.local:\(AppConfig.Networking.httpsProxyPort)")
        } catch {
            CLIOutput.warn("Error", error.localizedDescription)
            CLIOutput.hint("Ensure you enter your password when prompted to modify the System keychain")
            throw ExitCode.failure
        }
    }
}
