import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence

struct ImagesRoutes {
    let store: ImageStore?

    func register(on router: HBRouter) {
        router.get("/images") { _ -> [ImageSummary] in
            guard let store else { return [] }
            return store.fetchAll()
        }
    }
}
