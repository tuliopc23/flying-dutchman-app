import Shared
import SwiftUI

struct GlassCard<Content: View>: View {
    let content: Content
    @Environment(\.colorScheme) private var colorScheme

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(DesignTokens.glassBackground(for: colorScheme))
            .clipShape(DesignTokens.glassShape)
            .overlay(
                DesignTokens.glassShape
                    .strokeBorder(DesignTokens.glassStroke(for: colorScheme))
            )
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.4 : 0.2), radius: 18, y: 8)
    }
}
