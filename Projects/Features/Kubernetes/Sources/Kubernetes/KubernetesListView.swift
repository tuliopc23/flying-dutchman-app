import DesignSystem
import Shared
import SwiftUI
import UIComponents

public struct KubernetesListView: View {
    @Bindable var viewModel: KubernetesListViewModel
    @State private var kubeconfig: String?
    @State private var showKubeconfig: Bool = false

    public init(viewModel: KubernetesListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            header

            if let error = viewModel.error {
                DiagnosticsBanner(
                    title: "Error",
                    message: error,
                    icon: "exclamationmark.triangle",
                    tone: .warning
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            }

            if viewModel.clusters.isEmpty {
                EmptyStateCard(
                    title: "No Kubernetes clusters",
                    message: "Create a cluster to get started.",
                    systemImage: "hexagon"
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            } else {
                LazyVStack(spacing: DesignSystem.Spacing.sm) {
                    ForEach(viewModel.clusters) { cluster in
                        KubernetesRow(cluster: cluster, viewModel: viewModel) {
                            Task {
                                kubeconfig = await viewModel.kubeconfig(cluster)
                                showKubeconfig = true
                            }
                        }
                    }
                }
                .padding(.horizontal, DesignSystem.Spacing.md)
            }
        }
        .onAppear {
            if viewModel.clusters.isEmpty {
                Task { await viewModel.load() }
            }
        }
        .sheet(isPresented: $viewModel.showCreateSheet) {
            KubernetesCreateSheet(viewModel: viewModel)
        }
        .sheet(isPresented: $showKubeconfig) {
            KubernetesKubeconfigSheet(kubeconfig: kubeconfig ?? "")
        }
    }

    private var header: some View {
        HStack {
            Text("Kubernetes")
                .font(DesignSystem.Typography.title2)
                .foregroundStyle(DesignSystem.Colors.textPrimary)

            Spacer()

            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.small)
            }

            Button {
                viewModel.showCreateSheet = true
            } label: {
                Label("Create", systemImage: "plus")
            }
            .buttonStyle(.glassProminent)

            Button {
                Task { await viewModel.load() }
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.glass)
        }
        .padding(.horizontal, DesignSystem.Spacing.md)
    }
}
