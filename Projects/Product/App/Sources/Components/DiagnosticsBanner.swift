import SwiftUI

struct DiagnosticsBanner: View {
    enum Tone {
        case warning
        case info
    }

    let title: String
    let message: String
    let icon: String
    let tone: Tone

    var body: some View {
        HStack(alignment: .top, spacing: DesignSystem.Spacing.md) {
            Image.systemIcon(icon, size: DesignSystem.Size.iconLarge, weight: .semibold)
                .foregroundStyle(toneColor)

            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(title)
                    .font(DesignSystem.Typography.headline)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                
                Text(message)
                    .font(DesignSystem.Typography.subheadline)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
            }

            Spacer()
        }
        .padding(DesignSystem.Inset.md)
        .background(DesignSystem.Colors.surfacePrimary)
        .overlay(
            RoundedRectangle(
                cornerRadius: DesignSystem.CornerRadius.comfortable,
                style: .continuous
            )
            .strokeBorder(toneColor.opacity(0.4), lineWidth: 1.5)
        )
        .cornerRadius(DesignSystem.CornerRadius.comfortable)
        .shadowCard()
    }

    private var toneColor: Color {
        switch tone {
        case .warning:
            return DesignSystem.Colors.warning
        case .info:
            return DesignSystem.Colors.info
        }
    }
}
