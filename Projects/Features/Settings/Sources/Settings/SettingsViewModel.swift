import Dependencies
import Foundation
import NetworkKit
import Shared
import SwiftUI

@MainActor
@Observable
public final class SettingsViewModel {
    public var dnsStatus: Bool = false
    public var caStatus: Bool = false
    public var isInstallingDNS: Bool = false
    public var isTrustingCA: Bool = false
    public var errorMessage: String?
    
    private let networkManager = NetworkSetupManager()
    
    public init() {}
    
    public func checkStatus() async {
        dnsStatus = await networkManager.checkDNSStatus()
        caStatus = await networkManager.checkCATrustStatus()
    }
    
    public func installDNS() async {
        isInstallingDNS = true
        errorMessage = nil
        do {
            try await networkManager.installDNSResolvers()
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
            try await networkManager.trustRootCA()
            await checkStatus()
        } catch {
            errorMessage = "Failed to trust CA: \(error.localizedDescription)"
        }
        isTrustingCA = false
    }
}
