import Dependencies
import DesignSystem
import Shared
import SwiftUI
import UIComponents

struct MachineDetailView: View {
    @Bindable var viewModel: MachineDetailViewModel
    @Dependency(\.terminalLauncher) private var terminalLauncher

    var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Spacing.lg) {
                headerCard
                metadataCard

                if let error = viewModel.error {
                    DiagnosticsBanner(
                        title: "Error",
                        message: error,
                        icon: "exclamationmark.triangle",
                        tone: .warning
                    )
                }
            }
            .padding(DesignSystem.Spacing.lg)
        }
        .navigationTitle(viewModel.machine.name)
    }

    private var headerCard: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("server.rack", size: DesignSystem.Size.iconHuge)
                    .foregroundStyle(statusColor(for: viewModel.machine.status))

                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                    Text(viewModel.machine.name)
                        .font(DesignSystem.Typography.title2)
                    Text(statusText)
                        .font(DesignSystem.Typography.subheadline)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                    Text("ID: \(viewModel.machine.id.prefix(12))")
                        .font(DesignSystem.Typography.caption2)
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                        .monospaced()
                }

                Spacer()

                VStack(spacing: DesignSystem.Spacing.xs) {
                    actionButtons
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    @ViewBuilder
    private var actionButtons: some View {
        if viewModel.isPerformingAction {
            ProgressView()
                .controlSize(.regular)
        } else {
            switch viewModel.machine.status {
            case .running:
                Button {
                    Task { await viewModel.stop() }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.bordered)

                Button {
                    Task { await viewModel.restart() }
                } label: {
                    Label("Restart", systemImage: "arrow.triangle.2.circlepath")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.bordered)

                Button {
                    Task { await openSSH() }
                } label: {
                    Label("SSH", systemImage: "terminal")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.bordered)

            case .stopped, .error, .creating, .starting, .stopping:
                Button {
                    Task { await viewModel.start() }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }

    private var metadataCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                SectionHeader(title: "Machine Details", icon: "info.circle")
                Divider()

                metadataRow(
                    label: "Distro",
                    value: "\(viewModel.machine.distro) \(viewModel.machine.version)",
                    icon: "cube"
                )
                metadataRow(
                    label: "Resources",
                    value: "\(viewModel.machine.cpuCount) CPU • \(viewModel.machine.memoryGB)GB RAM",
                    icon: "speedometer"
                )
                metadataRow(
                    label: "Disk",
                    value: "\(viewModel.machine.diskGB)GB",
                    icon: "internaldrive"
                )

                if let ip = viewModel.machine.ipAddress {
                    metadataRow(label: "IP Address", value: ip, icon: "network")
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private var statusText: String {
        viewModel.machine.status.rawValue.capitalized
    }

    private func statusColor(for status: MachineStatus) -> Color {
        switch status {
        case .running: DesignSystem.Colors.success
        case .error: DesignSystem.Colors.warning
        default: DesignSystem.Colors.textTertiary
        }
    }

    private func metadataRow(label: String, value: String, icon: String) -> some View {
        HStack(spacing: DesignSystem.Spacing.sm) {
            Image.systemIcon(icon, size: DesignSystem.Size.iconRegular)
                .foregroundStyle(DesignSystem.Colors.textTertiary)

            Text(label)
                .font(DesignSystem.Typography.body)
                .foregroundStyle(DesignSystem.Colors.textSecondary)

            Spacer()

            Text(value)
                .font(DesignSystem.Typography.body)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
        }
    }

    private func openSSH() async {
        do {
            try await terminalLauncher.openTerminal("fd machines ssh \(viewModel.machine.name)")
        } catch {
            viewModel.error = "Failed to open terminal: \(error.localizedDescription)"
        }
    }
}
