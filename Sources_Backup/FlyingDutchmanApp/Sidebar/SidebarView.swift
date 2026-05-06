import Shared
import SwiftUI

struct SidebarView: View {
    @Binding var selection: AppSection
    @Environment(AppState.self) private var state

    var body: some View {
        List(selection: $selection) {
            Section("Management") {
                SidebarRow(section: .containers)
                SidebarRow(section: .stacks)
                SidebarRow(section: .images)
            }

            Section("Infrastructure") {
                SidebarRow(section: .volumes)
                SidebarRow(section: .networks)
            }

            Section("Monitoring") {
                SidebarRow(section: .logs)
                SidebarRow(section: .events)
            }

            if !state.sidebar.stacks.isEmpty {
                Section("Project Stacks") {
                    ForEach(state.sidebar.stacks) { stack in
                        Label(stack.name, systemImage: "square.stack.3d.up")
                            .tag(stack.id) // Selection can be extended to support stacks directly
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .glassSidebar()
    }
}

struct SidebarRow: View {
    let section: AppSection

    var body: some View {
        Label(section.title, systemImage: section.systemImage)
            .tag(section)
    }
}
