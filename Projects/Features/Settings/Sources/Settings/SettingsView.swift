import Dependencies
import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

public struct SettingsView: View {
    @State private var state: UIState = UIState()
    @State private var viewModel = SettingsViewModel()
    private let store = UIStateStore()
    @Dependency(\.terminalLauncher) private var terminalLauncher

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xl) {
                Text("Settings")
                    .font(DesignSystem.Typography.title1)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                    .padding(.bottom, DesignSystem.Spacing.md)

                // Engine Section
                GlassCard {
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                        SectionHeader(title: "Engine", icon: "gearshape.2")
                        
                        TextField("Host", text: Binding(
                            get: { state.engineHost },
                            set: { newValue in
                                state.engineHost = newValue
                                persist()
                            }
                        ))
                        .textFieldStyle(.roundedBorder) // Or a custom glass style
                        
                        Stepper(value: Binding(
                            get: { state.enginePort },
                            set: { newValue in
                                state.enginePort = newValue
                                persist()
                            }
                        ), in: 1 ... 65535) {
                            Text("Port: \(state.enginePort)")
                        }
                    }
                    .padding(DesignSystem.Inset.md)
                }

                // UI Section
                GlassCard {
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                        SectionHeader(title: "Interface", icon: "macwindow")
                        
                        Toggle("Default: Follow logs", isOn: Binding(
                            get: { state.defaultFollowLogs },
                            set: { newValue in
                                state.defaultFollowLogs = newValue
                                persist()
                            }
                        ))
                        
                        VStack(alignment: .leading) {
                            Text("Logs Poll Interval: \(Int(state.logsPollIntervalSeconds))s")
                            Slider(value: Binding(
                                get: { state.logsPollIntervalSeconds },
                                set: { newValue in
                                    state.logsPollIntervalSeconds = newValue
                                    persist()
                                }
                            ), in: 1...60, step: 1)
                        }
                    }
                    .padding(DesignSystem.Inset.md)
                }
                
                // Networking Section
                GlassCard {
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                        SectionHeader(title: "Networking", icon: "network")
                        
                        Text("""
                        Install the resolver and trust the local CA to enable HTTPS for \
                        \(AppConfig.Networking.primaryDomainSuffix).
                        """)
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .font(DesignSystem.Typography.caption1)
                                .foregroundStyle(.red)
                        }

                        HStack {
                            VStack(alignment: .leading) {
                                Text("DNS Resolver")
                                    .font(DesignSystem.Typography.body)
                                Text(viewModel.dnsStatus ? "Installed" : "Not Installed")
                                    .font(DesignSystem.Typography.caption1)
                                    .foregroundStyle(viewModel.dnsStatus ? .green : .orange)
                            }
                            Spacer()
                            if !viewModel.dnsStatus {
                                Button("Install") {
                                    Task { await viewModel.installDNS() }
                                }
                                .disabled(viewModel.isInstallingDNS)
                                .buttonStyle(.glass)
                            } else {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)
                            }
                        }
                        
                        Divider().overlay(DesignSystem.Colors.separator)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Root CA")
                                    .font(DesignSystem.Typography.body)
                                Text(viewModel.caStatus ? "Trusted" : "Not Trusted")
                                    .font(DesignSystem.Typography.caption1)
                                    .foregroundStyle(viewModel.caStatus ? .green : .orange)
                            }
                            Spacer()
                            if !viewModel.caStatus {
                                Button("Trust") {
                                    Task { await viewModel.trustCA() }
                                }
                                .disabled(viewModel.isTrustingCA)
                                .buttonStyle(.glass)
                            } else {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                    .padding(DesignSystem.Inset.md)
                }
            }
            .padding(DesignSystem.Inset.xl)
        }
        .background(DesignSystem.Colors.background)
        .task {
            state = store.get()
            await viewModel.checkStatus()
        }
    }

    private func persist() {
        state.lastUpdated = Date()
        let currentState = state
        Task {
            try? await store.save(currentState)
        }
    }
}
