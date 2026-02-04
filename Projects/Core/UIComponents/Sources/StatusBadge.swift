import SwiftUI
import DesignSystem

public struct StatusBadge: View {
    let label: String
    let state: String

    public init(label: String, state: String) {
        self.label = label
        self.state = state
    }

    public var body: some View {
        let isReady = state.lowercased() == "ready"
        Label(label, systemImage: isReady ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
            .labelStyle(.iconOnly)
            .font(.system(size: DesignSystem.Size.iconRegular, weight: .medium))
            .foregroundStyle(isReady ? DesignSystem.Colors.success : DesignSystem.Colors.warning)
            .help(label)
    }
}
