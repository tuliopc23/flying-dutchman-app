import Foundation
import FlyingDutchmanPersistence
import Shared
import Hummingbird

struct VolumesRoutes: @unchecked Sendable {
    let store: VolumeStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/volumes") { _, _ in
            return store?.fetchAll() ?? []
        }
    }
}
