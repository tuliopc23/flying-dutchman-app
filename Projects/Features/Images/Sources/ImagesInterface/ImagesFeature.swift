import SwiftUI

public struct ImagesFeature {
    public var listView: @MainActor () -> AnyView

    public init(listView: @escaping @MainActor () -> AnyView) {
        self.listView = listView
    }
}
