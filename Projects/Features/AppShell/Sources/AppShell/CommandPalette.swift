import DesignSystem
import Shared
import SwiftUI

public struct CommandPaletteView: View {
    @Bindable var registry: CommandRegistry
    var onDismiss: (() -> Void)?
    @State private var selection: CommandAction.ID?
    @FocusState private var isSearchFocused: Bool

    public init(registry: CommandRegistry, onDismiss: (() -> Void)? = nil) {
        self.registry = registry
        self.onDismiss = onDismiss
    }

    public var body: some View {
        let filtered = registry.filtered()

        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            TextField("Search commands", text: $registry.query)
                .textFieldStyle(.plain)
                .padding(DesignSystem.Inset.sm)
                .font(DesignSystem.Typography.body)
                .background(DesignSystem.Colors.surfaceSecondary)
                .clipShape(DesignSystem.Shapes.input)
                .focused($isSearchFocused)
                .onSubmit {
                    trigger(selectionAction(in: filtered) ?? filtered.first)
                }

            if filtered.isEmpty {
                Text("No commands")
                    .font(DesignSystem.Typography.body)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                    .padding(DesignSystem.Spacing.lg)
            } else {
                List(filtered, selection: $selection) { action in
                    HStack(spacing: DesignSystem.Spacing.sm) {
                        Image.systemIcon(action.icon, size: DesignSystem.Size.iconRegular)
                            .foregroundStyle(DesignSystem.Colors.accent)

                        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xxs) {
                            Text(action.title)
                                .font(DesignSystem.Typography.body)
                                .foregroundStyle(DesignSystem.Colors.textPrimary)

                            if let subtitle = action.subtitle {
                                Text(subtitle)
                                    .font(DesignSystem.Typography.caption1)
                                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                            }
                        }
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        trigger(action)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(.clear)
                .frame(maxHeight: 320)
            }
        }
        .padding(DesignSystem.Inset.lg)
        .glassCard()
        .shadowProminent()
        .task {
            isSearchFocused = true
            selection = filtered.first?.id
        }
        .onChange(of: registry.query) { _, _ in
            selection = filtered.first?.id
        }
        .onMoveCommand { direction in
            updateSelection(direction, actions: filtered)
        }
    }

    private func trigger(_ action: CommandAction?) {
        guard let action else { return }
        Task {
            await action.perform()
            await MainActor.run {
                registry.query = ""
                onDismiss?()
            }
        }
    }

    private func selectionAction(in actions: [CommandAction]) -> CommandAction? {
        guard let selection else { return nil }
        return actions.first(where: { $0.id == selection })
    }

    private func updateSelection(_ direction: MoveCommandDirection, actions: [CommandAction]) {
        guard !actions.isEmpty else {
            selection = nil
            return
        }

        let ids = actions.map(\.id)
        let currentIndex = selection.flatMap { ids.firstIndex(of: $0) } ?? 0
        switch direction {
        case .down:
            selection = ids[min(currentIndex + 1, ids.count - 1)]
        case .up:
            selection = ids[max(currentIndex - 1, 0)]
        default:
            break
        }
    }
}
