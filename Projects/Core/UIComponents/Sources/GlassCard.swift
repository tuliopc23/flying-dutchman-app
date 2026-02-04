import SwiftUI
import DesignSystem

public struct GlassCard<Content: View>: View {
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(DesignSystem.Inset.card)
            .frame(maxWidth: .infinity, alignment: .leading)
            .glassCard()
            .shadowCard()
    }
}
