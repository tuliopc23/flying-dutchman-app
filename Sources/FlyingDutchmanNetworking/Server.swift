import Foundation
import Hummingbird
import HummingbirdCore
import HummingbirdHTTP2
import HummingbirdTLS
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
            case .stateChanged(let from, let to):
                try eventContainer.encode("stateChanged", forKey: .type)
                try eventContainer.encode(from, forKey: .from)
                try eventContainer.encode(to, forKey: .to)
            case .logOutput(let message):
                try eventContainer.encode("logOutput", forKey: .type)
                try eventContainer.encode(message, forKey: .message)
            case .resourceUpdate(let info):
                try eventContainer.encode("resourceUpdate", forKey: .type)
                try eventContainer.encode(info.cpuPercent, forKey: .cpuPercent)
                try eventContainer.encode(info.memoryBytes, forKey: .memoryBytes)
                try eventContainer.encode(info.memoryPercent, forKey: .memoryPercent)
            }
        }
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
        AuthRoutes(runtime: runtime).register(on: router)
        
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
        
        router.get("/runtime-events") { request, _ -> Response in
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
        tlsConfiguration: TLSConfiguration? = nil,
        runtime: ContainerRuntimeProtocol,
        store: AnyContainerStore? = nil,
        imageStore: ImageStore? = nil,
        stackStore: StackStore? = nil,
        volumeStore: VolumeStore? = nil,
        networkStore: NetworkStore? = nil,
        eventStore: ShimEventStore? = nil
    ) async throws {
        // 1. Initialize Networking Infrastructure
        let routingTable = DomainRoutingTable()
        
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let appSupportDir = base.appendingPathComponent("flyingdutchman", isDirectory: true)
        let certsDir = appSupportDir.appendingPathComponent("certs", isDirectory: true)
        
        let ca = CertificateAuthority(storagePath: certsDir)
        
        let dnsServer = DNSServer(routingTable: routingTable)
        let httpsProxy = HTTPSProxy(routingTable: routingTable, ca: ca)
        
        // 2. Start DNS Server (Background)
        try await dnsServer.start()
        
        // 3. Populate initial routing table
        if let containers = try? await runtime.listContainers() {
             for container in containers where container.status == .running {
                 await routingTable.register(container: container, config: .default)
             }
        }
        
        // 4. Start Event Listener for Dynamic Updates
        Task {
            let stream = await runtime.eventStream()
            for await event in stream {
                if case .stateChanged(_, let to) = event.type {
                    if to == .running {
                        // Container started, register it
                        if let containers = try? await runtime.listContainers(),
                           let container = containers.first(where: { $0.id == event.containerID }) {
                            // Note: We use default config here as we lack access to the full config in this context.
                            // The routing table will fallback to legacy ports from ContainerSummary.
                            await routingTable.register(container: container, config: .default)
                        }
                    } else if to.isStopped {
                        // Container stopped, unregister
                        await routingTable.unregister(containerID: event.containerID)
                    }
                }
            }
        }

        // 5. Prepare Engine API Server
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

        let serverBuilder: HTTPServerBuilder
        if let tlsConfiguration {
            serverBuilder = try .http2Upgrade(tlsConfiguration: tlsConfiguration)
        } else {
            serverBuilder = .http1()
        }

        let app = Application(
            router: router,
            server: serverBuilder,
            configuration: configuration,
            onServerRunning: { _ in
                Loggers.make(category: "flyingdutchman.networking").info("HTTP server started on \(host):\(port)")
            }
        )

        // 6. Run Services Concurrently
        try await withThrowingTaskGroup(of: Void.self) { group in
            // Engine API
            group.addTask {
                try await app.runService()
            }
            
            // HTTPS Proxy
            group.addTask {
                try await httpsProxy.run()
            }
            
            // Wait for any to fail
            try await group.next()
        }
        
        // Cleanup
        await dnsServer.shutdown()
    }
}

extension ContainerSummary: ResponseEncodable {}
extension ImageSummary: ResponseEncodable {}
extension StackSummary: ResponseEncodable {}
extension StackActionResponse: ResponseEncodable {}
extension VolumeSummary: ResponseEncodable {}
extension NetworkSummary: ResponseEncodable {}
