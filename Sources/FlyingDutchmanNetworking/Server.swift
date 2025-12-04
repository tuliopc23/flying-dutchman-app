import Foundation
import Hummingbird
import Shared

public struct EngineServer {
    public static func makeRouter() -> HBRouter {
        let router = HBRouter()
        router.get("/health") { _ in
            return ["status": "ok", "engine": "running", "version": AppConfig.version]
        }
        router.get("/status") { _ in
            return [
                "engine": "running",
                "uptimeSeconds": 0,
                "workers": ["http": "ready", "xpc": "unimplemented"]
            ]
        }
        return router
    }

    public static func start(host: String = AppConfig.Engine.host, port: Int = AppConfig.Engine.port) async throws {
        let app = HBApplication(router: makeRouter())
        try app.start(address: .hostname(host, port: port))
        Loggers.make(category: "flyingdutchman.networking").info("HTTP server started on \(host):\(port)")
        try await withTaskCancellationHandler {
            try await app.wait()
        } onCancel: {
            app.stop()
        }
    }
}
