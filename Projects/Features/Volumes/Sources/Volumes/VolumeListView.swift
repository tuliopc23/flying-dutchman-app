import DesignSystem
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

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
        volumes = store.fetchAll()
        isLoading = false
    }

    public func delete(_ volume: VolumeSummary) async {
        isLoading = true
        defer { isLoading = false }
        do {
            try await EngineClient.removeVolume(name: volume.name)
            await load()
        } catch {
            self.error = "Delete failed: \(error.localizedDescription)"
        }
    }

    var filtered: [VolumeSummary] {
        guard !searchQuery.isEmpty else { return volumes }
        let needle = searchQuery.lowercased()
        return volumes.filter { volume in
            volume.name.lowercased().contains(needle) || volume.mountPath.lowercased().contains(needle)
        }
    }
}

public struct VolumeListView: View {
    @Bindable var viewModel: VolumeListViewModel
    @State private var volumeToDelete: VolumeSummary?

    public init(viewModel: VolumeListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            // Header
            HStack {
                Text("Volumes")
                    .font(DesignSystem.Typography.title2)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)

                Spacer()

                if viewModel.isLoading {
                    ProgressView()
                        .controlSize(.small)
                }

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
                EmptyStateView(
                    title: "No volumes found",
                    message: viewModel.searchQuery.isEmpty
                        ? "Create a volume to persist container data."
                        : "No volumes match your search.",
                    systemImage: "internaldrive",
                    actionTitle: "Refresh",
                    action: {
                        Task { @MainActor in await viewModel.load() }
                    }
                )
                .padding(DesignSystem.Spacing.md)
            } else {
                ScrollView {
                    LazyVStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(viewModel.filtered) { volume in
                            VolumeRow(volume: volume) {
                                volumeToDelete = volume
                            }
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
        .searchable(text: $viewModel.searchQuery)
        .confirmationDialog(
            "Are you sure you want to delete this volume?",
            isPresented: Binding(
                get: { volumeToDelete != nil },
                set: { if !$0 { volumeToDelete = nil } }
            ),
            titleVisibility: .visible,
            presenting: volumeToDelete
        ) { volume in
            Button("Delete", role: .destructive) {
                Task {
                    await viewModel.delete(volume)
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: { volume in
            Text(
                "This action cannot be undone. All files stored in volume '\(volume.name)' will be permanently deleted."
            )
        }
    }
}

struct VolumeRow: View {
    let volume: VolumeSummary
    let onDelete: () -> Void

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

                Button(role: .destructive, action: onDelete) {
                    Label("Delete", systemImage: "trash")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Delete Volume")
            }
            .padding(DesignSystem.Inset.sm)
        }
    }
}
