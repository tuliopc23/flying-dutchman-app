import Shared
import SwiftUI

struct CommandPaletteView: View {
    @Bindable var registry: CommandRegistry
    var onDismiss: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            TextField("Search commands", text: $registry.query)
                .textFieldStyle(.plain)
                .padding(DesignSystem.Inset.sm)
                .font(DesignSystem.Typography.body)
                .background(DesignSystem.Colors.surfaceSecondary)
                .cornerRadius(DesignSystem.CornerRadius.regular)
            
            if registry.filtered().isEmpty {
                Text("No commands")
                    .font(DesignSystem.Typography.body)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                    .padding(DesignSystem.Spacing.lg)
            } else {
                List(registry.filtered()) { action in
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
