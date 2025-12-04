import Foundation
import Shared

@Observable
final class SidebarViewModel {
    var projects: [Project] = Project.samples
    var selected: Project?

    init() {
        selected = projects.first
    }

    func select(_ project: Project) {
        selected = project
    }

    var isEmpty: Bool { projects.isEmpty }
}
