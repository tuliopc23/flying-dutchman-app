import Foundation
import FlyingDutchmanPersistence
import Shared
import Hummingbird

struct NetworksRoutes {
    let store: NetworkStore?

    func register(on router: HBRouter) {
        router.get("/networks") { request in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /networks from \(request.remoteAddress?.description ?? \"unknown\")")
            return store?.fetchAll() ?? []
        }
    }
}
