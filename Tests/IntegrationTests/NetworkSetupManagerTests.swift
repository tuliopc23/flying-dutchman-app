@testable import FlyingDutchmanNetworking
import Foundation
import Shared
import Testing

@Suite("Network Setup Manager Tests")
struct NetworkSetupManagerTests {
    @Test("Resolver status reflects presence of installed resolver file")
    func checkDNSStatusUsesConfiguredResolverDirectory() async throws {
        let directory = try makeTemporaryDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }

        let manager = NetworkSetupManager(
            fileManager: .default,
            resolverDirectory: directory,
            caCertificateURL: directory.appendingPathComponent("ca-cert.pem")
        )

        #expect(await !(manager.checkDNSStatus()))

        let resolverFile = directory.appendingPathComponent(AppConfig.Networking.primaryDomainSuffix)
        try ResolverInstaller.resolverFileContent().write(to: resolverFile, atomically: true, encoding: .utf8)

        #expect(await manager.checkDNSStatus())
    }

    @Test("CA trust status reflects presence of generated CA certificate")
    func checkCATrustStatusUsesConfiguredCertificatePath() async throws {
        let directory = try makeTemporaryDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }

        let certificateURL = directory.appendingPathComponent("ca-cert.pem")
        let manager = NetworkSetupManager(
            fileManager: .default,
            resolverDirectory: directory,
            caCertificateURL: certificateURL
        )

        #expect(await !(manager.checkCATrustStatus()))

        try "test-certificate".write(to: certificateURL, atomically: true, encoding: .utf8)

        #expect(await manager.checkCATrustStatus())
    }

    private func makeTemporaryDirectory() throws -> URL {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        return directory
    }
}
