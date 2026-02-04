import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

@MainActor
@Observable
public final class VolumeListViewModel {
    public var volumes: [VolumeSummary] = []
    public var error: String?
    public var isLoading: Bool = false
    public var searchQuery: String = ""
    
    private let store: VolumeStore
    
    public init(store: VolumeStore = VolumeStore()) {
        self.store = store
    }

    public func load() async {
        isLoading = true
        volumes = await store.fetchAll()
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
    var viewModel: VolumeListViewModel

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            // Header
            HStack {
                Text("Volumes")
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
                .help("Refresh Volumes")
            }
            .padding(.horizontal, DesignSystem.Spacing.md)

            // Search
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                TextField("Search volumes...", text: Bindable(viewModel).searchQuery)
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
                    title: "No volumes found",
                    message: viewModel.searchQuery.isEmpty 
                        ? "Create a volume to persist data." 
                        : "No volumes match your search.",
                    systemImage: "internaldrive"
                )
                .padding(DesignSystem.Spacing.md)
            } else {
                ScrollView {
                    LazyVStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(viewModel.filtered) { volume in
                            VolumeRow(volume: volume)
                        }
                    }
                    .padding(DesignSystem.Spacing.md)
                }
            }
        }
        .onAppear {
            if viewModel.volumes.isEmpty {
                Task { await viewModel.load() }
            }
        }
    }
}

struct VolumeRow: View {
    let volume: VolumeSummary
    
    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("internaldrive", size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(volume.name)
                        .font(DesignSystem.Typography.headline)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    
                    Text(volume.mountPath)
                        .font(DesignSystem.Typography.caption2)
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
                
                Spacer()
                
                if let size = volume.sizeBytes {
                    Text(ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file))
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
            }
            .padding(DesignSystem.Inset.sm)
        }
    }
}
