import SwiftUI
import Shared
import DesignSystem
import UIComponents

public struct StackDetailView: View {
    var stack: StackSummary?

    public init(stack: StackSummary? = nil) {
        self.stack = stack
    }

    public var body: some View {
        GlassCard {
            if let stack {
                VStack(alignment: .leading, spacing: 12) {
                    Text(stack.name)
                        .font(DesignSystem.Typography.title2)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    if let desc = stack.description {
                        Text(desc)
                            .font(DesignSystem.Typography.body)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }
                    Text(stack.containerNames.isEmpty ? "Empty stack" : "\(stack.containerNames.count) containers")
                        .font(DesignSystem.Typography.subheadline)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                    if !stack.containerNames.isEmpty {
                        Text(stack.containerNames.joined(separator: " · "))
                            .font(DesignSystem.Typography.caption1)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Image(systemName: "shippingbox")
                        .font(.largeTitle)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                    Text("No stack selected")
                        .font(DesignSystem.Typography.headline)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    Text("Pick a stack from the sidebar or create a new one.")
                        .font(DesignSystem.Typography.body)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
            }
        }
    }
}
