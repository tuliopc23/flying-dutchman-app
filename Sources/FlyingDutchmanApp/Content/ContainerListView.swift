import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

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
            containers = ContainerFixtures.sampleContainers
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
    @Environment(\.colorScheme) private var colorScheme
    @State private var selectedContainer: ContainerSummary?

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Containers", subtitle: "Manage running and stopped containers", icon: "shippingbox.circle") {
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { @MainActor in await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                HStack {
                    TextField("Search containers or images", text: $viewModel.searchQuery)
                        .textFieldStyle(.roundedBorder)
                    Toggle("Running only", isOn: $viewModel.showRunningOnly)
                        .toggleStyle(.switch)
                        .labelsHidden()
                        .help("Show only running containers")
                }

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                if viewModel.filtered.isEmpty {
                    EmptyStateCard(
                        title: "No containers",
                        message: "Start the engine or create a container to see it here.",
                        systemImage: "shippingbox"
                    )
                } else {
                    VStack(spacing: 10) {
                        ForEach(filteredForStack) { container in
                            NavigationLink(value: container) {
                                HStack(spacing: 12) {
                                    Image(systemName: DesignTokens.containerStatusSymbol(for: container.status))
                                        .foregroundStyle(DesignTokens.containerStatusColor(for: container.status))
                                        .symbolEffect(.variableColor.iterative, isActive: container.status == .running)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(container.name)
                                            .foregroundStyle(.primary)
                                        Text(container.image)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                        Text(container.ports.isEmpty ? "No exposed ports" : container.ports.joined(separator: ", "))
                                            .font(.caption2)
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    actionButtons(for: container)
                                }
                                .padding(10)
                                .background(DesignTokens.glassFieldBackground(for: colorScheme))
                                .clipShape(DesignTokens.glassShape)
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
        switch container.status {
        case .running:
            Button {
                Task { @MainActor in await viewModel.stop(container) }
            } label: {
                Label("Stop", systemImage: "stop.fill")
            }
            .buttonStyle(.bordered)
            Button {
                Task { @MainActor in await viewModel.restart(container) }
            } label: {
                Label("Restart", systemImage: "arrow.triangle.2.circlepath")
            }
            .buttonStyle(.bordered)
        case .stopped, .paused:
            Button {
                Task { @MainActor in await viewModel.start(container) }
            } label: {
                Label("Start", systemImage: "play.fill")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
