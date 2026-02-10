import DesignSystem
import Shared
import SwiftUI

public struct SidebarView: View {
    @Binding var selection: AppSection
    @Environment(AppState.self) private var state

    public init(selection: Binding<AppSection>) {
        self._selection = selection
    }

    public var body: some View {
        List(selection: $selection) {
            Section {
                SidebarRow(section: .dashboard)
            }

            Section("Management") {
                SidebarRow(section: .containers)
                SidebarRow(section: .stacks)
                SidebarRow(section: .images)
                SidebarRow(section: .machines)
                SidebarRow(section: .kubernetes)
            }

            Section("Infrastructure") {
                SidebarRow(section: .volumes)
                SidebarRow(section: .networks)
            }

            Section("Monitoring") {
                SidebarRow(section: .logs)
                SidebarRow(section: .events)
            }

            Section("Tools") {
                SidebarRow(section: .debugShell)
            }

            if !state.sidebar.stacks.isEmpty {
                Section("Project Stacks") {
                    ForEach(state.sidebar.stacks) { stack in
                        Label(stack.name, systemImage: "square.stack.3d.up")
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .glassSidebar()
        .toolbar {
            ToolbarSpacer()
        }
    }
}

struct SidebarRow: View {
    let section: AppSection

    var body: some View {
        Label {
            Text(section.title)
                .font(DesignSystem.Typography.body)
        } icon: {
            Image(systemName: section.systemImage)
                .foregroundStyle(DesignSystem.Colors.primary)
        }
        .tag(section)
        .padding(.vertical, 4)
    }
}
