import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared
import SwiftUI

@MainActor
@Observable
public final class StacksViewModel {
    public var stacks: [StackSummary] = []
    public var error: String?
    public var isLoading: Bool = false
    public var searchQuery: String = ""
    public var showCreate: Bool = false
    public var newName: String = ""
    public var newDescription: String = ""
    public var newContainers: String = ""
    public var lastActionMessage: String?

    private let store = StackStore()

    public init() {}

    public var filtered: [StackSummary] {
        guard !searchQuery.isEmpty else { return stacks }
        let needle = searchQuery.lowercased()
        return stacks.filter { stack in
            stack.name.lowercased().contains(needle) || (stack.description ?? "").lowercased().contains(needle)
        }
    }

    public func load() async {
        isLoading = true
        stacks = store.fetchAll()
        isLoading = false
    }

    public func create() async {
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
            // No manual reload needed
        } catch {
            self.error = "Create failed: \(error.localizedDescription)"
        }
        isLoading = false
    }

    public func start(_ stack: StackSummary) async {
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

    public func stop(_ stack: StackSummary) async {
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
    var viewModel: StacksViewModel

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            // Header
            HStack {
                Text("Stacks")
                    .font(DesignSystem.Typography.title2)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)

                Spacer()

                Button {
                    viewModel.showCreate = true
                } label: {
                    Label("New Stack", systemImage: "plus")
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.accent)

                Button {
                    Task { @MainActor in await viewModel.load() }
                } label: {
                    Label("Refresh", systemImage: "arrow.clockwise")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
            }
            .padding(.horizontal, DesignSystem.Spacing.md)

            // Search
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                TextField("Search stacks...", text: Bindable(viewModel).searchQuery)
                    .textFieldStyle(.plain)
            }
            .padding(DesignSystem.Inset.sm)
            .background(DesignTokens.glassFieldBackground(for: .light))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, DesignSystem.Spacing.md)

            if let message = viewModel.lastActionMessage {
                Text(message)
                    .font(DesignSystem.Typography.caption1)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                    .padding(.horizontal, DesignSystem.Spacing.md)
            }

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
                    title: "No stacks found",
                    message: viewModel.searchQuery.isEmpty
                        ? "Create a stack to group containers."
                        : "No stacks match your search.",
                    systemImage: "square.stack.3d.up"
                )
                .padding(DesignSystem.Spacing.md)
            } else {
                ScrollView {
                    LazyVStack(spacing: DesignSystem.Spacing.sm) {
                        ForEach(viewModel.filtered) { stack in
                            StackRow(stack: stack, viewModel: viewModel)
                        }
                    }
                    .padding(DesignSystem.Spacing.md)
                }
            }
        }
        .sheet(isPresented: Bindable(viewModel).showCreate) {
            createSheet
        }
        .onAppear {
            if viewModel.stacks.isEmpty {
                Task { await viewModel.load() }
            }
        }
    }

    private var createSheet: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("New Stack")
                .font(DesignSystem.Typography.title2)

            VStack(alignment: .leading, spacing: 12) {
                TextField("Name", text: Bindable(viewModel).newName)
                    .textFieldStyle(.roundedBorder)

                TextField("Description (Optional)", text: Bindable(viewModel).newDescription)
                    .textFieldStyle(.roundedBorder)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Containers")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                    TextField("Comma-separated names (e.g. web, db)", text: Bindable(viewModel).newContainers)
                        .textFieldStyle(.roundedBorder)
                }
            }

            HStack {
                Spacer()
                Button("Cancel") { viewModel.showCreate = false }
                    .keyboardShortcut(.cancelAction)

                Button("Create") {
                    Task { @MainActor in await viewModel.create() }
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding(24)
        .frame(width: 400)
    }
}

struct StackRow: View {
    let stack: StackSummary
    var viewModel: StacksViewModel

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("square.stack.3d.up", size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(DesignSystem.Colors.primary)

                VStack(alignment: .leading, spacing: 2) {
                    Text(stack.name)
                        .font(DesignSystem.Typography.headline)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)

                    if let desc = stack.description {
                        Text(desc)
                            .font(DesignSystem.Typography.caption1)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }
                }

                Spacer()

                if !stack.containerNames.isEmpty {
                    Text("\(stack.containerNames.count) containers")
                        .font(DesignSystem.Typography.caption2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(DesignSystem.Colors.surfaceTertiary)
                        .cornerRadius(6)

                    HStack(spacing: 4) {
                        Button {
                            Task { @MainActor in await viewModel.start(stack) }
                        } label: {
                            Label("Start", systemImage: "play.fill")
                                .labelStyle(.iconOnly)
                        }
                        .buttonStyle(.glass)
                        .help("Start Stack")

                        Button {
                            Task { @MainActor in await viewModel.stop(stack) }
                        } label: {
                            Label("Stop", systemImage: "stop.fill")
                                .labelStyle(.iconOnly)
                        }
                        .buttonStyle(.glass)
                        .help("Stop Stack")
                    }
                } else {
                    Text("Empty")
                        .font(DesignSystem.Typography.caption2)
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                }
            }
            .padding(DesignSystem.Inset.sm)
        }
    }
}

private extension String {
    var nilIfEmpty: String? {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
    }
}
