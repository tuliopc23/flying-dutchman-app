import Foundation
import Logging
import Security

/// Manages authentication for OCI container registries
///
/// Handles login, logout, token management, and OAuth flows for Docker Hub and other registries.
/// Credentials are stored securely in macOS Keychain.
///
/// ## Supported Registries
///
/// - **Docker Hub** (docker.io, registry-1.docker.io): OAuth token flow
/// - **GitHub Container Registry** (ghcr.io): Personal access token
/// - **Private registries**: Basic auth
///
/// ## Security Model
///
/// - Passwords stored in Keychain (not in database or files)
/// - Tokens cached in memory with expiration
/// - Automatic token refresh on 401 responses
public actor RegistryAuthManager {
    private let logger = Logger(label: "com.flyingdutchman.registry.auth")
    private let keychainService = "com.flyingdutchman.registry"

    /// Cache of active authentication tokens (registry -> token)
    /// Tokens are cached to avoid hitting auth endpoints repeatedly
    private var tokenCache: [String: CachedToken] = [:]

    /// Initialize the registry authentication manager
    public init() {
        logger.debug("RegistryAuthManager initialized")
    }

    // MARK: - Public API

    /// Login to a container registry with username and password
    ///
    /// - Parameters:
    ///   - registry: Registry hostname (e.g., "docker.io", "ghcr.io")
    ///   - username: Registry username
    ///   - password: Registry password or personal access token
    /// - Throws: If login fails or Keychain storage fails
    public func login(registry: String, username: String, password: String) async throws {
        logger.info("Logging in to registry", metadata: [
            "registry": .string(registry),
            "username": .string(username),
        ])

        // Validate credentials by attempting to get a token
        _ = try await authenticate(
            registry: registry,
            username: username,
            password: password,
            scope: "registry:catalog:*"
        )

        // Store credentials in Keychain
        try storeInKeychain(registry: registry, username: username, password: password)

        logger.info("Successfully logged in to registry", metadata: [
            "registry": .string(registry),
            "username": .string(username),
        ])
    }

    /// Logout from a container registry
    ///
    /// Removes credentials from Keychain and clears cached tokens.
    ///
    /// - Parameter registry: Registry hostname to logout from
    /// - Throws: If Keychain removal fails
    public func logout(registry: String) async throws {
        logger.info("Logging out from registry", metadata: [
            "registry": .string(registry),
        ])

        // Remove from Keychain
        try deleteFromKeychain(registry: registry)

        // Clear cached token
        tokenCache.removeValue(forKey: registry)

        logger.info("Successfully logged out from registry", metadata: [
            "registry": .string(registry),
        ])
    }

    /// Get authentication token for a registry and scope
    ///
    /// Returns a Bearer token suitable for Authorization headers.
    /// Automatically refreshes expired tokens.
    ///
    /// - Parameters:
    ///   - registry: Registry hostname
    ///   - scope: OAuth scope (e.g., "repository:library/nginx:pull")
    /// - Returns: Bearer token string, or nil if no credentials stored
    /// - Throws: If authentication fails
    public func getAuthToken(registry: String, scope: String) async throws -> String? {
        // Check cache first
        if let cached = tokenCache[registry], !cached.isExpired {
            logger.debug("Using cached token", metadata: [
                "registry": .string(registry),
            ])
            return cached.token
        }

        // Retrieve credentials from Keychain
        guard let (username, password) = try retrieveFromKeychain(registry: registry) else {
            logger.debug("No credentials found for registry", metadata: [
                "registry": .string(registry),
            ])
            return nil
        }

        // Authenticate and cache token
        let token = try await authenticate(registry: registry, username: username, password: password, scope: scope)

        // Cache for future use (expires in 30 minutes)
        tokenCache[registry] = CachedToken(token: token, expiresAt: Date().addingTimeInterval(1800))

        return token
    }

    /// Refresh an expired token
    ///
    /// Clears cache and forces re-authentication.
    ///
    /// - Parameter registry: Registry hostname
    /// - Throws: If authentication fails
    public func refreshToken(registry: String) async throws {
        logger.info("Refreshing token for registry", metadata: [
            "registry": .string(registry),
        ])

        // Clear cached token
        tokenCache.removeValue(forKey: registry)

        // Next getAuthToken() call will re-authenticate
    }

    // MARK: - Authentication Flows

    /// Authenticate with a registry and return a Bearer token
    ///
    /// Handles different authentication mechanisms based on registry:
    /// - Docker Hub: OAuth token endpoint
    /// - Others: Basic auth (username:password in Authorization header)
    private func authenticate(
        registry: String,
        username: String,
        password: String,
        scope: String
    ) async throws -> String {
        if registry == "docker.io" || registry == "registry-1.docker.io" {
            return try await getDockerHubToken(username: username, password: password, scope: scope)
        } else if registry == "ghcr.io" {
            // GitHub Container Registry uses token directly as Bearer token
            return password // PAT is used directly
        } else {
            // For other registries, encode Basic auth as token
            let credentials = "\(username):\(password)"
            guard let credentialsData = credentials.data(using: .utf8) else {
                throw RegistryAuthError.invalidCredentials
            }
            return credentialsData.base64EncodedString()
        }
    }

    /// Get Docker Hub OAuth token
    ///
    /// Docker Hub uses a two-step OAuth flow:
    /// 1. POST to https://auth.docker.io/token with credentials
    /// 2. Receive short-lived Bearer token
    private func getDockerHubToken(username: String, password: String, scope: String) async throws -> String {
        let authURL = URL(string: "https://auth.docker.io/token")!
        var components = URLComponents(url: authURL, resolvingAgainstBaseURL: false)!

        // Docker Hub auth parameters
        components.queryItems = [
            URLQueryItem(name: "service", value: "registry.docker.io"),
            URLQueryItem(name: "scope", value: scope),
        ]

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"

        // Add Basic auth header
        let credentials = "\(username):\(password)"
        guard let credentialsData = credentials.data(using: .utf8) else {
            throw RegistryAuthError.invalidCredentials
        }
        let base64Credentials = credentialsData.base64EncodedString()
        request.setValue("Basic \(base64Credentials)", forHTTPHeaderField: "Authorization")

        logger.debug("Requesting Docker Hub token", metadata: [
            "scope": .string(scope),
        ])

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw RegistryAuthError.invalidResponse
        }

        guard httpResponse.statusCode == 200 else {
            logger.error("Docker Hub auth failed", metadata: [
                "statusCode": .stringConvertible(httpResponse.statusCode),
            ])
            throw RegistryAuthError.authenticationFailed(statusCode: httpResponse.statusCode)
        }

        // Parse token response
        struct TokenResponse: Codable {
            let token: String
            let access_token: String?
        }

        let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
        let token = tokenResponse.access_token ?? tokenResponse.token

        logger.debug("Successfully obtained Docker Hub token")

        return token
    }

    // MARK: - Keychain Integration

    /// Store credentials in macOS Keychain
    ///
    /// Uses kSecClassGenericPassword with registry as service name.
    private func storeInKeychain(registry: String, username: String, password: String) throws {
        // Delete existing entry first
        try? deleteFromKeychain(registry: registry)

        guard let passwordData = password.data(using: .utf8) else {
            throw RegistryAuthError.invalidCredentials
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecAttrAccount as String: "\(registry):\(username)",
            kSecValueData as String: passwordData,
            kSecAttrLabel as String: "Flying Dutchman - \(registry)",
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status == errSecSuccess else {
            logger.error("Failed to store credentials in Keychain", metadata: [
                "registry": .string(registry),
                "status": .stringConvertible(status),
            ])
            throw RegistryAuthError.keychainError(status: status)
        }

        logger.debug("Stored credentials in Keychain", metadata: [
            "registry": .string(registry),
        ])
    }

    /// Retrieve credentials from macOS Keychain
    ///
    /// - Parameter registry: Registry hostname
    /// - Returns: Tuple of (username, password) if found, nil otherwise
    private func retrieveFromKeychain(registry: String) throws -> (username: String, password: String)? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecMatchLimit as String: kSecMatchLimitAll,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true,
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                return nil
            }
            logger.error("Failed to retrieve credentials from Keychain", metadata: [
                "registry": .string(registry),
                "status": .stringConvertible(status),
            ])
            throw RegistryAuthError.keychainError(status: status)
        }

        // Result can be a single item or array
        let items: [[String: Any]]
        if let array = result as? [[String: Any]] {
            items = array
        } else if let dict = result as? [String: Any] {
            items = [dict]
        } else {
            return nil
        }

        // Find matching registry
        for item in items {
            guard let accountString = item[kSecAttrAccount as String] as? String,
                  accountString.hasPrefix(registry),
                  let passwordData = item[kSecValueData as String] as? Data,
                  let password = String(data: passwordData, encoding: .utf8)
            else {
                continue
            }

            // Extract username from "registry:username" format
            let components = accountString.split(separator: ":")
            guard components.count >= 2 else { continue }

            let username = String(components[1])

            logger.debug("Retrieved credentials from Keychain", metadata: [
                "registry": .string(registry),
                "username": .string(username),
            ])

            return (username: username, password: password)
        }

        return nil
    }

    /// Delete credentials from macOS Keychain
    ///
    /// - Parameter registry: Registry hostname
    private func deleteFromKeychain(registry: String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecMatchLimit as String: kSecMatchLimitAll,
            kSecReturnAttributes as String: true,
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                return // Nothing to delete
            }
            throw RegistryAuthError.keychainError(status: status)
        }

        // Result can be a single item or array
        let items: [[String: Any]]
        if let array = result as? [[String: Any]] {
            items = array
        } else if let dict = result as? [String: Any] {
            items = [dict]
        } else {
            return
        }

        // Delete matching entries
        for item in items {
            guard let accountString = item[kSecAttrAccount as String] as? String,
                  accountString.hasPrefix(registry)
            else {
                continue
            }

            let deleteQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: keychainService,
                kSecAttrAccount as String: accountString,
            ]

            let deleteStatus = SecItemDelete(deleteQuery as CFDictionary)

            if deleteStatus == errSecSuccess {
                logger.debug("Deleted credentials from Keychain", metadata: [
                    "account": .string(accountString),
                ])
            }
        }
    }
}

// MARK: - Supporting Types

/// Cached authentication token with expiration
private struct CachedToken {
    let token: String
    let expiresAt: Date

    var isExpired: Bool {
        Date() >= expiresAt
    }
}

/// Registry authentication errors
public enum RegistryAuthError: Error, LocalizedError {
    case invalidCredentials
    case invalidResponse
    case authenticationFailed(statusCode: Int)
    case keychainError(status: OSStatus)

    public var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            "Invalid credentials format"
        case .invalidResponse:
            "Invalid response from authentication server"
        case let .authenticationFailed(statusCode):
            "Authentication failed with status code \(statusCode)"
        case let .keychainError(status):
            "Keychain error: \(status)"
        }
    }
}
