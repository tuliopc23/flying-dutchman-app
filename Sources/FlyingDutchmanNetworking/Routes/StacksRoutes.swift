import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence

struct StacksRoutes {
    let store: StackStore?

    func register(on router: HBRouter) {
        router.get("/stacks") { request -> [StackSummary] in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /stacks from \(request.remoteAddress?.description ?? \"unknown\")")
            guard let store else { return [] }
            return store.fetchAll()
        }
    }
}
