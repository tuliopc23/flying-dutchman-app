import Foundation
import Shared

@Observable
final class SidebarViewModel {
    var projects: [Project] = Project.samples
    var selected: Project?
    var highlightSidebar: Bool = false

    init() {
        selected = projects.first
    }

    func select(_ project: Project) {
        selected = project
    }

    func requestFocus() {
        highlightSidebar = true
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 1_200_000_000)
            highlightSidebar = false
        }
    }

    var isEmpty: Bool { projects.isEmpty }
}
