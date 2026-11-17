import AppShell
import Settings
import Shared
import SwiftUI

@main
@MainActor
struct FlyingDutchmanApp: App {
    /// Single source of truth for the entire app state (macOS 26+ Observation)
    @State private var state = AppState()

    @State private var updater = AppUpdaterController()

    var body: some Scene {
        WindowGroup(id: "main") {
            MainWindow()
                .environment(state) // Injected globally for easy access
                .frame(minWidth: 1000, minHeight: 700)
                .task {
                    await state.bootstrap()
                }
                .onReceive(NotificationCenter.default
                    .publisher(for: AppUpdateRequests.checkForUpdatesNotification))
                { _ in
                    updater.checkForUpdates()
                }
        }
        .windowStyle(.hiddenTitleBar) // Modern Tahoe look
        .windowToolbarStyle(.unified)
        .commands {
            ToolbarCommands()
            AppCommands(state: state)
        }

        Settings {
            SettingsView()
        }

        MenuBarExtra("Flying Dutchman", systemImage: "ship.wheel.fill") {
            MenuBarView()
                .environment(state)
        }
        .menuBarExtraStyle(.window)
    }
}
