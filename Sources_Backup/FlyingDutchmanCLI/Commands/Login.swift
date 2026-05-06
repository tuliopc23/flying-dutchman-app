import ArgumentParser
import FlyingDutchmanNetworking
import Foundation
import Shared

/// CLI command for logging in to a container registry
///
/// Prompts for credentials and stores them securely in macOS Keychain via the Engine.
struct Login: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "login",
        abstract: "Log in to a container registry"
    )

    @Argument(help: "Registry to log in to (default: docker.io)")
    var registry: String = "docker.io"

    @Option(name: .shortAndLong, help: "Username (will prompt if not provided)")
    var username: String?

    @Option(name: .shortAndLong, help: "Password or token (will prompt securely if not provided)")
    var password: String?

    func run() async throws {
        // Normalize registry name
        let normalizedRegistry = normalizeRegistry(registry)

        // Get credentials (prompt if not provided)
        let user = username ?? promptForUsername(registry: normalizedRegistry)
        let pass = password ?? promptForPassword(registry: normalizedRegistry)

        // Validate inputs
        guard !user.isEmpty else {
            throw ValidationError("Username cannot be empty")
        }
        guard !pass.isEmpty else {
            throw ValidationError("Password cannot be empty")
        }

        // Send login request to Engine
        do {
            try await EngineClient.login(registry: normalizedRegistry, username: user, password: pass)
            CLIOutput.line("Login Succeeded", normalizedRegistry)
            if normalizedRegistry == "docker.io" {
                CLIOutput.hint("You can now pull private images from Docker Hub")
            }
        } catch {
            CLIOutput.warn("Login Failed", error.localizedDescription)
            CLIOutput.hint("Ensure the engine is running and credentials are correct")
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

    /// Prompt for username with registry context
    private func promptForUsername(registry: String) -> String {
        print("Username for \(registry): ", terminator: "")
        fflush(stdout)
        return readLine() ?? ""
    }

    /// Prompt for password securely (no echo)
    private func promptForPassword(registry: String) -> String {
        print("Password or token for \(registry): ", terminator: "")
        fflush(stdout)

        // Attempt to disable echo for password input
        let password = readPasswordSecurely()
        print("") // New line after password input

        return password
    }

    /// Read password with echo disabled (macOS-specific)
    private func readPasswordSecurely() -> String {
        var oldTermios = termios()
        tcgetattr(STDIN_FILENO, &oldTermios)

        var newTermios = oldTermios
        newTermios.c_lflag &= ~tcflag_t(ECHO)
        tcsetattr(STDIN_FILENO, TCSANOW, &newTermios)

        defer {
            tcsetattr(STDIN_FILENO, TCSANOW, &oldTermios)
        }

        return readLine() ?? ""
    }
}
