import DashboardInterface
import SwiftUI

public extension DashboardFeature {
    @MainActor static var live: DashboardFeature {
        let viewModel = DashboardViewModel()
        return DashboardFeature {
            AnyView(DashboardView(viewModel: viewModel))
        }
    }
}
