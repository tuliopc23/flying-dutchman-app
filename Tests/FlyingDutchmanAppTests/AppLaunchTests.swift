@testable import AppShell
import SwiftUI
import Testing

@Suite("App Launch Tests")
@MainActor
struct AppLaunchTests {
    @Test("App state bootstraps with diagnostics and navigation actions")
    func appStateInitializesStartupState() {
        let state = AppState()

        #expect(state.selectedSection == .containers)
        #expect(state.platformStatus != nil)
        #expect(state.containerizationStatus != nil)

        let navigationActions = state.commandRegistry.actions.filter { $0.subtitle == "Navigation" }
        #expect(
            Set(navigationActions.map(\.title)) == Set(AppSection.allCases.map { "Go to \($0.title)" })
        )
    }

    @Test("Navigation command actions switch sections deterministically")
    func navigationCommandsChangeSelection() async throws {
        let state = AppState()

        for section in AppSection.allCases {
            let action = try #require(state.commandRegistry.actions.first { $0.title == "Go to \(section.title)" })
            await action.perform()
            #expect(state.selectedSection == section)
        }
    }
}
