import AsyncHTTPClient
import Containerization
import ContainerizationExtras
import ContainerizationOCI
import FlyingDutchmanPersistence
import Foundation
import Logging
import NIOCore
import NIOTransportServices
import Shared
import SystemPackage

public extension ContainerizationRuntime {
    /// Login to a container registry
    ///
    /// Stores credentials securely in macOS Keychain for future image pulls.
    ///
    /// - Parameters:
    ///   - registry: Registry hostname (e.g., "docker.io", "ghcr.io")
    ///   - username: Registry username
    ///   - password: Registry password or personal access token
    /// - Throws: If authentication fails or Keychain storage fails
    func login(registry: String, username: String, password: String) async throws {
        try await authManager.login(registry: registry, username: username, password: password)
        logger.info("Successfully logged in to registry", metadata: [
            "registry": .string(registry),
            "username": .string(username),
        ])
    }

    /// Logout from a container registry
    ///
    /// Removes stored credentials from macOS Keychain.
    ///
    /// - Parameter registry: Registry hostname to logout from
    /// - Throws: If Keychain removal fails
    func logout(registry: String) async throws {
        try await authManager.logout(registry: registry)
        logger.info("Successfully logged out from registry", metadata: [
            "registry": .string(registry),
        ])
    }
}
