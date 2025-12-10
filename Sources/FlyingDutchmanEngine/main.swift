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
        let platform = RuntimeChecks.platformSupport()
        if !platform.isSupported {
            logger.warning("Unsupported platform: \(platform.message)")
        }
        let containerization = RuntimeChecks.containerizationFramework()
        if containerization.status != "ok" {
            logger.warning("\(containerization.name): \(containerization.message)")
        }

        let containerStore = ContainerStore()
        containerStore.seedIfEmpty(with: ContainerFixtures.sampleContainers)
        let imageStore = ImageStore()
        imageStore.seedIfEmpty(with: ContainerFixtures.sampleImages)
        let stackStore = StackStore()
        stackStore.seedIfEmpty(with: ContainerFixtures.sampleStacks)
        let volumeStore = VolumeStore()
        volumeStore.seedIfEmpty(with: ContainerFixtures.sampleVolumes)
        let networkStore = NetworkStore()
        networkStore.seedIfEmpty(with: ContainerFixtures.sampleNetworks)
        let logStore = ContainerLogStore()
        let eventStore = ShimEventStore()
        let runtime = RuntimeFactory.makeRuntime(store: containerStore, logStore: logStore, eventStore: eventStore)
        let service = Service(
            startup: {
                logger.info("Starting FlyingDutchmanEngine (stub)")
                DockerShimServer.startStub(runtime: runtime, logger: logger)
                try await EngineServer.start(
                    runtime: runtime,
                    store: containerStore,
                    imageStore: imageStore,
                    stackStore: stackStore,
                    volumeStore: volumeStore,
                    networkStore: networkStore,
                    eventStore: eventStore
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
