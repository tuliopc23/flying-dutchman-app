import SwiftUI
import Shared

struct StackDetailView: View {
    var stack: StackSummary?

    var body: some View {
        GlassCard {
            if let stack {
                VStack(alignment: .leading, spacing: 12) {
                    Text(stack.name)
                        .font(.title.weight(.semibold))
                    if let desc = stack.description {
                        Text(desc).foregroundStyle(.secondary)
                    }
                    Text(stack.containerNames.isEmpty ? "Empty stack" : "\(stack.containerNames.count) containers")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    if !stack.containerNames.isEmpty {
                        Text(stack.containerNames.joined(separator: " · "))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Image(systemName: "shippingbox")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                    Text("No stack selected")
                        .font(.headline)
                    Text("Pick a stack from the sidebar or create a new one.")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
