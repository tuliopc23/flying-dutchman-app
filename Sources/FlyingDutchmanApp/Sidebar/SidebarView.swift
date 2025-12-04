import SwiftUI
import Shared

struct SidebarView: View {
    @Bindable var viewModel: SidebarViewModel

    var body: some View {
        List(selection: $viewModel.selected) {
            Section("Projects") {
                if viewModel.isEmpty {
                    EmptyStateView()
                        .listRowSeparator(.hidden)
                } else {
                    ForEach(viewModel.projects) { project in
                        HStack(spacing: 8) {
                            Circle()
                                .fill(project.status == .active ? .green : .gray.opacity(0.4))
                                .frame(width: 10, height: 10)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(project.name)
                                if let desc = project.description {
                                    Text(desc).font(.caption).foregroundStyle(.secondary)
                                }
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture { viewModel.select(project) }
                    }
                }
            }
        }
        .listStyle(.sidebar)
    }
}
