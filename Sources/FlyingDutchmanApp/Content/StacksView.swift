import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

@MainActor
@Observable
final class StacksViewModel {
    var stacks: [StackSummary] = []
    var error: String?
    var isLoading: Bool = false
    var searchQuery: String = ""
    var showCreate: Bool = false
    var newName: String = ""
    var newDescription: String = ""
    var newContainers: String = ""
    var lastActionMessage: String?

    var filtered: [StackSummary] {
        guard !searchQuery.isEmpty else { return stacks }
        let needle = searchQuery.lowercased()
        return stacks.filter { stack in
            stack.name.lowercased().contains(needle) || (stack.description ?? "").lowercased().contains(needle)
        }
    }

    func load() async {
        isLoading = true
        error = nil
        do {
            stacks = try await EngineClient.listStacks()
        } catch {
            stacks = ContainerFixtures.sampleStacks
            self.error = "Showing mock stacks. Engine unreachable: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func create() async {
        let trimmed = newName.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        isLoading = true
        error = nil
        do {
            let names = newContainers
                .split(separator: ",")
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { !$0.isEmpty }
            _ = try await EngineClient.createStack(
                StackCreateRequest(
                    name: trimmed,
                    description: newDescription.trimmingCharacters(in: .whitespacesAndNewlines).nilIfEmpty,
                    containerNames: names
                )
            )
            lastActionMessage = "Created stack '\(trimmed)'."
            newName = ""
            newDescription = ""
            newContainers = ""
            showCreate = false
            await load()
        } catch {
            self.error = "Create failed: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func start(_ stack: StackSummary) async {
        isLoading = true
        error = nil
        do {
            let response = try await EngineClient.startStack(id: stack.id)
            lastActionMessage = describe(response: response, verb: "Started")
        } catch {
            self.error = "Start failed: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func stop(_ stack: StackSummary) async {
        isLoading = true
        error = nil
        do {
            let response = try await EngineClient.stopStack(id: stack.id)
            lastActionMessage = describe(response: response, verb: "Stopped")
        } catch {
            self.error = "Stop failed: \(error.localizedDescription)"
        }
        isLoading = false
    }

    private func describe(response: StackActionResponse, verb: String) -> String {
        let names = response.affectedContainers.map(\.name)
        let base = names.isEmpty ? "\(verb) 0 containers." : "\(verb) \(names.joined(separator: ", "))."
        if response.errors.isEmpty {
            return base
        }
        return base + " " + response.errors.joined(separator: " · ")
    }
}

struct StacksView: View {
    @Bindable var viewModel: StacksViewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Stacks", subtitle: "Group containers into projects", icon: "square.stack.3d.up") {
                    if viewModel.isLoading {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        viewModel.showCreate = true
                    } label: {
                        Label("New", systemImage: "plus")
                    }
                    Button {
                        Task { @MainActor in await viewModel.load() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                TextField("Search stacks", text: $viewModel.searchQuery)
                    .textFieldStyle(.roundedBorder)

                if let lastActionMessage = viewModel.lastActionMessage {
                    Text(lastActionMessage)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                if viewModel.filtered.isEmpty {
                    EmptyStateCard(
                        title: "No stacks",
                        message: "Create a stack to manage containers together.",
                        systemImage: "square.stack.3d.up"
                    )
                } else {
                    VStack(spacing: 10) {
                        ForEach(viewModel.filtered) { stack in
                            HStack(spacing: 10) {
                                Image(systemName: "square.stack.3d.up")
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(stack.name)
                                    Text(stack.description ?? "No description")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text(stack.containerNames.isEmpty ? "0 containers" : "\(stack.containerNames.count) containers")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                if !stack.containerNames.isEmpty {
                                    Button {
                                        Task { @MainActor in await viewModel.start(stack) }
                                    } label: {
                                        Label("Start", systemImage: "play.fill")
                                    }
                                    .buttonStyle(.borderedProminent)

                                    Button {
                                        Task { @MainActor in await viewModel.stop(stack) }
                                    } label: {
                                        Label("Stop", systemImage: "stop.fill")
                                    }
                                    .buttonStyle(.bordered)
                                }
                            }
                            .padding(10)
                            .background(DesignTokens.glassFieldBackground(for: colorScheme))
                            .clipShape(DesignTokens.glassShape)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showCreate) {
            createSheet
        }
    }

    private var createSheet: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("New Stack")
                .font(.title3.weight(.semibold))

            TextField("Name", text: $viewModel.newName)
                .textFieldStyle(.roundedBorder)
            TextField("Description (optional)", text: $viewModel.newDescription)
                .textFieldStyle(.roundedBorder)
            TextField("Container names (comma-separated)", text: $viewModel.newContainers)
                .textFieldStyle(.roundedBorder)

            HStack {
                Spacer()
                Button("Cancel") { viewModel.showCreate = false }
                Button {
                    Task { @MainActor in await viewModel.create() }
                } label: {
                    Text("Create")
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(16)
        .frame(width: 520)
    }
}

private extension String {
    var nilIfEmpty: String? {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
    }
}
