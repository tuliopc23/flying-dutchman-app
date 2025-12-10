import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers

public struct EngineServer {
    public static func makeRouter(
        runtime: ContainerRuntimeProtocol = ContainerRuntime.shared,
        store: AnyContainerStore? = nil,
        imageStore: ImageStore? = nil,
        stackStore: StackStore? = nil,
        volumeStore: VolumeStore? = nil,
        networkStore: NetworkStore? = nil,
        eventStore: ShimEventStore? = nil
    ) -> HBRouter {
        let router = HBRouter()
        router.get("/health") { request in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /health from \(request.remoteAddress?.description ?? \"unknown\")")
            return [
                "status": "ok",
                "engine": "running",
                "version": AppConfig.version,
                "uptimeSeconds": EngineRuntime.uptimeSeconds,
                "containerization": runtime.mode.rawValue,
                "workers": ContainerizationStub.currentState(runtime: runtime).workers
            ]
        }
        router.get("/status") { request in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /status from \(request.remoteAddress?.description ?? \"unknown\")")
            let state = ContainerizationStub.currentState(runtime: runtime)
            return [
                "engine": state.engine,
                "uptimeSeconds": state.uptimeSeconds,
                "workers": state.workers,
                "mode": state.mode
            ]
        }
        ContainersRoutes(runtime: runtime, store: store).register(on: router)
        ImagesRoutes(store: imageStore).register(on: router)
        StacksRoutes(store: stackStore).register(on: router)
        VolumesRoutes(store: volumeStore).register(on: router)
        NetworksRoutes(store: networkStore).register(on: router)
        router.get("/events") { request -> HBResponse in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /events from \(request.remoteAddress?.description ?? \"unknown\")")
            let wantsSSE = request.headers[canonicalForm: "Accept"].contains { $0.contains("text/event-stream") }
            let limit = request.uri.split(separator: "?").dropFirst().first?.split(separator: "=").last.flatMap { Int($0) } ?? 50
            let events = eventStore?.recent(limit: limit) ?? []
            if wantsSSE {
                let lines = events.compactMap { event -> String? in
                    guard let data = try? JSONSerialization.data(withJSONObject: event, options: []) else { return nil }
                    return String(data: data, encoding: .utf8)
                }
                var headers = HTTPHeaders()
                headers.add(name: "Content-Type", value: "text/event-stream")
                headers.add(name: "Connection", value: "close")
                let response = HBResponse(status: .ok, headers: headers)
                return HBResponse(status: response.status, headers: response.headers) { writer in
                    for line in lines {
                        try await writer.write(.byteBuffer(.init(string: "data: \(line)\n\n")))
                    }
                    try await writer.write(.end(nil))
                }
            } else {
                let data = try JSONSerialization.data(withJSONObject: events, options: [])
                var headers = HTTPHeaders()
                headers.add(name: "Content-Type", value: "application/json")
                headers.add(name: "Content-Length", value: "\(data.count)")
                return HBResponse(status: .ok, headers: headers, body: .byteBuffer(.init(data: data)))
            }
        }
        router.post("/images/pull") { request -> HBResponse in
            struct PullRequest: Decodable { let reference: String }
            let payload = try JSONDecoder().decode(PullRequest.self, from: request.body)
            let response = [
                "status": "pulling",
                "reference": payload.reference,
                "message": "Stub pull started; engine running in \(runtime.mode.rawValue) mode."
            ]
            let data = try JSONSerialization.data(withJSONObject: response, options: [])
            return HBResponse(status: .accepted, body: .byteBuffer(.init(data: data)))
        }
        return router
    }

    public static func start(
        host: String = AppConfig.Engine.host,
        port: Int = AppConfig.Engine.port,
        runtime: ContainerRuntime = .shared,
        store: AnyContainerStore? = nil,
        imageStore: ImageStore? = nil,
        stackStore: StackStore? = nil,
        volumeStore: VolumeStore? = nil,
        networkStore: NetworkStore? = nil,
        eventStore: ShimEventStore? = nil
    ) async throws {
        let app = HBApplication(
            router: makeRouter(
                runtime: runtime,
                store: store,
                imageStore: imageStore,
                stackStore: stackStore,
                volumeStore: volumeStore,
                networkStore: networkStore,
                eventStore: eventStore
            )
        )
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
