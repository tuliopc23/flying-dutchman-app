import Foundation
import FlyingDutchmanPersistence
import Shared
import Hummingbird

struct NetworksRoutes: @unchecked Sendable {
    let store: NetworkStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/networks") { _, _ in
            return store?.fetchAll() ?? []
        }
    }
}
