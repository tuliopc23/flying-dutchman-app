import ContainersInterface
import DashboardInterface
import DebugShellInterface
import DiagnosticsInterface
import ImagesInterface
import KubernetesInterface
import MachinesInterface
import NetworksInterface
@testable import Shell
import StacksInterface
import SwiftUI
import Testing
import VolumesInterface

@Suite("App Launch Tests")
@MainActor
struct AppLaunchTests {
    @Test("App state bootstraps with diagnostics and navigation actions")
    func appStateInitializesStartupState() {
        let state = AppState(features: makeFeatureRegistry())

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
        let state = AppState(features: makeFeatureRegistry())

        for section in AppSection.allCases {
            let action = try #require(state.commandRegistry.actions.first { $0.title == "Go to \(section.title)" })
            await action.perform()
            #expect(state.selectedSection == section)
        }
    }

    private func makeFeatureRegistry() -> ShellFeatureRegistry {
        ShellFeatureRegistry(
            dashboard: DashboardFeature(dashboardView: { AnyView(EmptyView()) }),
            containers: ContainersFeature(listView: { _ in AnyView(EmptyView()) }),
            images: ImagesFeature(listView: { AnyView(EmptyView()) }),
            volumes: VolumesFeature(listView: { AnyView(EmptyView()) }),
            networks: NetworksFeature(listView: { AnyView(EmptyView()) }),
            diagnostics: DiagnosticsFeature(
                logsView: { _ in AnyView(EmptyView()) },
                eventsView: { AnyView(EmptyView()) }
            ),
            stacks: StacksFeature(
                listView: { AnyView(EmptyView()) },
                detailView: { _ in AnyView(EmptyView()) }
            ),
            machines: MachinesFeature(listView: { AnyView(EmptyView()) }),
            kubernetes: KubernetesFeature(listView: { AnyView(EmptyView()) }),
            debugShell: DebugShellFeature(listView: { AnyView(EmptyView()) })
        )
    }
}
