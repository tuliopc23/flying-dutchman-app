import Shared
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

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title2.weight(.semibold))
                .foregroundStyle(toneColor)
                .padding(.top, 2)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(12)
        .background(DesignTokens.glassBackground(for: colorScheme))
        .overlay(
            DesignTokens.glassShape.strokeBorder(toneColor.opacity(0.4), lineWidth: 1.5)
        )
        .clipShape(DesignTokens.glassShape)
        .shadow(color: .black.opacity(colorScheme == .dark ? 0.35 : 0.2), radius: 16, y: 8)
    }

    private var toneColor: Color {
        switch tone {
        case .warning:
            return .orange
        case .info:
            return .blue
        }
    }
}
