import SwiftUI
import Shared

public struct ContainersFeature {
    public var listView: @MainActor (_ stack: StackSummary?) -> AnyView

    public init(listView: @escaping @MainActor (_ stack: StackSummary?) -> AnyView) {
        self.listView = listView
    }
}
