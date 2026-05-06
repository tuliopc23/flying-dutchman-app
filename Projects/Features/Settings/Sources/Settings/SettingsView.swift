import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

public struct SettingsView: View {
    @State private var state: UIState = UIState()
    @State private var viewModel = SettingsViewModel()
    private let store = UIStateStore()

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xl) {
                Text("Settings")
                    .font(DesignSystem.Typography.title1)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                    .padding(.bottom, DesignSystem.Spacing.md)

                engineSection
                interfaceSection
                updatesSection
                networkingSection
            }
            .padding(DesignSystem.Inset.xl)
        }
        .background(DesignSystem.Colors.background)
        .task {
            state = store.get()
            await viewModel.checkStatus()
        }
    }

    // MARK: - Sections

    private var engineSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                SectionHeader(title: "Engine", icon: "gearshape.2")

                TextField("Host", text: binding(for: \.engineHost))
                    .textFieldStyle(.roundedBorder)

                Stepper(value: binding(for: \.enginePort), in: 1 ... 65535) {
                    Text("Port: \(state.enginePort)")
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private var interfaceSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                SectionHeader(title: "Interface", icon: "macwindow")

                Toggle("Default: Follow logs", isOn: binding(for: \.defaultFollowLogs))

                VStack(alignment: .leading) {
                    Text("Logs Poll Interval: \(Int(state.logsPollIntervalSeconds))s")
                    Slider(value: binding(for: \.logsPollIntervalSeconds), in: 1 ... 60, step: 1)
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private var updatesSection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                SectionHeader(title: "Updates", icon: "sparkles")

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Current Version")
                            .font(DesignSystem.Typography.body)
                        Text(AppConfig.version)
                            .font(DesignSystem.Typography.caption1)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }

                    Spacer()

                    Button("Check for Updates…") {
                        AppUpdateRequests.checkForUpdates()
                    }
                    .buttonStyle(.glassProminent)
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private var networkingSection: some View {
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

                dnsRow

                Divider().overlay(DesignSystem.Colors.separator)

                caRow
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private var dnsRow: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("DNS Resolver")
                    .font(DesignSystem.Typography.body)
                Text(viewModel.dnsStatusLabel)
                    .font(DesignSystem.Typography.caption1)
                    .foregroundStyle(viewModel.dnsStatus ? .green : .orange)
                Text(viewModel.dnsStatusMessage)
                    .font(DesignSystem.Typography.caption1)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
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
    }

    private var caRow: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Root CA")
                    .font(DesignSystem.Typography.body)
                Text(viewModel.caStatusLabel)
                    .font(DesignSystem.Typography.caption1)
                    .foregroundStyle(viewModel.caStatus ? .green : .orange)
                Text(viewModel.caStatusMessage)
                    .font(DesignSystem.Typography.caption1)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
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

    // MARK: - Helpers

    private func binding(for keyPath: WritableKeyPath<UIState, String>) -> Binding<String> {
        Binding(
            get: { state[keyPath: keyPath] },
            set: { newValue in
                state[keyPath: keyPath] = newValue
                persist()
            }
        )
    }

    private func binding(for keyPath: WritableKeyPath<UIState, Int>) -> Binding<Int> {
        Binding(
            get: { state[keyPath: keyPath] },
            set: { newValue in
                state[keyPath: keyPath] = newValue
                persist()
            }
        )
    }

    private func binding(for keyPath: WritableKeyPath<UIState, Bool>) -> Binding<Bool> {
        Binding(
            get: { state[keyPath: keyPath] },
            set: { newValue in
                state[keyPath: keyPath] = newValue
                persist()
            }
        )
    }

    private func binding(for keyPath: WritableKeyPath<UIState, Double>) -> Binding<Double> {
        Binding(
            get: { state[keyPath: keyPath] },
            set: { newValue in
                state[keyPath: keyPath] = newValue
                persist()
            }
        )
    }

    private func persist() {
        state.lastUpdated = Date()
        let currentState = state
        Task {
            try? await store.save(currentState)
        }
    }
}
