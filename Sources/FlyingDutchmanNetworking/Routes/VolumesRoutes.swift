import Foundation
import FlyingDutchmanPersistence
import Shared
import Hummingbird

struct VolumesRoutes {
    let store: VolumeStore?

    func register(on router: HBRouter) {
        router.get("/volumes") { request in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /volumes from \(request.remoteAddress?.description ?? \"unknown\")")
            return store?.fetchAll() ?? []
        }
    }
}
