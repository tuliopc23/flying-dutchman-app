import DesignSystem
import SwiftUI

public struct EmptyStateView: View {
    public let title: String
    public let message: String
    public let systemImage: String
    public let actionTitle: String?
    public let action: (() -> Void)?

    public init(
        title: String,
        message: String,
        systemImage: String,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        self.actionTitle = actionTitle
        self.action = action
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            Image.systemIcon(
                systemImage,
                size: DesignSystem.Size.iconHuge,
                weight: .semibold
            )
            .foregroundStyle(DesignSystem.Colors.accent)
            .symbolEffect(.bounce, value: title)

            VStack(spacing: DesignSystem.Spacing.xs) {
                Text(title)
                    .font(DesignSystem.Typography.headline)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                    .multilineTextAlignment(.center)

                Text(message)
                    .font(DesignSystem.Typography.subheadline)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
            .frame(maxWidth: 400)

            if let actionTitle, let action {
                Button(action: action) {
                    Text(actionTitle)
                        .font(DesignSystem.Typography.callout)
                        .fontWeight(.medium)
                        .padding(.horizontal, DesignSystem.Spacing.md)
                        .padding(.vertical, DesignSystem.Spacing.xs)
                }
                .buttonStyle(.glassProminent)
            }
        }
        .padding(DesignSystem.Spacing.xxl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignSystem.Colors.background.opacity(0.4))
    }
}
