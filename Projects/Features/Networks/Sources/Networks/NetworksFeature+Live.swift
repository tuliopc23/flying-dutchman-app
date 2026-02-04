import NetworksInterface
import SwiftUI

public extension NetworksFeature {
    @MainActor static var live: NetworksFeature {
        let viewModel = NetworkListViewModel()
        return NetworksFeature {
            AnyView(NetworkListView(viewModel: viewModel))
        }
    }
}
