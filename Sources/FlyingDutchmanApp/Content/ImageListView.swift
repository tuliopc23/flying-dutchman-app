import Shared
import FlyingDutchmanContainers
import SwiftUI

@Observable
final class ImageListViewModel {
    var images: [ImageSummary] = []
    var error: String?
    var isLoading: Bool = false
    var searchQuery: String = ""

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
            images = ContainerFixtures.sampleImages
            self.error = "Showing mock images. Engine unreachable: \(error.localizedDescription)"
        }
        isLoading = false
    }
}

struct ImageListView: View {
    @Bindable var viewModel: ImageListViewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Images", subtitle: "Local and cached images", icon: "shippingbox.fill") {
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                TextField("Search images", text: $viewModel.searchQuery)
                    .textFieldStyle(.roundedBorder)

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                if viewModel.filtered.isEmpty {
                    EmptyStateCard(
                        title: "No images",
                        message: "Pull or create an image to view it here.",
                        systemImage: "shippingbox"
                    )
                } else {
                    VStack(spacing: 10) {
                        ForEach(viewModel.filtered, id: \.name) { image in
                            HStack(spacing: 10) {
                                Image(systemName: "shippingbox.circle")
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("\(image.name):\(image.tag)")
                                    Text(image.digest ?? "No digest")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text(image.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—")
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
