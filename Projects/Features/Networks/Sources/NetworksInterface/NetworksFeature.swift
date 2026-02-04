import SwiftUI

public struct NetworksFeature {
    public var listView: @MainActor () -> AnyView

    public init(listView: @escaping @MainActor () -> AnyView) {
        self.listView = listView
    }
}
