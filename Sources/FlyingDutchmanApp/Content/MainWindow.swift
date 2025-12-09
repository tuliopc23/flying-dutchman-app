import Shared
import SwiftUI

struct MainWindow: View {
    @Bindable var statusViewModel: StatusViewModel
    @Bindable var sidebarViewModel: SidebarViewModel
    @Bindable var commandRegistry: CommandRegistry
    @Binding var showPalette: Bool

    var body: some View {
        NavigationSplitView {
            SidebarView(viewModel: sidebarViewModel)
        } detail: {
            VStack(alignment: .leading, spacing: 16) {
                GlassCard {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Flying Dutchman Foundation")
                                .font(.largeTitle.weight(.semibold))
                            HStack(spacing: 8) {
                                Image(systemName: DesignTokens.statusSymbol(for: statusViewModel.primaryStatus))
                                    .foregroundStyle(DesignTokens.statusColor(for: statusViewModel.primaryStatus))
                                Text(statusViewModel.statusText)
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                            }
                            if !statusViewModel.workerStatuses.isEmpty {
                                HStack(spacing: 8) {
                                    ForEach(statusViewModel.workerStatuses.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                        StatusBadge(label: "\(key): \(value)", state: value)
                                    }
                                }
                            }
                        }
                        Spacer()
                        Button {
                            Task { await statusViewModel.refresh() }
                        } label: {
                            Label("Refresh", systemImage: "arrow.clockwise")
                        }
                    }
                }

                ProjectDetailView(project: sidebarViewModel.selected)
            }
            .padding(24)
            .sheet(isPresented: $showPalette) {
                CommandPaletteView(registry: commandRegistry) {
                    showPalette = false
                }
                    .frame(width: 520)
                    .presentationDetents([.medium])
            }
        }
    }
}
