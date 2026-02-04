import Shared
import SwiftUI

public struct ContainersFeature {
    public var listView: @MainActor (_ stack: StackSummary?) -> AnyView

    public init(listView: @escaping @MainActor (_ stack: StackSummary?) -> AnyView) {
        self.listView = listView
    }
}
