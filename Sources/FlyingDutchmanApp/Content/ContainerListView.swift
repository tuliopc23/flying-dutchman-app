import Shared
import SwiftUI

@Observable
final class ContainerListViewModel {
    var containers: [ContainerSummary] = []
    var error: String?
    var isLoading: Bool = false

    func load() async {
        isLoading = true
        error = nil
        do {
            containers = try await EngineClient.listContainers()
        } catch {
            containers = ContainerFixtures.sampleContainers
            error = "Showing mock data. Engine unreachable: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func start(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.startContainer)
    }

    func stop(_ container: ContainerSummary) async {
        await mutate(container, action: EngineClient.stopContainer)
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

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Label("Containers", systemImage: "shippingbox.circle")
                        .font(.title3.weight(.semibold))
                    Spacer()
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                if viewModel.containers.isEmpty {
                    Text("No containers available.")
                        .foregroundStyle(.secondary)
                } else {
                    VStack(spacing: 10) {
                        ForEach(viewModel.containers) { container in
                            HStack(spacing: 12) {
                                Image(systemName: DesignTokens.containerStatusSymbol(for: container.status))
                                    .foregroundStyle(DesignTokens.containerStatusColor(for: container.status))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(container.name)
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
                            .background(Color.secondary.opacity(0.05))
                            .clipShape(DesignTokens.glassShape)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func actionButtons(for container: ContainerSummary) -> some View {
        switch container.status {
        case .running:
            Button {
                Task { await viewModel.stop(container) }
            } label: {
                Label("Stop", systemImage: "stop.fill")
            }
            .buttonStyle(.bordered)
        case .stopped, .paused:
            Button {
                Task { await viewModel.start(container) }
            } label: {
                Label("Start", systemImage: "play.fill")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
