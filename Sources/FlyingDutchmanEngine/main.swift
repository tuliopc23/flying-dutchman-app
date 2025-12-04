import Foundation
import ServiceLifecycle
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared

@main
struct FlyingDutchmanEngineMain {
    static func main() async {
        let logger = Loggers.make(category: "flyingdutchman.engine")
        let service = Service(
            startup: {
                logger.info("Starting FlyingDutchmanEngine (stub)")
                try await EngineServer.start()
                EngineXPCListener.start()
            },
            shutdown: { _ in
                logger.info("Shutting down FlyingDutchmanEngine (stub)")
            }
        )

        let lifecycle = ServiceGroup(services: [service])
        await lifecycle.run()
    }
}
