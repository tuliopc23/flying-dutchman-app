import DebugShellInterface
import SwiftUI

public extension DebugShellFeature {
    @MainActor static var live: DebugShellFeature {
        let viewModel = DebugShellViewModel()
        return DebugShellFeature {
            AnyView(DebugShellView(viewModel: viewModel))
        }
    }
}
