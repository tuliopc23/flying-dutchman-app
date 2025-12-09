import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers

public struct EngineServer {
    public static func makeRouter(runtime: ContainerRuntime = .shared) -> HBRouter {
        let router = HBRouter()
        router.get("/health") { _ in
            return [
                "status": "ok",
                "engine": "running",
                "version": AppConfig.version,
                "uptimeSeconds": EngineRuntime.uptimeSeconds
            ]
        }
        router.get("/status") { _ in
            let state = ContainerizationStub.currentState()
            return [
                "engine": state.engine,
                "uptimeSeconds": state.uptimeSeconds,
                "workers": state.workers
            ]
        }
        ContainersRoutes(runtime: runtime).register(on: router)
        return router
    }

    public static func start(host: String = AppConfig.Engine.host, port: Int = AppConfig.Engine.port, runtime: ContainerRuntime = .shared) async throws {
        let app = HBApplication(router: makeRouter(runtime: runtime))
        EngineRuntime.markStarted()
        try app.start(address: .hostname(host, port: port))
        Loggers.make(category: "flyingdutchman.networking").info("HTTP server started on \(host):\(port)")
        try await withTaskCancellationHandler {
            try await app.wait()
        } onCancel: {
            app.stop()
        }
    }
}
