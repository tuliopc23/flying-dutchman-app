import Shared
import SwiftUI

struct CommandPaletteView: View {
    @Bindable var registry: CommandRegistry
    var onDismiss: (() -> Void)?
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField("Search commands", text: $registry.query)
                .textFieldStyle(.plain)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(DesignTokens.glassFieldBackground(for: colorScheme))
                .clipShape(DesignTokens.glassShape)
            if registry.filtered().isEmpty {
                Text("No commands").foregroundStyle(.secondary)
            } else {
                List(registry.filtered()) { action in
                    HStack {
                        Image(systemName: action.icon)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(action.title)
                            if let subtitle = action.subtitle {
                                Text(subtitle).font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        trigger(action)
                    }
                }
                .listStyle(.plain)
                .frame(maxHeight: 320)
            }
        }
        .padding(16)
        .background(DesignTokens.glassBackground(for: colorScheme))
        .clipShape(DesignTokens.glassShape)
        .overlay(
            DesignTokens.glassShape.strokeBorder(DesignTokens.glassStroke(for: colorScheme))
        )
        .shadow(color: .black.opacity(colorScheme == .dark ? 0.45 : 0.2), radius: 20, y: 10)
        .padding()
    }

    private func trigger(_ action: CommandAction) {
        Task {
            await action.perform()
            await MainActor.run {
                registry.query = ""
                onDismiss?()
            }
        }
    }
}
