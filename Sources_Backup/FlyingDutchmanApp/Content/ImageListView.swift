import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared
import SwiftUI

@MainActor
@Observable
final class ImageListViewModel {
    var images: [ImageSummary] = []
    var error: String?
    var isLoading: Bool = false
    var searchQuery: String = ""
    var pullReference: String = ""
    var pullMessage: String?
    var isPulling: Bool = false

    private let store = ImageStore()

    init() {}

    var filtered: [ImageSummary] {
        guard !searchQuery.isEmpty else { return images }
        let needle = searchQuery.lowercased()
        return images.filter {
            "\($0.name):\($0.tag)".lowercased().contains(needle) || ($0.digest ?? "").lowercased().contains(needle)
        }
    }

    func load() async {
        isLoading = true
        images = await store.fetchAll()
        isLoading = false
    }

    func pull() async {
        guard !pullReference.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        isPulling = true
        pullMessage = nil
        error = nil
        do {
            pullMessage = try await EngineClient.pullImage(reference: pullReference)
            await load()
        } catch {
            self.error = "Pull failed: \(error.localizedDescription)"
        }
        isPulling = false
    }
}

struct ImageListView: View {
    var viewModel: ImageListViewModel

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            // Header with Refresh & Pull
            HStack {
                Text("Images")
                    .font(DesignSystem.Typography.title2)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)

                Spacer()

                HStack(spacing: DesignSystem.Spacing.sm) {
                    TextField("Pull image...", text: Bindable(viewModel).pullReference)
                        .textFieldStyle(.plain)
                        .frame(width: 200)
                        .padding(6)
                        .background(DesignTokens.glassFieldBackground(for: .light))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .onSubmit { Task { await viewModel.pull() } }

                    Button {
                        Task { @MainActor in await viewModel.pull() }
                    } label: {
                        if viewModel.isPulling {
                            ProgressView().controlSize(.small)
                        } else {
                            Label("Pull", systemImage: "arrow.down.circle")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .buttonStyle(.glassProminent)
                    .disabled(viewModel.isPulling || viewModel.pullReference.isEmpty)
                    .help("Pull Image from Registry")
                }

                Button {
                    Task { @MainActor in await viewModel.load() }
                } label: {
                    Label("Refresh", systemImage: "arrow.clockwise")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Refresh Images")
            }
            .padding(.horizontal, DesignSystem.Spacing.md)

            // Search
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                TextField("Search images...", text: Bindable(viewModel).searchQuery)
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
                    title: "No images found",
                    message: viewModel.searchQuery.isEmpty
                        ? "Pull or build an image to get started."
                        : "No images match your search.",
                    systemImage: "shippingbox.fill"
                )
                .padding(DesignSystem.Spacing.md)
            } else {
                ScrollView {
                    LazyVStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(viewModel.filtered, id: \.name) { image in
                            ImageRow(image: image)
                        }
                    }
                    .padding(DesignSystem.Spacing.md)
                }
            }
        }
        .onAppear {
            if viewModel.images.isEmpty {
                Task { await viewModel.load() }
            }
        }
    }
}

struct ImageRow: View {
    let image: ImageSummary

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("shippingbox.fill", size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(DesignSystem.Colors.accent)

                VStack(alignment: .leading, spacing: 2) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(image.name)
                            .font(DesignSystem.Typography.headline)
                            .foregroundStyle(DesignSystem.Colors.textPrimary)
                        Text(image.tag)
                            .font(DesignSystem.Typography.codeSmall)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .background(DesignSystem.Colors.surfaceTertiary)
                            .cornerRadius(4)
                    }

                    Text(image.digest ?? "No digest")
                        .font(DesignSystem.Typography.caption2)
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                        .monospaced()
                }

                Spacer()

                if let size = image.sizeBytes {
                    Text(ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file))
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
            }
            .padding(DesignSystem.Inset.sm)
        }
    }
}
