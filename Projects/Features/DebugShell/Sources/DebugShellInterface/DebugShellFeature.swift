import SwiftUI

public struct DebugShellFeature {
    public var listView: @MainActor () -> AnyView

    public init(listView: @escaping @MainActor () -> AnyView) {
        self.listView = listView
    }
}
