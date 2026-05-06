import DesignSystem
import Shared
import SwiftUI
import UIComponents

struct MachineRow: View {
    let machine: Machine
    var viewModel: MachineListViewModel

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon(statusSymbol(for: machine.status), size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(statusColor(for: machine.status))

                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: DesignSystem.Spacing.xs) {
                        Text(machine.name)
                            .font(DesignSystem.Typography.headline)
                            .foregroundStyle(DesignSystem.Colors.textPrimary)

                        if machine.isKubernetesCluster {
                            Text("k8s")
                                .font(DesignSystem.Typography.caption1)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(DesignSystem.Colors.surfaceTertiary)
                                .clipShape(DesignSystem.Shapes.chip)
                        }
                    }

                    Text("\(machine.distro) \(machine.version) • \(machine.cpuCount) CPU • \(machine.memoryGB)GB")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }

                Spacer()

                if let ip = machine.ipAddress {
                    Text(ip)
                        .font(DesignSystem.Typography.codeSmall)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(DesignSystem.Colors.surfaceTertiary)
                        .clipShape(DesignSystem.Shapes.chip)
                }

                actionButtons(for: machine)
            }
            .padding(DesignSystem.Inset.sm)
        }
    }

    private func actionButtons(for machine: Machine) -> some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            switch machine.status {
            case .running:
                Button {
                    Task { await viewModel.stop(machine) }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Stop Machine")

                Button {
                    Task { await viewModel.restart(machine) }
                } label: {
                    Label("Restart", systemImage: "arrow.triangle.2.circlepath")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Restart Machine")

            case .stopped, .error, .creating, .starting, .stopping:
                Button {
                    Task { await viewModel.start(machine) }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.success)
                .help("Start Machine")
            }
        }
    }

    private func statusSymbol(for status: MachineStatus) -> String {
        switch status {
        case .running: "server.rack"
        case .stopped: "server.rack"
        case .starting: "arrow.triangle.2.circlepath"
        case .stopping: "arrow.down.circle"
        case .creating: "sparkles"
        case .error: "exclamationmark.triangle"
        }
    }

    private func statusColor(for status: MachineStatus) -> Color {
        switch status {
        case .running: DesignSystem.Colors.success
        case .error: DesignSystem.Colors.warning
        default: DesignSystem.Colors.textTertiary
        }
    }
}
