import SwiftUI
import StacksInterface

public extension StacksFeature {
    @MainActor static var live: StacksFeature {
        let viewModel = StacksViewModel()
        return StacksFeature(
            listView: {
                AnyView(StacksView(viewModel: viewModel))
            },
            detailView: { stack in
                AnyView(StackDetailView(stack: stack))
            }
        )
    }
}
