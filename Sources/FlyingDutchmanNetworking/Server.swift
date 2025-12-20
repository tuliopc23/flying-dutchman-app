import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers

public struct EngineServer {
    private struct HealthResponse: ResponseEncodable {
        let status: String
        let engine: String
        let version: String
        let uptimeSeconds: Int
        let containerization: String
        let workers: [String: String]
    }

    private struct StatusResponse: ResponseEncodable {
        let engine: String
        let uptimeSeconds: Int
        let workers: [String: String]
        let mode: String
    }

    public static func makeRouter(
        runtime: ContainerRuntimeProtocol,
        store: AnyContainerStore? = nil,
        imageStore: ImageStore? = nil,
        stackStore: StackStore? = nil,
        volumeStore: VolumeStore? = nil,
        networkStore: NetworkStore? = nil,
        eventStore: ShimEventStore? = nil
    ) -> Router<BasicRequestContext> {
        let router = Router(context: BasicRequestContext.self)

        router.get("/health") { _, _ in
            HealthResponse(
                status: "ok",
                engine: "running",
                version: AppConfig.version,
                uptimeSeconds: EngineRuntime.uptimeSeconds,
                containerization: await runtime.name,
                workers: await ContainerizationStub.currentState(runtime: runtime).workers
            )
        }

        router.get("/status") { _, _ in
            let state = await ContainerizationStub.currentState(runtime: runtime)
            return StatusResponse(
                engine: state.engine,
                uptimeSeconds: state.uptimeSeconds,
                workers: state.workers,
                mode: state.mode
            )
        }

        ContainersRoutes(runtime: runtime, store: store).register(on: router)
        ImagesRoutes(store: imageStore).register(on: router)
        StacksRoutes(runtime: runtime, store: stackStore).register(on: router)
        VolumesRoutes(store: volumeStore).register(on: router)
        NetworksRoutes(store: networkStore).register(on: router)
        
        // Docker API compatibility layer
        DockerShimServer(runtime: runtime).register(on: router)

        router.get("/events") { request, context -> Response in
            struct EventsQuery: Decodable { let limit: Int? }

            let wantsSSE = request.headers[values: .accept].contains("text/event-stream")
            let query = try? request.uri.decodeQuery(as: EventsQuery.self, context: context)
            let limit = query?.limit ?? 50
            let events = eventStore?.recent(limit: limit) ?? []

            if wantsSSE {
                let lines: [String] = events.compactMap { event in
                    guard let data = try? JSONSerialization.data(withJSONObject: event, options: []) else { return nil }
                    return String(data: data, encoding: .utf8)
                }

                let body = ResponseBody { writer in
                    for line in lines {
                        try await writer.write(ByteBuffer(string: "data: \(line)\n\n"))
                    }
                    try await writer.finish(nil)
                }
                var headers = HTTPFields()
                headers[.contentType] = "text/event-stream"
                return Response(status: .ok, headers: headers, body: body)
            } else {
                let data = try JSONSerialization.data(withJSONObject: events, options: [])
                var buffer = ByteBufferAllocator().buffer(capacity: data.count)
                buffer.writeBytes(data)

                var headers = HTTPFields()
                headers[.contentType] = "application/json"
                headers[.contentLength] = "\(buffer.readableBytes)"

                return Response(status: .ok, headers: headers, body: .init(byteBuffer: buffer))
            }
        }

        router.post("/images/pull") { request, context in
            struct PullRequest: Decodable { let reference: String }
            let payload = try await request.decode(as: PullRequest.self, context: context)
            let response = [
                "status": "pulling",
                "reference": payload.reference,
                "message": "Stub pull started; engine running in \(await runtime.name) mode."
            ]
            return EditedResponse(status: .accepted, response: response)
        }

        return router
    }

    public static func start(
        host: String = AppConfig.Engine.host,
        port: Int = AppConfig.Engine.port,
        runtime: ContainerRuntimeProtocol,
        store: AnyContainerStore? = nil,
        imageStore: ImageStore? = nil,
        stackStore: StackStore? = nil,
        volumeStore: VolumeStore? = nil,
        networkStore: NetworkStore? = nil,
        eventStore: ShimEventStore? = nil
    ) async throws {
        var configuration = ApplicationConfiguration()
        configuration.address = .hostname(host, port: port)

        let router = makeRouter(
            runtime: runtime,
            store: store,
            imageStore: imageStore,
            stackStore: stackStore,
            volumeStore: volumeStore,
            networkStore: networkStore,
            eventStore: eventStore
        )

        let app = Application(
            router: router,
            configuration: configuration,
            onServerRunning: { _ in
                Loggers.make(category: "flyingdutchman.networking").info("HTTP server started on \(host):\(port)")
            }
        )

        try await app.runService()
    }
}

extension ContainerSummary: ResponseEncodable {}
extension ImageSummary: ResponseEncodable {}
extension StackSummary: ResponseEncodable {}
extension StackActionResponse: ResponseEncodable {}
extension VolumeSummary: ResponseEncodable {}
extension NetworkSummary: ResponseEncodable {}
