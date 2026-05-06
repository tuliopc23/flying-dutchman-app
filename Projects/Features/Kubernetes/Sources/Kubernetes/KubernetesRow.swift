import DesignSystem
import Shared
import SwiftUI
import UIComponents

struct KubernetesRow: View {
    let cluster: KubernetesCluster
    var viewModel: KubernetesListViewModel
    var onKubeconfig: () -> Void

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("hexagon", size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(statusColor(for: cluster.status))

                VStack(alignment: .leading, spacing: 2) {
                    Text(cluster.name)
                        .font(DesignSystem.Typography.headline)

                    Text("\(cluster.kind == .vm ? "VM" : "Container") cluster")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }

                Spacer()

                if let url = AppConfig.Networking.kubernetesURL(for: cluster.name) {
                    Link(
                        "\(url.host ?? "k8s"):\(AppConfig.Networking.httpsProxyPort)",
                        destination: url
                    )
                    .font(DesignSystem.Typography.codeSmall)
                }

                actionButtons
            }
            .padding(DesignSystem.Inset.sm)
        }
    }

    private var actionButtons: some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            switch cluster.status {
            case .running:
                Button {
                    Task { await viewModel.stop(cluster) }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)

            case .stopped, .error, .starting, .stopping:
                Button {
                    Task { await viewModel.start(cluster) }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.success)
            }

            Button {
                Task { await viewModel.delete(cluster) }
            } label: {
                Label("Delete", systemImage: "trash")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.glass)

            Button {
                onKubeconfig()
            } label: {
                Label("Kubeconfig", systemImage: "doc.on.doc")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.glass)
        }
    }

    private func statusColor(for status: KubernetesCluster.ClusterStatus) -> Color {
        switch status {
        case .running: DesignSystem.Colors.success
        case .error: DesignSystem.Colors.warning
        default: DesignSystem.Colors.textTertiary
        }
    }
}
