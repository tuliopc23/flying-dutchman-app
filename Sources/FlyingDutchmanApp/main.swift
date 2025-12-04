import SwiftUI
import Shared
import FlyingDutchmanNetworking

@main
struct FlyingDutchmanApp: App {
    @State private var engineStatus: StatusViewModel = .init()
    @State private var sidebarModel: SidebarViewModel = .init()
    @State private var commandRegistry: CommandRegistry = .init()
    @State private var showPalette: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView(statusViewModel: engineStatus, sidebarViewModel: sidebarModel, commandRegistry: commandRegistry, showPalette: $showPalette)
                .frame(minWidth: 960, minHeight: 600)
                .task { await engineStatus.refresh() }
                .onAppear { seedCommands() }
        }
        .commands {
            CommandMenu("Palette") {
                Button("Show Command Palette") { showPalette = true }
                    .keyboardShortcut("k", modifiers: [.command])
            }
        }
    }

    private func seedCommands() {
        commandRegistry.actions = [
            CommandAction(title: "Refresh Engine Status", subtitle: nil, icon: "arrow.clockwise") {
                await engineStatus.refresh()
            },
            CommandAction(title: "Open Projects", subtitle: "Focus sidebar", icon: "sidebar.leading") {
                // placeholder
            }
        ]
    }
}

@Observable
final class StatusViewModel {
    var statusText: String = "Checking…"
    var workerStatuses: [String: String] = [:]
    var primaryStatus: String = "unknown"

    func refresh() async {
        async let httpStatus: EngineStatus? = try? EngineClient.fetchHealth()
        async let detail: EngineStatusDetail? = try? EngineClient.fetchStatus()
        async let xpc: EngineXPCStatus? = try? EngineXPCClient.fetchStatus()

        var pieces: [String] = []
        if let httpStatus = await httpStatus {
            pieces.append("HTTP: \(httpStatus.status)")
            primaryStatus = httpStatus.status
        }
        if let detail = await detail {
            workerStatuses = detail.workers
            pieces.append("Engine: \(detail.engine)")
            primaryStatus = detail.engine
        }
        if let xpc = await xpc {
            workerStatuses["xpc"] = xpc.workers["xpc"] ?? "unknown"
        }

        if pieces.isEmpty {
            statusText = "Engine unreachable"
            workerStatuses = [:]
        } else {
            statusText = pieces.joined(separator: " · ")
        }
    }
}

struct ContentView: View {
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
                CommandPaletteView(registry: commandRegistry)
                    .frame(width: 520)
                    .presentationDetents([.medium])
            }
        }
    }
}
