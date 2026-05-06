import SwiftUI

/// Glass card container using Flying Dutchman Design System
/// Applies Liquid Glass material with proper padding and shadow
struct GlassCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding(DesignSystem.Inset.card)
            .frame(maxWidth: .infinity, alignment: .leading)
            .glassCard()
            .shadowCard()
    }
}
