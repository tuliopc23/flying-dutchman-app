import Foundation
import Citadel
import CryptoKit
import Logging
import NIOCore
import NIOPosix

public actor SSHClient {
    private let host: String
    private let port: Int
    private let username: String
    private let privateKey: String
    private let logger = Logger(label: "com.flyingdutchman.ssh")
    
    public init(host: String, port: Int = 22, username: String, privateKey: String) {
        self.host = host
        self.port = port
        self.username = username
        self.privateKey = privateKey
    }
    
    public func execute(_ command: String) async throws -> String {
        logger.debug("Connecting to \(username)@\(host):\(port)")
        
        // Create a dedicated event loop group for this connection if needed, 
        // or rely on Citadel's internal management if it accepts one.
        // Citadel 0.7 usually takes an EventLoopGroup or uses global.
        
        let ed25519Key = try Self.decodeEd25519PrivateKey(privateKey)
        let client = try await Citadel.SSHClient.connect(
            host: host,
            port: port,
            authenticationMethod: .ed25519(username: username, privateKey: ed25519Key),
            hostKeyValidator: .acceptAnything(), // Safe for local ephemeral VMs
            reconnect: .never
        )
        
        logger.debug("Connected. Executing: \(command)")
        
        let outputBuffer = try await client.executeCommand(command)
        let output = String(buffer: outputBuffer)
        
        try await client.close()
        return output.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

private enum SSHKeyParsingError: Error {
    case missingKeyData
    case invalidBase64
    case invalidPrivateKey
}

private extension SSHClient {
    static func decodeEd25519PrivateKey(_ pem: String) throws -> Curve25519.Signing.PrivateKey {
        let header = "-----BEGIN OPENSSH PRIVATE KEY-----"
        let footer = "-----END OPENSSH PRIVATE KEY-----"
        let payload = pem
            .replacingOccurrences(of: header, with: "")
            .replacingOccurrences(of: footer, with: "")
            .components(separatedBy: .whitespacesAndNewlines)
            .joined()

        guard !payload.isEmpty else {
            throw SSHKeyParsingError.missingKeyData
        }

        guard let rawData = Data(base64Encoded: payload) else {
            throw SSHKeyParsingError.invalidBase64
        }

        do {
            return try Curve25519.Signing.PrivateKey(rawRepresentation: rawData)
        } catch {
            throw SSHKeyParsingError.invalidPrivateKey
        }
    }
}
