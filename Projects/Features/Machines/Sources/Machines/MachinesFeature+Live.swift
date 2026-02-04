import MachinesInterface
import SwiftUI

public extension MachinesFeature {
    @MainActor static var live: MachinesFeature {
        let viewModel = MachineListViewModel()
        return MachinesFeature {
            AnyView(MachineListView(viewModel: viewModel))
        }
    }
}
