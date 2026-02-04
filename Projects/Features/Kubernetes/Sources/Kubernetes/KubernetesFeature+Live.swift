import KubernetesInterface
import SwiftUI

public extension KubernetesFeature {
    @MainActor static var live: KubernetesFeature {
        let viewModel = KubernetesListViewModel()
        return KubernetesFeature {
            AnyView(KubernetesListView(viewModel: viewModel))
        }
    }
}
