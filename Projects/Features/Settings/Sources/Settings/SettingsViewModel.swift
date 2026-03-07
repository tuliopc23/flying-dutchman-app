import Dependencies
import Foundation
import FlyingDutchmanNetworking
import Shared
import SwiftUI

struct SettingsNetworkClient: Sendable {
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
            errorMessage = "Failed to install DNS: \(error.localizedDescription)"
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
            errorMessage = "Failed to trust CA: \(error.localizedDescription)"
        }
        isTrustingCA = false
    }
}
