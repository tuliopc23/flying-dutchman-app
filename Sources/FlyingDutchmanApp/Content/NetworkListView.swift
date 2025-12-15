import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

@MainActor
@Observable
final class NetworkListViewModel {
    var networks: [NetworkSummary] = []
    var error: String?
    var isLoading: Bool = false
    var searchQuery: String = ""

    func load() async {
        isLoading = true
        error = nil
        do {
            networks = try await EngineClient.listNetworks()
        } catch {
            networks = ContainerFixtures.sampleNetworks
            self.error = "Showing mock networks. Engine unreachable: \(error.localizedDescription)"
        }
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
    @Bindable var viewModel: NetworkListViewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Networks", subtitle: "Connectivity surfaces", icon: "network") {
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { @MainActor in await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                TextField("Search networks", text: $viewModel.searchQuery)
                    .textFieldStyle(.roundedBorder)

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                if viewModel.filtered.isEmpty {
                    EmptyStateCard(
                        title: "No networks",
                        message: "Create a network to connect containers.",
                        systemImage: "network"
                    )
                } else {
                    VStack(spacing: 10) {
                        ForEach(viewModel.filtered) { network in
                            HStack(spacing: 10) {
                                Image(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(network.name)
                                    Text(network.subnet ?? "No subnet")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text(network.connectedContainerIDs.isEmpty ? "0 containers" : "\(network.connectedContainerIDs.count) containers")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(10)
                            .background(DesignTokens.glassFieldBackground(for: colorScheme))
                            .clipShape(DesignTokens.glassShape)
                        }
                    }
                }
            }
        }
    }
}
