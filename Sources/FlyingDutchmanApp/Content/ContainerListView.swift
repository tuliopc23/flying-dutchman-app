import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

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
                matchesQuery = container.name.lowercased().contains(needle) || container.image.lowercased().contains(needle)
            }
            let matchesStatus = !showRunningOnly || container.status == .running
            return matchesQuery && matchesStatus
        }
    }

    public func load() async {
        isLoading = true
        containers = await store.fetchAll()
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

struct ContainerListView: View {
    var viewModel: ContainerListViewModel
    var stack: StackSummary?
    @State private var selectedContainer: ContainerSummary?

    var body: some View {
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
            .padding(.horizontal, DesignSystem.Spacing.md)

            // Search & Filter
            HStack(spacing: DesignSystem.Spacing.md) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                    TextField("Search containers...", text: Bindable(viewModel).searchQuery)
                        .textFieldStyle(.plain)
                }
                .padding(DesignSystem.Inset.sm)
                .background(DesignTokens.glassFieldBackground(for: .light)) // Adaptive
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Toggle("Running only", isOn: Bindable(viewModel).showRunningOnly)
                    .toggleStyle(.switch)
                    .controlSize(.mini)
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
                EmptyStateCard(
                    title: "No containers found",
                    message: viewModel.searchQuery.isEmpty 
                        ? "Start the engine or create a container." 
                        : "Try adjusting your search filters.",
                    systemImage: "shippingbox"
                )
                .padding(DesignSystem.Spacing.md)
            } else {
                ScrollView {
                    LazyVStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(filteredForStack) { container in
                            NavigationLink(value: container) {
                                ContainerRow(container: container, viewModel: viewModel)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(DesignSystem.Spacing.md)
                }
            }
        }
        .onAppear {
            if viewModel.containers.isEmpty {
                Task { await viewModel.load() }
            }
        }
        .navigationDestination(for: ContainerSummary.self) { container in
            ContainerDetailView(viewModel: ContainerDetailViewModel(container: container))
        }
    }

    private var filteredForStack: [ContainerSummary] {
        let base = viewModel.filtered
        guard let stack else { return base }
        let allowed = Set(stack.containerNames)
        return base.filter { allowed.contains($0.name) }
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
                    containerStatusSymbol(for: container.status),
                    size: DesignSystem.Size.iconLarge
                )
                .foregroundStyle(containerStatusColor(for: container.status))
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
                        .cornerRadius(4)
                }
                
                // Actions (Hover-only in a real app, always visible for touch/accessibility)
                actionButtons(for: container)
            }
            .padding(DesignSystem.Inset.sm)
        }
    }
    
    @ViewBuilder
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
    
    private func containerStatusSymbol(for status: ContainerSummary.Status) -> String {
        switch status {
        case .running: return "play.circle.fill"
        case .stopped, .created, .removed: return "stop.circle.fill"
        case .starting, .stopping, .removing: return "arrow.triangle.2.circlepath.circle.fill"
        }
    }
    
    private func containerStatusColor(for status: ContainerSummary.Status) -> Color {
        switch status {
        case .running: return DesignSystem.Colors.success
        case .stopped, .created, .removed: return DesignSystem.Colors.textTertiary
        case .starting, .stopping, .removing: return DesignSystem.Colors.warning
        }
    }
}
