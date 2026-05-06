import DesignSystem
import FlyingDutchmanNetworking
import Shared
import SwiftUI
import UIComponents

@MainActor
@Observable
public final class ImageListViewModel {
    public var images: [ImageSummary] = []
    public var error: String?
    public var isLoading: Bool = false
    public var searchQuery: String = ""
    public var pullReference: String = ""
    public var pullMessage: String?
    public var isPulling: Bool = false
    public var buildContextPath: String = FileManager.default.currentDirectoryPath
    public var buildDockerfilePath: String = ""
    public var buildTag: String = "flyingdutchman/local:latest"
    public var buildPlatforms: String = ""
    public var buildArguments: String = ""
    public var buildMessage: String?
    public var buildLogs: [String] = []
    public var isBuilding: Bool = false

    public init() {}

    var filtered: [ImageSummary] {
        guard !searchQuery.isEmpty else { return images }
        let needle = searchQuery.lowercased()
        return images.filter {
            "\($0.name):\($0.tag)".lowercased().contains(needle) || ($0.digest ?? "").lowercased().contains(needle)
        }
    }

    public func load() async {
        isLoading = true
        error = nil
        do {
            images = try await EngineClient.listImages()
        } catch {
            self.error = "Couldn't load images: \(error.localizedDescription)"
        }
        isLoading = false
    }

    public func pull() async {
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

    public func build() async {
        let tags = buildTag
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        guard !buildContextPath.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            error = "Build context is required."
            return
        }
        guard !tags.isEmpty else {
            error = "At least one build tag is required."
            return
        }

        isBuilding = true
        error = nil
        buildMessage = nil
        buildLogs = []

        let platformValues = buildPlatforms
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        let args = buildArguments
            .split(whereSeparator: \.isNewline)
            .compactMap { line -> (String, String)? in
                let pieces = line.split(separator: "=", maxSplits: 1).map(String.init)
                guard pieces.count == 2 else { return nil }
                return (pieces[0], pieces[1])
            }
        let request = ImageBuildRequest(
            contextPath: buildContextPath,
            dockerfilePath: buildDockerfilePath.trimmingCharacters(in: .whitespacesAndNewlines)
                .isEmpty ? nil : buildDockerfilePath,
            tags: tags,
            platforms: platformValues,
            buildArguments: Dictionary(uniqueKeysWithValues: args)
        )

        do {
            let result = try await EngineClient.buildImage(request)
            buildMessage = "Built \(result.image.displayName) via \(result.builder)."
            buildLogs = result.logs
            await load()
        } catch {
            self.error = "Build failed: \(error.localizedDescription)"
        }

        isBuilding = false
    }
}

public struct ImageListView: View {
    @Bindable var viewModel: ImageListViewModel
    @Environment(\.colorScheme) private var colorScheme

    public init(viewModel: ImageListViewModel) {
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

            if let pullMessage = viewModel.pullMessage {
                statusBanner(title: "Pull complete", message: pullMessage)
            }

            if let buildMessage = viewModel.buildMessage {
                statusBanner(title: "Build complete", message: buildMessage)
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
                        ForEach(viewModel.filtered, id: \.id) { image in
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
        .searchable(text: $viewModel.searchQuery)
    }

    private var header: some View {
        VStack(spacing: DesignSystem.Spacing.md) {
            HStack {
                Text("Images")
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
                .help("Refresh Images")
            }
            .padding(.horizontal, DesignSystem.Spacing.md)

            HStack(alignment: .top, spacing: DesignSystem.Spacing.md) {
                pullCard
                buildCard
            }
            .padding(.horizontal, DesignSystem.Spacing.md)
        }
    }

    private var pullCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                SectionHeader(title: "Pull", icon: "arrow.down.circle")
                TextField("ghcr.io/fd/api:dev", text: $viewModel.pullReference)
                    .textFieldStyle(.plain)
                    .padding(8)
                    .background(DesignTokens.glassFieldBackground(for: colorScheme))
                    .clipShape(DesignSystem.Shapes.input)
                    .onSubmit { Task { await viewModel.pull() } }

                Button {
                    Task { await viewModel.pull() }
                } label: {
                    if viewModel.isPulling {
                        ProgressView()
                    } else {
                        Label("Pull Image", systemImage: "arrow.down.circle")
                    }
                }
                .buttonStyle(.glassProminent)
                .disabled(viewModel.isPulling || viewModel.pullReference.isEmpty)
            }
            .padding(DesignSystem.Inset.md)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var buildCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                SectionHeader(title: "Build", icon: "hammer")

                buildField(
                    "Context",
                    text: $viewModel.buildContextPath,
                    prompt: FileManager.default.currentDirectoryPath
                )
                buildField("Dockerfile", text: $viewModel.buildDockerfilePath, prompt: "Optional path")
                buildField("Tag(s)", text: $viewModel.buildTag, prompt: "example/app:latest")
                buildField("Platforms", text: $viewModel.buildPlatforms, prompt: "linux/amd64,linux/arm64")

                VStack(alignment: .leading, spacing: 6) {
                    Text("Build args")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                    TextEditor(text: $viewModel.buildArguments)
                        .frame(minHeight: 64)
                        .padding(6)
                        .background(DesignTokens.glassFieldBackground(for: colorScheme))
                        .clipShape(DesignSystem.Shapes.input)
                }

                Button {
                    Task { await viewModel.build() }
                } label: {
                    if viewModel.isBuilding {
                        ProgressView()
                    } else {
                        Label("Build Image", systemImage: "hammer")
                    }
                }
                .buttonStyle(.glassProminent)
                .disabled(viewModel.isBuilding)

                if !viewModel.buildLogs.isEmpty {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(Array(viewModel.buildLogs.suffix(12).enumerated()), id: \.offset) { _, line in
                                Text(line)
                                    .font(DesignSystem.Typography.codeSmall)
                                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .frame(minHeight: 80, maxHeight: 140)
                }
            }
            .padding(DesignSystem.Inset.md)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func buildField(_ label: String, text: Binding<String>, prompt: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
            TextField(prompt, text: text)
                .textFieldStyle(.plain)
                .padding(8)
                .background(DesignTokens.glassFieldBackground(for: colorScheme))
                .clipShape(DesignSystem.Shapes.input)
        }
    }

    private func statusBanner(title: String, message: String) -> some View {
        DiagnosticsBanner(
            title: title,
            message: message,
            icon: "checkmark.circle",
            tone: .info
        )
        .padding(.horizontal, DesignSystem.Spacing.md)
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
                            .clipShape(DesignSystem.Shapes.chip)
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
