import Foundation
import ArgumentParser
import FlyingDutchmanNetworking
import Shared

/// CLI command for logging out from a container registry
///
/// Removes stored credentials from macOS Keychain via the Engine.
struct Logout: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "logout",
        abstract: "Log out from a container registry"
    )
    
    @Argument(help: "Registry to log out from (default: docker.io)")
    var registry: String = "docker.io"
    
    func run() async throws {
        // Normalize registry name
        let normalizedRegistry = normalizeRegistry(registry)
        
        // Send logout request to Engine
        do {
            try await EngineClient.logout(registry: normalizedRegistry)
            CLIOutput.line("Logout Succeeded", normalizedRegistry)
            CLIOutput.hint("Credentials removed from Keychain")
        } catch {
            CLIOutput.warn("Logout Failed", error.localizedDescription)
            CLIOutput.hint("Ensure the engine is running")
            throw ExitCode.failure
        }
    }
    
    // MARK: - Private Helpers
    
    /// Normalize registry name (handle shortcuts)
    private func normalizeRegistry(_ input: String) -> String {
        switch input.lowercased() {
        case "docker", "dockerhub", "docker.io", "registry-1.docker.io":
            return "docker.io"
        case "ghcr", "ghcr.io", "github":
            return "ghcr.io"
        case "gcr", "gcr.io", "google":
            return "gcr.io"
        default:
            // Remove http:// or https:// if present
            var normalized = input
            if normalized.hasPrefix("http://") {
                normalized = String(normalized.dropFirst("http://".count))
            } else if normalized.hasPrefix("https://") {
                normalized = String(normalized.dropFirst("https://".count))
            }
            // Remove trailing slash
            if normalized.hasSuffix("/") {
                normalized = String(normalized.dropLast())
            }
            return normalized
        }
    }
}
