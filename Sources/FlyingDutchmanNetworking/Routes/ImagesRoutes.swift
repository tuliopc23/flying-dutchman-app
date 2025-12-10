import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence

struct ImagesRoutes {
    let store: ImageStore?

    func register(on router: HBRouter) {
        router.get("/images") { request -> [ImageSummary] in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /images from \(request.remoteAddress?.description ?? \"unknown\")")
            guard let store else { return [] }
            return store.fetchAll()
        }
    }
}
