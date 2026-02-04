import Foundation
import FlyingDutchmanPersistence
import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers
import FlyingDutchmanPersistence
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence

@MainActor
@Observable
final class SidebarViewModel {
    var stacks: [StackSummary] = []
    var selectedStack: StackSummary?
    var error: String?
    var highlightSidebar: Bool = false

    init() {
    }

    func load() async {
        error = nil
        do {
            stacks = try await EngineClient.listStacks()
            selectedStack = selectedStack.flatMap { existing in stacks.first(where: { $0.id == existing.id }) } ?? stacks.first
        } catch {
            stacks = SeedData.sampleStacks
            selectedStack = stacks.first
            self.error = "Showing mock stacks. Engine unreachable: \(error.localizedDescription)"
        }
    }

    func select(_ stack: StackSummary) {
        selectedStack = stack
    }

    func requestFocus() {
        highlightSidebar = true
        Task { [weak self] in
            try? await Task.sleep(for: .seconds(1.2))
            self?.highlightSidebar = false
        }
    }

    var isEmpty: Bool { stacks.isEmpty }
}
