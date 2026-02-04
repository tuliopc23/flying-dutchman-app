import Shared
import SwiftUI

public struct StacksFeature {
    public var listView: @MainActor () -> AnyView
    public var detailView: @MainActor (_ stack: StackSummary?) -> AnyView

    public init(
        listView: @escaping @MainActor () -> AnyView,
        detailView: @escaping @MainActor (_ stack: StackSummary?) -> AnyView
    ) {
        self.listView = listView
        self.detailView = detailView
    }
}
