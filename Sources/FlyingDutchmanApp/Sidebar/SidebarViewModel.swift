import Foundation
import Shared

@MainActor
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
        Task { [weak self] in
            try? await Task.sleep(for: .seconds(1.2))
            self?.highlightSidebar = false
        }
    }

    var isEmpty: Bool { projects.isEmpty }
}
