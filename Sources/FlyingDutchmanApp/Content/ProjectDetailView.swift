import SwiftUI
import Shared

struct ProjectDetailView: View {
    var project: Project?

    var body: some View {
        GlassCard {
            if let project {
                VStack(alignment: .leading, spacing: 12) {
                    Text(project.name)
                        .font(.title.weight(.semibold))
                    if let desc = project.description {
                        Text(desc).foregroundStyle(.secondary)
                    }
                    Text("Status: \(project.status.rawValue)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Image(systemName: "shippingbox")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                    Text("No project selected")
                        .font(.headline)
                    Text("Pick a project from the sidebar or create a new one.")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
