import DiagnosticsInterface
import SwiftUI

public extension DiagnosticsFeature {
    @MainActor static var live: DiagnosticsFeature {
        let logsViewModel = LogsViewModel()
        let eventsViewModel = EventsViewModel()
        return DiagnosticsFeature(
            logsView: { containers in
                AnyView(LogsView(viewModel: logsViewModel, containers: containers))
            },
            eventsView: {
                AnyView(EventsView(viewModel: eventsViewModel))
            }
        )
    }
}
