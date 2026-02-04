import ImagesInterface
import SwiftUI

public extension ImagesFeature {
    @MainActor static var live: ImagesFeature {
        let viewModel = ImageListViewModel()
        return ImagesFeature {
            AnyView(ImageListView(viewModel: viewModel))
        }
    }
}
