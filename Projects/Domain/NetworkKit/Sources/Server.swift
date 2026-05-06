import FlyingDutchmanContainers
import FlyingDutchmanPersistence
import Foundation
import Hummingbird
import HummingbirdCore
import HummingbirdHTTP2
import HummingbirdTLS
import Shared

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

private struct RuntimeEventPayload: Encodable {
    let id: String
    let containerId: String
    let type: ContainerEvent.EventType
    let timestamp: Date

    init(event: ContainerEvent) {
        self.id = event.id.uuidString
        self.containerId = event.containerID.uuidString
        self.type = event.type
        self.timestamp = event.timestamp
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case containerId
        case type
        case timestamp
    }

    private enum EventTypeKeys: String, CodingKey {
        case type
        case from
        case to
        case message
        case cpuPercent
        case memoryBytes
        case memoryPercent
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(containerId, forKey: .containerId)
        try container.encode(timestamp, forKey: .timestamp)

        var eventContainer = container.nestedContainer(keyedBy: EventTypeKeys.self, forKey: .type)
        switch type {
        case let .stateChanged(from, to):
            try eventContainer.encode("stateChanged", forKey: .type)
            try eventContainer.encode(from, forKey: .from)
            try eventContainer.encode(to, forKey: .to)
        case let .logOutput(message):
            try eventContainer.encode("logOutput", forKey: .type)
            try eventContainer.encode(message, forKey: .message)
        case let .resourceUpdate(info):
            try eventContainer.encode("resourceUpdate", forKey: .type)
            try eventContainer.encode(info.cpuPercent, forKey: .cpuPercent)
            try eventContainer.encode(info.memoryBytes, forKey: .memoryBytes)
            try eventContainer.encode(info.memoryPercent, forKey: .memoryPercent)
        }
    }
}

public enum EngineServer {
    public static func makeRouter(
        runtime: ContainerRuntimeProtocol,
        store: AnyContainerStore? = nil,
        imageStore: ImageStore? = nil,
        stackStore: StackStore? = nil,
        volumeStore: VolumeStore? = nil,
        networkStore: NetworkStore? = nil,
        eventStore: ShimEventStore? = nil,
        machineRuntime: MachineRuntimeProtocol? = nil
    ) -> Router<BasicRequestContext> {
        let router = Router(context: BasicRequestContext.self)

        router.get("/health") { _, _ in
            await HealthResponse(
                status: "ok",
                engine: "running",
                version: AppConfig.version,
                uptimeSeconds: EngineRuntime.uptimeSeconds,
                containerization: runtime.name,
                workers: ContainerizationStub.currentState(runtime: runtime).workers
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
        AuthRoutes(runtime: runtime).register(on: router)

        if let machineRuntime {
            MachinesRoutes(runtime: machineRuntime).register(on: router)
        }

        // Docker API compatibility layer
        DockerShimServer(runtime: runtime).register(on: router)

        router.get("/events") { request, context in
            await Self.handleEventsRequest(request: request, context: context, eventStore: eventStore)
        }

        router.get("/runtime-events") { request, _ in
            await Self.handleRuntimeEventsRequest(request: request, runtime: runtime)
        }

        router.post("/images/pull") { request, context in
            try await Self.handleImagePullRequest(request: request, context: context, runtime: runtime)
        }

        router.post("/images/build") { request, context in
            try await Self.handleImageBuildRequest(request: request, context: context, runtime: runtime)
        }

        return router
    }

    private static func handleEventsRequest(
        request: Request,
        context: BasicRequestContext,
        eventStore: ShimEventStore?
    ) async -> Response {
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
            let data = try? JSONSerialization.data(withJSONObject: events, options: [])
            var buffer = ByteBufferAllocator().buffer(capacity: data?.count ?? 0)
            if let data { buffer.writeBytes(data) }
            var headers = HTTPFields()
            headers[.contentType] = "application/json"
            headers[.contentLength] = "\(buffer.readableBytes)"
            return Response(status: .ok, headers: headers, body: .init(byteBuffer: buffer))
        }
    }

    private static func handleRuntimeEventsRequest(
        request: Request,
        runtime: ContainerRuntimeProtocol
    ) async -> Response {
        let wantsSSE = request.headers[values: .accept].contains("text/event-stream")
        guard wantsSSE else {
            var headers = HTTPFields()
            headers[.contentType] = "text/plain"
            return Response(
                status: .notAcceptable,
                headers: headers,
                body: ResponseBody(byteBuffer: ByteBuffer(string: "Accept: text/event-stream required"))
            )
        }
        let stream = await runtime.eventStream()
        let body = ResponseBody { writer in
            let encoder = JSONEncoder()
            do {
                for await event in stream {
                    let payload = RuntimeEventPayload(event: event)
                    let data = try encoder.encode(payload)
                    guard let json = String(data: data, encoding: .utf8) else { continue }
                    try await writer.write(ByteBuffer(string: "data: \(json)\n\n"))
                }
                try await writer.finish(nil)
            } catch {
                // Client disconnected or stream terminated.
            }
        }
        var headers = HTTPFields()
        headers[.contentType] = "text/event-stream"
        return Response(status: .ok, headers: headers, body: body)
    }

    private static func handleImagePullRequest(
        request: Request,
        context: BasicRequestContext,
        runtime: ContainerRuntimeProtocol
    ) async throws -> EditedResponse<[String: String]> {
        struct PullRequest: Decodable { let reference: String }
        let payload = try await request.decode(as: PullRequest.self, context: context)
        let image = try await runtime.pullImage(reference: payload.reference)
        let response = [
            "status": "completed",
            "reference": payload.reference,
            "message": "Pulled \(image.displayName)",
        ]
        return EditedResponse(status: .ok, response: response)
    }

    private static func handleImageBuildRequest(
        request: Request,
        context: BasicRequestContext,
        runtime: ContainerRuntimeProtocol
    ) async throws -> EditedResponse<ImageBuildResult> {
        let payload = try await request.decode(as: ImageBuildRequest.self, context: context)
        let result = try await runtime.buildImage(request: payload)
        return EditedResponse(status: .ok, response: result)
    }

    public static func start(
        host: String = AppConfig.Engine.host,
        port: Int = AppConfig.Engine.port,
        tlsConfiguration: TLSConfiguration? = nil,
        runtime: ContainerRuntimeProtocol,
        store: AnyContainerStore? = nil,
        imageStore: ImageStore? = nil,
        stackStore: StackStore? = nil,
        volumeStore: VolumeStore? = nil,
        networkStore: NetworkStore? = nil,
        eventStore: ShimEventStore? = nil,
        routingTable: DomainRoutingTable,
        machineRuntime: MachineRuntimeProtocol? = nil
    ) async throws {
        let infrastructure = try setupInfrastructure(routingTable: routingTable)
        try await infrastructure.dnsServer.start()
        await populateRoutingTable(runtime: runtime, routingTable: routingTable)
        startEventListener(runtime: runtime, routingTable: routingTable)

        var configuration = ApplicationConfiguration()
        configuration.address = .hostname(host, port: port)
        let router = makeRouter(
            runtime: runtime,
            store: store,
            imageStore: imageStore,
            stackStore: stackStore,
            volumeStore: volumeStore,
            networkStore: networkStore,
            eventStore: eventStore,
            machineRuntime: machineRuntime
        )
        let serverBuilder: HTTPServerBuilder = if let tlsConfiguration {
            try .http2Upgrade(tlsConfiguration: tlsConfiguration)
        } else {
            .http1()
        }
        let app = Application(
            router: router,
            server: serverBuilder,
            configuration: configuration,
            onServerRunning: { _ in
                Loggers.make(category: "flyingdutchman.networking").info("HTTP server started on \(host):\(port)")
            }
        )

        try await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask { try await app.runService() }
            group.addTask { try await infrastructure.httpsProxy.run() }
            try await group.next()
        }

        await infrastructure.dnsServer.shutdown()
    }

