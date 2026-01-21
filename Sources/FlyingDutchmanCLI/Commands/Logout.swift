import Foundation
import ArgumentParser

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

// MARK: - EngineClient Extension

extension EngineClient {
    /// Send logout request to Engine
    @MainActor
    static func logout(registry: String) async throws {
        let url = URL(string: "\(baseURL)/auth/logout")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let payload: [String: String] = [
            "registry": registry
        ]
        
        request.httpBody = try JSONEncoder().encode(payload)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard http.statusCode == 200 else {
            // Try to parse error message
            if let errorPayload = try? JSONDecoder().decode([String: String].self, from: data),
               let errorMessage = errorPayload["error"] {
                throw LogoutError.failed(message: errorMessage)
            }
            throw LogoutError.failed(message: "HTTP \(http.statusCode)")
        }
    }
}

/// Logout-specific errors
enum LogoutError: Error, LocalizedError {
    case failed(message: String)
    
    var errorDescription: String? {
        switch self {
        case .failed(let message):
            return "Logout failed: \(message)"
        }
    }
}
