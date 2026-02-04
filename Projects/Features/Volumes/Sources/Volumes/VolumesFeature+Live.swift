import SwiftUI
import VolumesInterface

public extension VolumesFeature {
    @MainActor static var live: VolumesFeature {
        let viewModel = VolumeListViewModel()
        return VolumesFeature {
            AnyView(VolumeListView(viewModel: viewModel))
        }
    }
}
