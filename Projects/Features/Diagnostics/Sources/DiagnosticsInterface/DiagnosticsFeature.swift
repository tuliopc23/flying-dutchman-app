import SwiftUI
import Shared

public struct DiagnosticsFeature {
    public var logsView: @MainActor (_ containers: [ContainerSummary]) -> AnyView
    public var eventsView: @MainActor () -> AnyView

    public init(
        logsView: @escaping @MainActor (_ containers: [ContainerSummary]) -> AnyView,
        eventsView: @escaping @MainActor () -> AnyView
    ) {
        self.logsView = logsView
        self.eventsView = eventsView
    }
}