    private struct Infrastructure {
        let dnsServer: DNSServer
        let httpsProxy: HTTPSProxy
    }

    private static func setupInfrastructure(routingTable: DomainRoutingTable) throws -> Infrastructure {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let appSupportDir = base.appendingPathComponent("flyingdutchman", isDirectory: true)
        let certsDir = appSupportDir.appendingPathComponent("certs", isDirectory: true)
        let ca = CertificateAuthority(storagePath: certsDir)
        return Infrastructure(
            dnsServer: DNSServer(routingTable: routingTable),
            httpsProxy: HTTPSProxy(routingTable: routingTable, ca: ca)
        )
    }

    private static func populateRoutingTable(
        runtime: ContainerRuntimeProtocol,
        routingTable: DomainRoutingTable
    ) async {
        guard let containers = try? await runtime.listContainers() else { return }
        for container in containers where container.status == .running {
            await routingTable.register(container: container, config: .default)
        }
    }

    private static func startEventListener(
        runtime: ContainerRuntimeProtocol,
        routingTable: DomainRoutingTable
    ) {
        Task {
            let stream = await runtime.eventStream()
            for await event in stream {
                guard case let .stateChanged(_, to) = event.type else { continue }
                if to == .running {
                    if let containers = try? await runtime.listContainers(),
                       let container = containers.first(where: { $0.id == event.containerID }) {
                        await routingTable.register(container: container, config: .default)
                    }
                } else if to.isStopped {
                    await routingTable.unregister(containerID: event.containerID)
                }
            }
        }
    }
}

extension ContainerSummary: ResponseEncodable {}
extension ImageSummary: ResponseEncodable {}
extension StackSummary: ResponseEncodable {}
extension StackActionResponse: ResponseEncodable {}
extension VolumeSummary: ResponseEncodable {}
extension NetworkSummary: ResponseEncodable {}
