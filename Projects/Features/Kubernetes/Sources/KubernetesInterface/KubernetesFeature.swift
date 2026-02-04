import SwiftUI

public struct KubernetesFeature {
    public var listView: @MainActor () -> AnyView

    public init(listView: @escaping @MainActor () -> AnyView) {
        self.listView = listView
    }
}
