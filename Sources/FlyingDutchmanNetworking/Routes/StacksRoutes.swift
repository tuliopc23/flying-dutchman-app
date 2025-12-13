import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence

struct StacksRoutes: @unchecked Sendable {
    let store: StackStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/stacks") { _, _ -> [StackSummary] in
            guard let store else { return [] }
            return store.fetchAll()
        }
    }
}
