import SwiftUI

struct AppCommands: Commands {
    @Environment(AppModel.self) private var appModel

    var body: some Commands {
        CommandGroup(after: .appInfo) {
            Button("Command Palette") {
                appModel.showPalette = true
            }
            .keyboardShortcut("k", modifiers: [.command])

            Divider()

            Menu("Navigate") {
                ForEach(AppSection.allCases) { section in
                    Button(section.title) { appModel.selectedSection = section }
                        .keyboardShortcut(section.shortcutKey, modifiers: [.command, .option])
                }
            }

            Menu("Appearance") {
                Button("System") { appModel.appearanceOverride = nil }
                Button("Light") { appModel.appearanceOverride = .light }
                Button("Dark") { appModel.appearanceOverride = .dark }
            }
        }
    }
}

