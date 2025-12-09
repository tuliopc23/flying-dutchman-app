import SwiftUI
import Shared

struct SidebarView: View {
    @Bindable var viewModel: SidebarViewModel

    var body: some View {
        ZStack {
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

            if viewModel.highlightSidebar {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .strokeBorder(.blue.opacity(0.55), lineWidth: 2)
                    .shadow(color: .blue.opacity(0.3), radius: 12)
                    .padding(6)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.25), value: viewModel.highlightSidebar)
                    .allowsHitTesting(false)
            }
        }
    }
}
