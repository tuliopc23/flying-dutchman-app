import DesignSystem
import SwiftUI

public struct DiagnosticsBanner: View {
    public enum Tone: Sendable {
        case warning
        case info
    }

    let title: String
    let message: String
    let icon: String
    let tone: Tone

    public init(title: String, message: String, icon: String, tone: Tone) {
        self.title = title
        self.message = message
        self.icon = icon
        self.tone = tone
    }

    public var body: some View {
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
            DesignSystem.Colors.warning
        case .info:
            DesignSystem.Colors.info
        }
    }
}
