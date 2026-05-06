import Shared
import SwiftUI

@MainActor
public struct AppCommands: Commands {
    private let state: AppState

    public init(state: AppState) {
        self.state = state
    }

    public var body: some Commands {
        CommandGroup(after: .appInfo) {
            Button("Check for Updates…") {
                AppUpdateRequests.checkForUpdates()
            }

            Divider()

            Button("Command Palette") {
                state.showPalette = true
            }
            .keyboardShortcut("k", modifiers: [.command])

            Divider()

            Menu("Navigate") {
                ForEach(AppSection.allCases) { section in
                    Button(section.title) { state.selectedSection = section }
                        .keyboardShortcut(section.shortcutKey, modifiers: [.command, .option])
                }
            }
        }
    }
}
