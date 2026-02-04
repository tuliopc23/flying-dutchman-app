import Crypto
import Foundation
import NIOSSL
import Shared
import X509

public final class CertificateAuthority: @unchecked Sendable {
    private let storagePath: URL
    private let caKeyFilename = "ca-key.pem"
    private let caCertFilename = "ca-cert.pem"
    private let logger = Loggers.make(category: "certificate.authority")

    public init(storagePath: URL) {
        self.storagePath = storagePath
        try? FileManager.default.createDirectory(at: storagePath, withIntermediateDirectories: true)
    }

    public func getOrCreateRootCA() throws -> (Certificate, P256.Signing.PrivateKey) {
        if let ca = try? loadRootCA() {
            return ca
        }
        return try createRootCA()
    }

    public func generateLeafCert(hostname: String) throws -> (Certificate, P256.Signing.PrivateKey) {
        try generateLeafCert(hostnames: [hostname])
    }

    public func generateLeafCert(hostnames: [String]) throws -> (Certificate, P256.Signing.PrivateKey) {
        let (caCert, caKey) = try getOrCreateRootCA()

        let key = P256.Signing.PrivateKey()
        let certKey = Certificate.PrivateKey(key)
        let now = Date()
        let expiry = now.addingTimeInterval(60 * 60 * 24 * 365) // 1 year

        let subjectName = try DistinguishedName {
            CommonName(hostnames.first ?? AppConfig.Networking.primaryDomainSuffix)
            OrganizationName("Flying Dutchman Container")
        }

        let serialNumber = Certificate.SerialNumber()

        let authorityKeyID = try caCert.publicKey.keyIdentifier
        let subjectKeyID = try certKey.publicKey.keyIdentifier

        let leaf = try Certificate(
            version: .v3,
            serialNumber: serialNumber,
            publicKey: certKey.publicKey,
            notValidBefore: now,
            notValidAfter: expiry,
            issuer: caCert.subject,
            subject: subjectName,
            signatureAlgorithm: .ecdsaWithSHA256,
            extensions: Certificate.Extensions {
                Critical(
                    BasicConstraints.notCertificateAuthority
                )
                Critical(
                    KeyUsage(digitalSignature: true, keyEncipherment: true)
                )
                try ExtendedKeyUsage([.serverAuth, .clientAuth])
                SubjectAlternativeNames(hostnames.map { .dnsName($0) })
                // Authority Key Identifier: Hash of Issuer's Public Key
                AuthorityKeyIdentifier(keyIdentifier: authorityKeyID)
                // Subject Key Identifier: Hash of Subject's Public Key
                SubjectKeyIdentifier(keyIdentifier: subjectKeyID)
            },
            issuerPrivateKey: Certificate.PrivateKey(caKey)
        )

        return (leaf, key)
    }

    private func loadRootCA() throws -> (Certificate, P256.Signing.PrivateKey) {
        let certURL = storagePath.appendingPathComponent(caCertFilename)
        let keyURL = storagePath.appendingPathComponent(caKeyFilename)

        let certData = try Data(contentsOf: certURL)
        let keyData = try Data(contentsOf: keyURL)

        let certString = String(decoding: certData, as: UTF8.self)
        let keyString = String(decoding: keyData, as: UTF8.self)

        let cert = try Certificate(pemEncoded: certString)
        let key = try P256.Signing.PrivateKey(pemRepresentation: keyString)

        return (cert, key)
    }

    private func createRootCA() throws -> (Certificate, P256.Signing.PrivateKey) {
        let key = P256.Signing.PrivateKey()
        let certKey = Certificate.PrivateKey(key)
        let now = Date()
        let expiry = now.addingTimeInterval(60 * 60 * 24 * 365 * 10) // 10 years

        let subjectName = try DistinguishedName {
            CommonName("Flying Dutchman Root CA")
            OrganizationName("Flying Dutchman")
            CountryName("US")
        }

        let serialNumber = Certificate.SerialNumber()

        let subjectKeyID = try certKey.publicKey.keyIdentifier

        let cert = try Certificate(
            version: .v3,
            serialNumber: serialNumber,
            publicKey: certKey.publicKey,
            notValidBefore: now,
            notValidAfter: expiry,
            issuer: subjectName,
            subject: subjectName,
            signatureAlgorithm: .ecdsaWithSHA256,
            extensions: Certificate.Extensions {
                Critical(
                    BasicConstraints.isCertificateAuthority(maxPathLength: nil)
                )
                Critical(
                    KeyUsage(digitalSignature: true, keyCertSign: true, cRLSign: true)
                )
                SubjectKeyIdentifier(keyIdentifier: subjectKeyID)
            },
            issuerPrivateKey: certKey
        )

        try saveRootCA(cert: cert, key: key)
        return (cert, key)
    }

    private func saveRootCA(cert: Certificate, key: P256.Signing.PrivateKey) throws {
        let certPEM = try cert.serializeAsPEM().pemString
        let keyPEM = key.pemRepresentation

        try certPEM.write(to: storagePath.appendingPathComponent(caCertFilename), atomically: true, encoding: .utf8)
        try keyPEM.write(to: storagePath.appendingPathComponent(caKeyFilename), atomically: true, encoding: .utf8)

        logger.info("Generated and saved new Root CA to \(storagePath.path)")
    }
}

extension Certificate.PublicKey {
    var keyIdentifier: ArraySlice<UInt8> {
        get throws {
            // SHA-1 hash of the SubjectPublicKeyInfo
            let hash = Insecure.SHA1.hash(data: self.subjectPublicKeyInfoBytes)
            return ArraySlice(hash)
        }
    }
}

extension Certificate {
    func toNIOSSL() throws -> NIOSSLCertificate {
        let pem = try self.serializeAsPEM().pemString
        let bytes = Array(pem.utf8)
        return try NIOSSLCertificate(bytes: bytes, format: .pem)
    }
}

extension P256.Signing.PrivateKey {
    func toNIOSSL() throws -> NIOSSLPrivateKey {
        let pem = self.pemRepresentation
        let bytes = Array(pem.utf8)
        return try NIOSSLPrivateKey(bytes: bytes, format: .pem)
    }
}
