import Testing
import Foundation
import Shared
@testable import Settings

@Suite("Settings ViewModel Tests")
@MainActor
struct SettingsTests {
    @Test("checkStatus reflects injected network health")
    func checkStatusReflectsNetworkState() async {
        let state = NetworkState(dns: true, ca: false)
        let viewModel = SettingsViewModel(networkClient: .init(
            checkDNSStatus: { await state.dnsStatus() },
            checkCATrustStatus: { await state.caStatus() },
            installDNSResolvers: {},
            trustRootCA: {}
        ))

        await viewModel.checkStatus()

        #expect(viewModel.dnsStatus)
        #expect(!viewModel.caStatus)
        #expect(viewModel.dnsStatusLabel == "Installed")
        #expect(viewModel.dnsStatusMessage.contains(AppConfig.Networking.primaryDomainSuffix))
        #expect(viewModel.caStatusLabel == "Action needed")
        #expect(viewModel.caStatusMessage.contains("Trust the Root CA"))
    }

    @Test("installDNS refreshes status after success")
    func installDNSUpdatesStateOnSuccess() async {
        let state = NetworkState(dns: false, ca: false)
        let viewModel = SettingsViewModel(networkClient: .init(
            checkDNSStatus: { await state.dnsStatus() },
            checkCATrustStatus: { await state.caStatus() },
            installDNSResolvers: { await state.setDNSStatus(true) },
            trustRootCA: {}
        ))

        await viewModel.installDNS()

        #expect(viewModel.dnsStatus)
        #expect(!viewModel.isInstallingDNS)
        #expect(viewModel.errorMessage == nil)
    }

    @Test("installDNS surfaces failures without leaving loading state")
    func installDNSSurfacesFailures() async {
        let viewModel = SettingsViewModel(networkClient: .init(
            checkDNSStatus: { false },
            checkCATrustStatus: { false },
            installDNSResolvers: { throw TestFailure.installFailed },
            trustRootCA: {}
        ))

        await viewModel.installDNS()

        #expect(!viewModel.isInstallingDNS)
        #expect(viewModel.errorMessage?.contains("install-resolver") == true)
        #expect(viewModel.errorMessage?.contains("DNS install failed") == true)
    }

    @Test("trustCA refreshes trust state after success")
    func trustCAUpdatesStateOnSuccess() async {
        let state = NetworkState(dns: true, ca: false)
        let viewModel = SettingsViewModel(networkClient: .init(
            checkDNSStatus: { await state.dnsStatus() },
            checkCATrustStatus: { await state.caStatus() },
            installDNSResolvers: {},
            trustRootCA: { await state.setCAStatus(true) }
        ))

        await viewModel.trustCA()

        #expect(viewModel.caStatus)
        #expect(!viewModel.isTrustingCA)
        #expect(viewModel.errorMessage == nil)
    }

    @Test("trustCA surfaces failures without leaving loading state")
    func trustCASurfacesFailures() async {
        let viewModel = SettingsViewModel(networkClient: .init(
            checkDNSStatus: { false },
            checkCATrustStatus: { false },
            installDNSResolvers: {},
            trustRootCA: { throw TestFailure.trustFailed }
        ))

        await viewModel.trustCA()

        #expect(!viewModel.caStatus)
        #expect(!viewModel.isTrustingCA)
        #expect(viewModel.errorMessage?.contains("trust-ca") == true)
        #expect(viewModel.errorMessage?.contains("CA trust failed") == true)
    }
}

private actor NetworkState {
    private var dns: Bool
    private var ca: Bool

    init(dns: Bool, ca: Bool) {
        self.dns = dns
        self.ca = ca
    }

    func dnsStatus() -> Bool { dns }
    func caStatus() -> Bool { ca }
    func setDNSStatus(_ value: Bool) { dns = value }
    func setCAStatus(_ value: Bool) { ca = value }
}

private enum TestFailure: LocalizedError {
    case installFailed
    case trustFailed

    var errorDescription: String? {
        switch self {
        case .installFailed:
            "DNS install failed"
        case .trustFailed:
            "CA trust failed"
        }
    }
}
