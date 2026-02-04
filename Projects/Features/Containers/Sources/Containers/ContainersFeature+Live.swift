import SwiftUI
import ContainersInterface

public extension ContainersFeature {
    @MainActor static var live: ContainersFeature {
        let viewModel = ContainerListViewModel()
        return ContainersFeature { stack in
            AnyView(ContainerListView(viewModel: viewModel, stack: stack))
        }
    }
}
