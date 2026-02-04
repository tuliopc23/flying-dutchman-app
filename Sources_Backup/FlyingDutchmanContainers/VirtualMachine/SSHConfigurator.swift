import Foundation
import CryptoKit
import Logging
import Shared

public actor SSHConfigurator {
    private let logger = Loggers.make(category: "flyingdutchman.machines.ssh")
    
    public init() {}
    
    public func generateSSHKeyPair(for machineID: String) throws -> (publicKey: String, privateKey: String) {
        // Generate ED25519 key pair using CryptoKit
        let privateKey = Curve25519.Signing.PrivateKey()
        let publicKey = privateKey.publicKey
        
        // Convert to SSH format (simplified)
        let privateKeyData = privateKey.rawRepresentation
        let publicKeyData = publicKey.rawRepresentation
        
        let privateKeyPEM = "-----BEGIN OPENSSH PRIVATE KEY-----\n\(privateKeyData.base64EncodedString())\n-----END OPENSSH PRIVATE KEY-----"
        let publicKeySSH = "ssh-ed25519 \(publicKeyData.base64EncodedString()) flyingdutchman@\(machineID)"
        
        logger.info("Generated SSH key pair for machine \(machineID)")
        
        return (publicKey: publicKeySSH, privateKey: privateKeyPEM)
    }
    
    public func saveSSHKeys(for machineID: String, publicKey: String, privateKey: String, machineDirectory: URL) throws {
        let sshDir = machineDirectory.appendingPathComponent("ssh", isDirectory: true)
        try FileManager.default.createDirectory(at: sshDir, withIntermediateDirectories: true)
        
        let privateKeyPath = sshDir.appendingPathComponent("id_ed25519")
        let publicKeyPath = sshDir.appendingPathComponent("id_ed25519.pub")
        
        try privateKey.write(to: privateKeyPath, atomically: true, encoding: .utf8)
        try publicKey.write(to: publicKeyPath, atomically: true, encoding: .utf8)
        
        // Set proper permissions on private key (0600)
        try FileManager.default.setAttributes(
            [.posixPermissions: 0o600],
            ofItemAtPath: privateKeyPath.path
        )
        
        logger.info("Saved SSH keys to \(sshDir.path)")
    }
    
    public func getSSHKeyPath(for machineID: String, machineDirectory: URL) -> URL {
        machineDirectory.appendingPathComponent("ssh/id_ed25519")
    }
    
    public func createCloudInitUserData(sshPublicKey: String, hostname: String) -> String {
        """
        #cloud-config
        hostname: \(hostname)
        users:
          - name: root
            ssh_authorized_keys:
              - \(sshPublicKey)
          - name: ubuntu
            sudo: ALL=(ALL) NOPASSWD:ALL
            groups: users, admin
            shell: /bin/bash
            ssh_authorized_keys:
              - \(sshPublicKey)
        
        ssh_pwauth: false
        disable_root: false
        
        package_update: true
        package_upgrade: false
        
        packages:
          - curl
          - wget
          - vim
          - git
        
        runcmd:
          - systemctl enable ssh
          - systemctl start ssh
        """
    }
}
