import SwiftUI
import SQLiteData
import Shared
import FlyingDutchmanPersistence

@main
struct FlyingDutchmanApp: App {
    // Single source of truth for the entire app state (macOS 26+ Observation)
    @State private var state = AppState()
    
    init() {
        prepareDependencies {
            // Use existing GRDB DatabaseQueue from persistence layer
            $0.defaultDatabase = DatabaseContainer.shared.dbQueue
        }
    }

    var body: some Scene {
        WindowGroup {
            MainWindow()
                .environment(state) // Injected globally for easy access
                .frame(minWidth: 1000, minHeight: 700)
                .task {
                    await state.bootstrap()
                }
        }
        .windowStyle(.hiddenTitleBar) // Modern Tahoe look
        .windowToolbarStyle(.unified)
        .commands {
            AppCommands()
        }

        Settings {
            SettingsView()
        }
    }
}
