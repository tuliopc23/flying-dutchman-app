import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

@Observable
final class VolumeListViewModel {
    var volumes: [VolumeSummary] = []
    var error: String?
    var isLoading: Bool = false
    var searchQuery: String = ""

    func load() async {
        isLoading = true
        error = nil
        do {
            volumes = try await EngineClient.listVolumes()
        } catch {
            volumes = ContainerFixtures.sampleVolumes
            self.error = "Showing mock volumes. Engine unreachable: \(error.localizedDescription)"
        }
        isLoading = false
    }

    var filtered: [VolumeSummary] {
        guard !searchQuery.isEmpty else { return volumes }
        let needle = searchQuery.lowercased()
        return volumes.filter { volume in
            volume.name.lowercased().contains(needle) || volume.mountPath.lowercased().contains(needle)
        }
    }
}

struct VolumeListView: View {
    @Bindable var viewModel: VolumeListViewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Volumes", subtitle: "Persistent storage", icon: "internaldrive") {
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                TextField("Search volumes", text: $viewModel.searchQuery)
                    .textFieldStyle(.roundedBorder)

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                if viewModel.filtered.isEmpty {
                    EmptyStateCard(
                        title: "No volumes",
                        message: "Create or attach a volume to see it here.",
                        systemImage: "internaldrive"
                    )
                } else {
                    VStack(spacing: 10) {
                        ForEach(viewModel.filtered) { volume in
                            HStack(spacing: 10) {
                                Image(systemName: "externaldrive")
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(volume.name)
                                    Text(volume.mountPath)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text(volume.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—")
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
