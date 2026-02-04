import SwiftUI
import NetworksInterface

public extension NetworksFeature {
    @MainActor static var live: NetworksFeature {
        let viewModel = NetworkListViewModel()
        return NetworksFeature {
            AnyView(NetworkListView(viewModel: viewModel))
        }
    }
}
