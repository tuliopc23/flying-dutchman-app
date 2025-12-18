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
final class ContainerListViewModel {
    var containers: [ContainerSummary] = []
    var error: String?
    var isLoading: Bool = false
    var searchQuery: String = ""
    var showRunningOnly: Bool = false

    var filtered: [ContainerSummary] {
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

    func load() async {
        isLoading = true
        error = nil
        do {
            containers = try await EngineClient.listContainers()
        } catch {
            containers = SeedData.sampleContainers
            self.error = "Showing mock data. Engine unreachable: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func start(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.startContainer)
    }

    func stop(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.stopContainer)
    }

    func restart(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.restartContainer)
    }

    private func mutate(
        _ container: ContainerSummary,
        action: @escaping (UUID) async throws -> ContainerSummary
    ) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let updated = try await action(container.id)
            if let idx = containers.firstIndex(where: { $0.id == updated.id }) {
                containers[idx] = updated
            }
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}

struct ContainerListView: View {
    @Bindable var viewModel: ContainerListViewModel
    var stack: StackSummary?
    @State private var selectedContainer: ContainerSummary?

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                SectionHeader(
                    title: "Containers", 
                    subtitle: "Manage running and stopped containers", 
                    icon: "shippingbox.circle"
                ) {
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { @MainActor in await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                HStack(spacing: DesignSystem.Spacing.md) {
                    TextField("Search containers or images", text: $viewModel.searchQuery)
                        .textFieldStyle(.roundedBorder)
                    
                    Toggle("Running only", isOn: $viewModel.showRunningOnly)
                        .toggleStyle(.switch)
                        .labelsHidden()
                        .help("Show only running containers")
                }

                if let error = viewModel.error {
                    Text(error)
                        .font(DesignSystem.Typography.footnote)
                        .foregroundStyle(DesignSystem.Colors.warning)
                }

                if viewModel.filtered.isEmpty {
                    EmptyStateCard(
                        title: "No containers",
                        message: "Start the engine or create a container to see it here.",
                        systemImage: "shippingbox"
                    )
                } else {
                    VStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(filteredForStack) { container in
                            NavigationLink(value: container) {
                                HStack(spacing: DesignSystem.Spacing.md) {
                                    Image.systemIcon(
                                        containerStatusSymbol(for: container.status),
                                        size: DesignSystem.Size.iconRegular
                                    )
                                    .foregroundStyle(containerStatusColor(for: container.status))
                                    .symbolEffect(.variableColor.iterative, isActive: container.status == .running)
                                    
                                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.xxs) {
                                        Text(container.name)
                                            .font(DesignSystem.Typography.body)
                                            .foregroundStyle(DesignSystem.Colors.textPrimary)
                                        
                                        Text(container.image)
                                            .font(DesignSystem.Typography.caption1)
                                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                                        
                                        Text(container.ports.isEmpty ? "No exposed ports" : container.ports.joined(separator: ", "))
                                            .font(DesignSystem.Typography.caption2)
                                            .foregroundStyle(DesignSystem.Colors.textTertiary)
                                    }
                                    
                                    Spacer()
                                    
                                    actionButtons(for: container)
                                }
                                .padding(DesignSystem.Inset.sm)
                                .background(DesignSystem.Colors.surfaceSecondary)
                                .cornerRadius(DesignSystem.CornerRadius.regular)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .navigationDestination(for: ContainerSummary.self) { container in
                        ContainerDetailView(viewModel: ContainerDetailViewModel(container: container))
                    }
                }
            }
        }
    }

    private var filteredForStack: [ContainerSummary] {
        let base = viewModel.filtered
        guard let stack else { return base }
        let allowed = Set(stack.containerNames)
        return base.filter { allowed.contains($0.name) }
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
                }
                .buttonStyle(.glass)
                
                Button {
                    Task { @MainActor in await viewModel.restart(container) }
                } label: {
                    Label("Restart", systemImage: "arrow.triangle.2.circlepath")
                }
                .buttonStyle(.glass)
                
            case .stopped, .paused:
                Button {
                    Task { @MainActor in await viewModel.start(container) }
                } label: {
                    Label("Start", systemImage: "play.fill")
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.success)
            }
        }
    }
    
    // MARK: - Status Helpers (migrated from legacy DesignTokens)
    
    private func containerStatusSymbol(for status: ContainerSummary.Status) -> String {
        switch status {
        case .running: return "play.circle.fill"
        case .stopped: return "stop.circle.fill"
        case .paused: return "pause.circle.fill"
        }
    }
    
    private func containerStatusColor(for status: ContainerSummary.Status) -> Color {
        switch status {
        case .running: return DesignSystem.Colors.success
        case .stopped: return DesignSystem.Colors.textTertiary
        case .paused: return DesignSystem.Colors.warning
        }
    }
}
