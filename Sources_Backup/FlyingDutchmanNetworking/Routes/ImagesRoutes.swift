import FlyingDutchmanPersistence
import Foundation
import Hummingbird
import Shared

struct ImagesRoutes: @unchecked Sendable {
    let store: ImageStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/images") { _, _ -> [ImageSummary] in
            guard let store else { return [] }
            return store.fetchAll()
        }
    }
}
