import Dependencies
import FlyingDutchmanNetworking
import Foundation
import Shared
import SwiftUI

struct SettingsNetworkClient {
    var checkDNSStatus: @Sendable () async -> Bool
    var checkCATrustStatus: @Sendable () async -> Bool
    var installDNSResolvers: @Sendable () async throws -> Void
    var trustRootCA: @Sendable () async throws -> Void

    static let live: Self = {
        let manager = NetworkSetupManager()
        return Self(
            checkDNSStatus: { await manager.checkDNSStatus() },
            checkCATrustStatus: { await manager.checkCATrustStatus() },
            installDNSResolvers: { try await manager.installDNSResolvers() },
            trustRootCA: { try await manager.trustRootCA() }
        )
    }()
}

@MainActor
@Observable
public final class SettingsViewModel {
    public var dnsStatus: Bool = false
    public var caStatus: Bool = false
    public var isInstallingDNS: Bool = false
    public var isTrustingCA: Bool = false
    public var errorMessage: String?

    private let networkClient: SettingsNetworkClient

    var dnsStatusLabel: String {
        dnsStatus ? "Installed" : "Action needed"
    }

    var dnsStatusMessage: String {
        dnsStatus
            ? "Resolver configuration is installed for \(AppConfig.Networking.primaryDomainSuffix)."
            : "Install the resolver to enable local HTTPS domains under \(AppConfig.Networking.primaryDomainSuffix)."
    }

    var caStatusLabel: String {
        caStatus ? "Trusted" : "Action needed"
    }

    var caStatusMessage: String {
        caStatus
            ? "Root CA trust is available for local HTTPS connections."
            : "Trust the Root CA after the engine generates it to avoid local HTTPS trust warnings."
    }

    static func dnsInstallFailureMessage(for error: any Error) -> String {
        "Couldn't install the DNS resolver. Retry Install or run 'flyingdutchman networking install-resolver'. Details: \(error.localizedDescription)"
    }

    static func caTrustFailureMessage(for error: any Error) -> String {
        "Couldn't trust the Root CA. Start FlyingDutchmanEngine if needed, then retry Trust or run 'flyingdutchman trust-ca'. Details: \(error.localizedDescription)"
    }

    init(networkClient: SettingsNetworkClient = .live) {
        self.networkClient = networkClient
    }

    public func checkStatus() async {
        dnsStatus = await networkClient.checkDNSStatus()
        caStatus = await networkClient.checkCATrustStatus()
    }

    public func installDNS() async {
        isInstallingDNS = true
        errorMessage = nil
        do {
            try await networkClient.installDNSResolvers()
            await checkStatus()
        } catch {
            errorMessage = Self.dnsInstallFailureMessage(for: error)
        }
        isInstallingDNS = false
    }

    public func trustCA() async {
        isTrustingCA = true
        errorMessage = nil
        do {
            try await networkClient.trustRootCA()
            await checkStatus()
        } catch {
            errorMessage = Self.caTrustFailureMessage(for: error)
        }
        isTrustingCA = false
    }
}
