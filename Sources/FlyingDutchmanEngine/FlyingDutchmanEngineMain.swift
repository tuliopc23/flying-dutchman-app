import Foundation
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

        // Seed all stores with sample data
        await SeedData.seedAllIfEmpty()

        let containerStore = ContainerStore()
        let imageStore = ImageStore()
        let stackStore = StackStore()
        let volumeStore = VolumeStore()
        let networkStore = NetworkStore()
        let logStore = ContainerLogStore()
        let eventStore = ShimEventStore()

        let runtime = RuntimeFactory.makeRuntime(store: containerStore, logStore: logStore, eventStore: eventStore)

        // Log runtime mode for diagnostics
        let runtimeName = await runtime.name
        logger.info("Starting FlyingDutchmanEngine", metadata: [
            "runtime_mode": "\(runtimeName)",
            "grdb_initialized": "true",
            "xpc_enabled": "true"
        ])

        // Reconcile state on startup (if runtime supports it)
        if let containerizationRuntime = runtime as? ContainerizationRuntime {
            try? await containerizationRuntime.reconcileState()
        }

        await EngineXPCListener.shared.start(runtime: runtime)

        do {
            try await EngineServer.start(
                runtime: runtime,
                store: containerStore,
                imageStore: imageStore,
                stackStore: stackStore,
                volumeStore: volumeStore,
                networkStore: networkStore,
                eventStore: eventStore
            )
        } catch {
            logger.error("Engine server failed: \(error.localizedDescription)")
        }
    }
}
