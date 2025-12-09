import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence

struct StacksRoutes {
    let store: StackStore?

    func register(on router: HBRouter) {
        router.get("/stacks") { _ -> [StackSummary] in
            guard let store else { return [] }
            return store.fetchAll()
        }
    }
}
