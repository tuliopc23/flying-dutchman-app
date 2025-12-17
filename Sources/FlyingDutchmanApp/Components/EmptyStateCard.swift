import SwiftUI

struct EmptyStateCard: View {
    let title: String
    let message: String
    let systemImage: String

    var body: some View {
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
