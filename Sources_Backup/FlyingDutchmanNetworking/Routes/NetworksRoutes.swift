import FlyingDutchmanPersistence
import Foundation
import Hummingbird
import Shared

struct NetworksRoutes: @unchecked Sendable {
    let store: NetworkStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/networks") { _, _ in
            store?.fetchAll() ?? []
        }
    }
}
