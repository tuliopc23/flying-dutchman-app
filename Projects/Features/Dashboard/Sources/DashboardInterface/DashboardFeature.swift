import SwiftUI

public struct DashboardFeature {
    public var dashboardView: @MainActor () -> AnyView

    public init(dashboardView: @escaping @MainActor () -> AnyView) {
        self.dashboardView = dashboardView
    }
}
