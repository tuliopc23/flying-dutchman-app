import Foundation
import Citadel
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
        
        let client = try await Citadel.SSHClient.connect(
            host: host,
            port: port,
            authenticationMethod: .key(
                username: username,
                pemPrivateKey: privateKey
            ),
            hostKeyValidator: .acceptAnything(), // Safe for local ephemeral VMs
            reconnect: .never
        )
        
        logger.debug("Connected. Executing: \(command)")
        
        let stream = try await client.executeCommand(command)
        var output = ""
        
        for try await chunk in stream {
            switch chunk {
            case .stdout(let buffer):
                output += String(buffer: buffer)
            case .stderr(let buffer):
                output += String(buffer: buffer)
            }
        }
        
        try await client.close()
        return output.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
