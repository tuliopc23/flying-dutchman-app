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
            MainWindow(statusViewModel: engineStatus, sidebarViewModel: sidebarModel, commandRegistry: commandRegistry, showPalette: $showPalette)
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

// Content moved to MainWindow
