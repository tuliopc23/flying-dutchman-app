import SwiftUI
import Settings
import Shell
import Containers
import ContainersInterface
import Images
import ImagesInterface
import Volumes
import VolumesInterface
import Networks
import NetworksInterface
import Diagnostics
import DiagnosticsInterface
import Stacks
import StacksInterface

@main
@MainActor
struct FlyingDutchmanApp: App {
    // Single source of truth for the entire app state (macOS 26+ Observation)
    @State private var state = AppState(
        features: ShellFeatureRegistry(
            containers: .live,
            images: .live,
            volumes: .live,
            networks: .live,
            diagnostics: .live,
            stacks: .live
        )
    )

    var body: some Scene {
        WindowGroup(id: "main") {
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
