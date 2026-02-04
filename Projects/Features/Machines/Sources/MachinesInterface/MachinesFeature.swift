import Shared
import SwiftUI

public struct MachinesFeature {
    public var listView: @MainActor () -> AnyView

    public init(listView: @escaping @MainActor () -> AnyView) {
        self.listView = listView
    }
}
