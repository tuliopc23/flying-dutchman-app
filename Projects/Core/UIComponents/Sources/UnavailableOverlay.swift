import DesignSystem
import SwiftUI

public struct UnavailableOverlay: View {
    public let title: String
    public let message: String
    public let icon: String
    public let actionTitle: String?
    public let action: (() -> Void)?

    public init(
        title: String,
        message: String,
        icon: String = "exclamationmark.octagon.fill",
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.icon = icon
        self.actionTitle = actionTitle
        self.action = action
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.xl) {
            Image.systemIcon(
                icon,
                size: DesignSystem.Size.iconHuge,
                weight: .bold
            )
            .foregroundStyle(DesignSystem.Colors.error)
            .symbolEffect(.bounce, options: .repeating, value: title)

            VStack(spacing: DesignSystem.Spacing.sm) {
                Text(title)
                    .font(DesignSystem.Typography.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                    .multilineTextAlignment(.center)

                Text(message)
                    .font(DesignSystem.Typography.body)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
            }
            .frame(maxWidth: 460)

            if let actionTitle, let action {
                Button(action: action) {
                    Text(actionTitle)
                        .font(DesignSystem.Typography.callout)
                        .fontWeight(.semibold)
                        .padding(.horizontal, DesignSystem.Spacing.md)
                        .padding(.vertical, DesignSystem.Spacing.xs)
                }
                .buttonStyle(.glassProminent)
            }
        }
        .padding(DesignSystem.Spacing.xxl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignSystem.Colors.background.opacity(0.95))
        .glassContainer()
    }
}
