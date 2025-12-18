import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers
import FlyingDutchmanPersistence
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import SwiftUI
import FlyingDutchmanPersistence

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

    var filtered: [ImageSummary] {
        guard !searchQuery.isEmpty else { return images }
        let needle = searchQuery.lowercased()
        return images.filter {
            "\($0.name):\($0.tag)".lowercased().contains(needle) || ($0.digest ?? "").lowercased().contains(needle)
        }
    }

    func load() async {
        isLoading = true
        error = nil
        do {
            images = try await EngineClient.listImages()
        } catch {
            images = SeedData.sampleImages
            self.error = "Showing mock images. Engine unreachable: \(error.localizedDescription)"
        }
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
    @Bindable var viewModel: ImageListViewModel

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                SectionHeader(title: "Images", subtitle: "Local and cached images", icon: "shippingbox.fill") {
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { @MainActor in await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                    .buttonStyle(.glass)
                }

                TextField("Search images", text: $viewModel.searchQuery)
                    .textFieldStyle(.roundedBorder)

                HStack(spacing: DesignSystem.Spacing.sm) {
                    TextField("Pull image (e.g. postgres:16-alpine)", text: $viewModel.pullReference)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        Task { @MainActor in await viewModel.pull() }
                    } label: {
                        Label(viewModel.isPulling ? "Pulling…" : "Pull", systemImage: "arrow.down.circle")
                    }
                    .disabled(viewModel.isPulling)
                    .buttonStyle(.glassProminent)
                    .tint(DesignSystem.Colors.accent)
                }

                if let pullMessage = viewModel.pullMessage {
                    Text(pullMessage)
                        .font(DesignSystem.Typography.footnote)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }

                if let error = viewModel.error {
                    Text(error)
                        .font(DesignSystem.Typography.footnote)
                        .foregroundStyle(DesignSystem.Colors.warning)
                }

                if viewModel.filtered.isEmpty {
                    EmptyStateCard(
                        title: "No images",
                        message: "Pull or create an image to view it here.",
                        systemImage: "shippingbox"
                    )
                } else {
                    VStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(viewModel.filtered, id: \.name) { image in
                            HStack(spacing: DesignSystem.Spacing.md) {
                                Image.systemIcon("shippingbox.circle", size: DesignSystem.Size.iconRegular)
                                    .foregroundStyle(DesignSystem.Colors.accent)
                                
                                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xxs) {
                                    Text("\(image.name):\(image.tag)")
                                        .font(DesignSystem.Typography.body)
                                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                                    
                                    Text(image.digest ?? "No digest")
                                        .font(DesignSystem.Typography.caption2)
                                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                                }
                                
                                Spacer()
                                
                                Text(image.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—")
                                    .font(DesignSystem.Typography.caption1)
                                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                            }
                            .padding(DesignSystem.Inset.sm)
                            .background(DesignSystem.Colors.surfaceSecondary)
                            .cornerRadius(DesignSystem.CornerRadius.regular)
                        }
                    }
                }
            }
        }
    }
}
