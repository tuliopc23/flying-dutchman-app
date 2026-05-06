import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared
import SwiftUI

@MainActor
@Observable
public final class NetworkListViewModel {
    public var networks: [NetworkSummary] = []
    public var error: String?
    public var isLoading: Bool = false
    public var searchQuery: String = ""

    private let store = NetworkStore()

    public init() {}

    public func load() async {
        isLoading = true
        networks = await store.fetchAll()
        isLoading = false
    }

    var filtered: [NetworkSummary] {
        guard !searchQuery.isEmpty else { return networks }
        let needle = searchQuery.lowercased()
        return networks.filter { network in
            network.name.lowercased().contains(needle) || (network.subnet ?? "").lowercased().contains(needle)
        }
    }
}

struct NetworkListView: View {
    var viewModel: NetworkListViewModel

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            // Header
            HStack {
                Text("Networks")
                    .font(DesignSystem.Typography.title2)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)

                Spacer()

                Button {
                    Task { @MainActor in await viewModel.load() }
                } label: {
                    Label("Refresh", systemImage: "arrow.clockwise")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Refresh Networks")
            }
            .padding(.horizontal, DesignSystem.Spacing.md)

            // Search
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                TextField("Search networks...", text: Bindable(viewModel).searchQuery)
                    .textFieldStyle(.plain)
            }
            .padding(DesignSystem.Inset.sm)
            .background(DesignTokens.glassFieldBackground(for: .light))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, DesignSystem.Spacing.md)

            if let error = viewModel.error {
                DiagnosticsBanner(
                    title: "Error",
                    message: error,
                    icon: "exclamationmark.triangle",
                    tone: .warning
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            }

            if viewModel.filtered.isEmpty {
                EmptyStateCard(
                    title: "No networks found",
                    message: viewModel.searchQuery.isEmpty
                        ? "Create a network to connect containers."
                        : "No networks match your search.",
                    systemImage: "network"
                )
                .padding(DesignSystem.Spacing.md)
            } else {
                ScrollView {
                    LazyVStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(viewModel.filtered) { network in
                            NetworkRow(network: network)
                        }
                    }
                    .padding(DesignSystem.Spacing.md)
                }
            }
        }
        .onAppear {
            if viewModel.networks.isEmpty {
                Task { await viewModel.load() }
            }
        }
    }
}

struct NetworkRow: View {
    let network: NetworkSummary

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("network", size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)

                VStack(alignment: .leading, spacing: 2) {
                    Text(network.name)
                        .font(DesignSystem.Typography.headline)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)

                    if let subnet = network.subnet {
                        Text(subnet)
                            .font(DesignSystem.Typography.codeSmall)
                            .foregroundStyle(DesignSystem.Colors.textTertiary)
                    }
                }

                Spacer()

                Text("\(network.connectedContainerIDs.count) containers")
                    .font(DesignSystem.Typography.caption1)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(DesignSystem.Colors.surfaceTertiary)
                    .cornerRadius(6)
            }
            .padding(DesignSystem.Inset.sm)
        }
    }
}
