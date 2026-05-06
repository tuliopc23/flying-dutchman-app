import DesignSystem
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

@MainActor
@Observable
public final class ContainerListViewModel {
    public var containers: [ContainerSummary] = []
    public var error: String?
    public var isLoading: Bool = false
    public var searchQuery: String = ""
    public var showRunningOnly: Bool = false

    private let store = ContainerStore()

    public init() {}

    public var filtered: [ContainerSummary] {
        containers.filter { container in
            let matchesQuery: Bool
            if searchQuery.isEmpty {
                matchesQuery = true
            } else {
                let needle = searchQuery.lowercased()
                matchesQuery = container.name.lowercased().contains(needle) || container.image.lowercased()
                    .contains(needle)
            }
            let matchesStatus = !showRunningOnly || container.status == .running
            return matchesQuery && matchesStatus
        }
    }

    public func load() async {
        isLoading = true
        containers = store.fetchAll()
        isLoading = false
    }

    public func start(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.startContainer)
    }

    public func stop(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.stopContainer)
    }

    public func restart(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.restartContainer)
    }

    private func mutate(
        _ container: ContainerSummary,
        action: @escaping (UUID) async throws -> ContainerSummary
    ) async {
        isLoading = true
        defer { isLoading = false }
        do {
            _ = try await action(container.id)
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}

public struct ContainerListView: View {
    @Bindable var viewModel: ContainerListViewModel
    var stack: StackSummary?
    @State private var selectedContainer: ContainerSummary?

    public init(viewModel: ContainerListViewModel, stack: StackSummary? = nil) {
        self.viewModel = viewModel
        self.stack = stack
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Spacing.lg) {
                // Header with Refresh Action
                HStack {
                    Text("Containers")
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
                    }
                    .buttonStyle(.glass)
                }
                .padding(.horizontal, DesignSystem.Inset.lg.leading)
                .padding(.top, DesignSystem.Inset.lg.top)

                // Container Grid
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 300), spacing: DesignSystem.Spacing.lg)],
                    spacing: DesignSystem.Spacing.lg
                ) {
                    ForEach(viewModel.filtered) { container in
                        ContainerCard(container: container) {
                            selectedContainer = container
                        }
                    }
                }
                .padding(.horizontal, DesignSystem.Inset.lg.leading)
            }
        }
        .background(DesignSystem.Colors.background)
        .task {
            await viewModel.load()
        }
        .sheet(item: $selectedContainer) { container in
            ContainerDetailView(
                viewModel: ContainerDetailViewModel(container: container)
            )
            .frame(minWidth: 600, minHeight: 400)
        }
    }
}

struct ContainerCard: View {
    let container: ContainerSummary
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            GlassCard {
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    HStack {
                        Image(systemName: DesignTokens.containerStatusSymbol(for: container.status))
                            .foregroundStyle(DesignTokens.containerStatusColor(for: container.status))

                        Text(container.name)
                            .font(DesignSystem.Typography.headline)
                            .lineLimit(1)

                        Spacer()

                        Text(container.id.uuidString.prefix(8))
                            .font(DesignSystem.Typography.codeSmall)
                            .foregroundStyle(DesignSystem.Colors.textTertiary)
                    }

                    Text(container.image)
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        .lineLimit(1)
                        .truncationMode(.middle)

                    if !container.ports.isEmpty {
                        HStack {
                            ForEach(Swift.Array(container.ports.prefix(2)), id: \.self) { port in
                                Text(port)
                                    .font(DesignSystem.Typography.codeSmall)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(DesignSystem.Colors.surfaceSecondary.opacity(0.5))
                                    .clipShape(DesignSystem.Shapes.chip)
                            }
                            if container.ports.count > 2 {
                                Text("+\(container.ports.count - 2)")
                                    .font(DesignSystem.Typography.caption2)
                                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                            }
                        }
                    }
                }
            }
        }
        .buttonStyle(.plain)
    }
}

struct ContainerRow: View {
    let container: ContainerSummary
    var viewModel: ContainerListViewModel

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                // Status Icon
                Image.systemIcon(
                    DesignTokens.containerStatusSymbol(for: container.status),
                    size: DesignSystem.Size.iconLarge
                )
                .foregroundStyle(DesignTokens.containerStatusColor(for: container.status))
                .symbolEffect(.variableColor.iterative, isActive: container.status == .running)

                // Info
                VStack(alignment: .leading, spacing: 2) {
                    Text(container.name)
                        .font(DesignSystem.Typography.headline)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)

                    Text(container.image)
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }

                Spacer()

                // Ports Badge
                if !container.ports.isEmpty {
                    Text(container.ports.first ?? "")
                        .font(DesignSystem.Typography.codeSmall)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(DesignSystem.Colors.surfaceTertiary)
                        .clipShape(DesignSystem.Shapes.chip)
                }

                // Actions (Hover-only in a real app, always visible for touch/accessibility)
                actionButtons(for: container)
            }
            .padding(DesignSystem.Inset.sm)
        }
    }

    private func actionButtons(for container: ContainerSummary) -> some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            switch container.status {
            case .running:
                Button {
                    Task { @MainActor in await viewModel.stop(container) }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Stop Container")

                Button {
                    Task { @MainActor in await viewModel.restart(container) }
                } label: {
                    Label("Restart", systemImage: "arrow.triangle.2.circlepath")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Restart Container")

            case .stopped, .created, .removed:
                Button {
                    Task { @MainActor in await viewModel.start(container) }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.success)
                .help("Start Container")

            case .starting, .stopping, .removing:
                ProgressView()
                    .controlSize(.small)
            }
        }
    }
}
