import Foundation
import SwiftData

@Model
public final class UIState {
    public var selectedSection: String
    public var appearanceOverride: String?
    public var lastUpdated: Date

    public init(selectedSection: String = AppSection.containers.rawValue, appearanceOverride: String? = nil, lastUpdated: Date = .init()) {
        self.selectedSection = selectedSection
        self.appearanceOverride = appearanceOverride
        self.lastUpdated = lastUpdated
    }
}
