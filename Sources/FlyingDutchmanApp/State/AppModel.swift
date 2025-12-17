import SwiftUI

@MainActor
@Observable
final class AppModel {
    var showPalette: Bool = false
    var selectedSection: AppSection = .containers
    var appearanceOverride: ColorScheme?
}

