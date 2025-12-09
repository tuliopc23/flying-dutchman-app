import Foundation
import ServiceLifecycle
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import FlyingDutchmanContainers
import Shared

@main
struct FlyingDutchmanEngineMain {
    static func main() async {
        let logger = Loggers.make(category: "flyingdutchman.engine")
        let containerStore = ContainerStore()
        containerStore.seedIfEmpty(with: ContainerFixtures.sampleContainers)
        let imageStore = ImageStore()
        imageStore.seedIfEmpty(with: ContainerFixtures.sampleImages)
        let stackStore = StackStore()
        stackStore.seedIfEmpty(with: ContainerFixtures.sampleStacks)
        let runtime = ContainerRuntime(store: containerStore)
        let service = Service(
            startup: {
                logger.info("Starting FlyingDutchmanEngine (stub)")
                DockerShimServer.startStub(logger: logger)
                try await EngineServer.start(
                    runtime: runtime,
                    store: containerStore,
                    imageStore: imageStore,
                    stackStore: stackStore
                )
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
