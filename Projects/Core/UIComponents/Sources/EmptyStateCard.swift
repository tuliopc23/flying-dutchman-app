import SwiftUI
import DesignSystem

public struct EmptyStateCard: View {
    let title: String
    let message: String
    let systemImage: String

    public init(title: String, message: String, systemImage: String) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.md) {
            Image.systemIcon(
                systemImage,
                size: DesignSystem.Size.iconHuge,
                weight: .semibold
            )
            .foregroundStyle(DesignSystem.Colors.textSecondary)
            
            Text(title)
                .font(DesignSystem.Typography.headline)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            Text(message)
                .font(DesignSystem.Typography.subheadline)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(DesignSystem.Spacing.xxl)
    }
}
