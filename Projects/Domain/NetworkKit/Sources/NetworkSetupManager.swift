import Foundation
import Shared

/// Manages system-level networking configuration (DNS, CA Trust)
public actor NetworkSetupManager {
    private let logger = Loggers.make(category: "network.setup")
    private let fileManager: FileManager
    private let resolverDirectory: URL
    private let caCertificateURL: URL

    public init() {
        let fileManager = FileManager.default
        self.fileManager = fileManager
        self.resolverDirectory = URL(fileURLWithPath: "/etc/resolver", isDirectory: true)
        self.caCertificateURL = Self.defaultCACertificatePath(using: fileManager)
    }

    init(fileManager: FileManager, resolverDirectory: URL, caCertificateURL: URL) {
        self.fileManager = fileManager
        self.resolverDirectory = resolverDirectory
        self.caCertificateURL = caCertificateURL
    }

    // MARK: - DNS Configuration

    public func checkDNSStatus() -> Bool {
        let primarySuffix = AppConfig.Networking.primaryDomainSuffix
        let path = resolverDirectory.appendingPathComponent(primarySuffix)

        guard fileManager.fileExists(atPath: path.path) else {
            return false
        }

        // Optional: Read file and verify content matches current port
        // For now, existence is a good enough proxy for "installed"
        return true
    }

    public func installDNSResolvers() async throws {
        let port = AppConfig.Networking.dnsPort
        let content = ResolverInstaller.resolverFileContent(port: port)
        let domains = AppConfig.Networking.resolverDomainSuffixes

        logger.info("Requesting privileges to install DNS resolvers for: \(domains.joined(separator: ", "))")

        let commands = domains.map { domain in
            "echo \"\(content)\" > /etc/resolver/\(domain)"
        }.joined(separator: " && ")

        let fullScript = "mkdir -p /etc/resolver && \(commands)"

        try await executePrivileged(script: fullScript)

        logger.info("DNS resolvers installed successfully")
    }

    // MARK: - Certificate Trust

    public func checkCATrustStatus() -> Bool {
        // It's hard to verify "Trust" status cheaply without iterating the whole keychain.
        // We check if the CA file exists on disk as a proxy for "Ready to Trust".
        // The UI should verify if the user *has* run the trust command.
        // A deeper check using `SecTrustSettingsCopyTrustSettings` is possible but complex.
        // For now, we assume if the file exists, it *can* be trusted.
        fileManager.fileExists(atPath: caCertificateURL.path)
    }

    public func trustRootCA() async throws {
        guard fileManager.fileExists(atPath: caCertificateURL.path) else {
            throw NetworkError.caCertificateNotFound
        }

        logger.info("Requesting privileges to trust Root CA at \(caCertificateURL.path)")

        // Use 'security' command via sudo
        // -d: add to admin cert store
        // -r trustRoot: trust as root CA
        // -k /Library/Keychains/System.keychain: system-wide trust
        let command = "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain \"\(caCertificateURL.path)\""

        try await executePrivileged(script: command)

        logger.info("Root CA trusted successfully")
    }

    // MARK: - Helpers

    private func executePrivileged(script: String) async throws {
        // Escape the script for AppleScript string literal
        let escapedScript = script.replacingOccurrences(of: "\"", with: "\\\"")

        let appleScript = """
        do shell script "\(escapedScript)" with administrator privileges
        """

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", appleScript]

        try process.run()
        process.waitUntilExit()

        if process.terminationStatus != 0 {
            throw NetworkError.privilegedExecutionFailed(code: process.terminationStatus)
        }
    }

    private static func defaultCACertificatePath(using fileManager: FileManager) -> URL {
        let base = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fileManager
            .temporaryDirectory
        return base
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("certs")
            .appendingPathComponent("ca-cert.pem")
    }
}

public enum NetworkError: LocalizedError {
    case caCertificateNotFound
    case privilegedExecutionFailed(code: Int32)

    public var errorDescription: String? {
        switch self {
        case .caCertificateNotFound:
            "Root CA certificate not found. Start the engine first."
        case let .privilegedExecutionFailed(code):
            "Privileged operation failed (Exit Code: \(code)). User may have cancelled the password prompt."
        }
    }
}
