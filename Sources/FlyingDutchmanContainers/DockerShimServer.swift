import Foundation
import Logging
import NIO
import NIOHTTP1
import NIOPosix
import Shared

/// Minimal Docker API compatibility shim backed by the stub runtime.
public enum DockerShimServer {
    /// Override socket path with `FD_DOCKER_SHIM_SOCKET` to avoid /var/run permissions in dev.
    public static var socketPath: String {
        ProcessInfo.processInfo.environment["FD_DOCKER_SHIM_SOCKET"] ?? "/var/run/flyingdutchman-docker.sock"
    }

    private actor ShimState {
        var group: EventLoopGroup?
        var channel: Channel?

        func isRunning() -> Bool {
            channel != nil
        }

        func set(group: EventLoopGroup, channel: Channel) {
            self.group = group
            self.channel = channel
        }

        func stopIfRunning() throws -> Bool {
            guard let channel, let group else { return false }
            try channel.close().wait()
            try group.syncShutdownGracefully()
            self.channel = nil
            self.group = nil
            return true
        }

        func clear() {
            channel = nil
            group = nil
        }
    }

    private static let state = ShimState()

    public static func startStub(
        runtime: ContainerRuntimeProtocol = ContainerRuntime.shared,
        logger: Logger = Loggers.make(category: "flyingdutchman.dockershim")
    ) async {
        if await state.isRunning() {
            logger.info("Docker shim stub already running at \(socketPath)")
            return
        }

        do {
            // Clean up any stale socket.
            try? FileManager.default.removeItem(atPath: socketPath)

            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)

            let bootstrap = ServerBootstrap(group: group)
                .serverChannelOption(ChannelOptions.backlog, value: 256)
                .serverChannelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
                .childChannelInitializer { channel in
                    channel.pipeline.configureHTTPServerPipeline().flatMap {
                        channel.pipeline.addHandler(DockerShimHandler(runtime: runtime, logger: logger))
                    }
                }

            let address = try SocketAddress(unixDomainSocketPath: socketPath)
            let channel = try bootstrap.bind(to: address).wait()
            await state.set(group: group, channel: channel)
            logger.info("Docker shim stub listening on \(socketPath)")
        } catch {
            logger.error("Failed to start Docker shim stub: \(error.localizedDescription)")
            await state.clear()
            logger.warning("Docker shim fell back to stub mode; start engine with Containerization for full support.")
        }
    }

    public static func stop(logger: Logger = Loggers.make(category: "flyingdutchman.dockershim")) async {
        do {
            if try await state.stopIfRunning() {
                logger.info("Docker shim stub stopped")
            }
        } catch {
            logger.warning("Failed to stop Docker shim stub: \(error.localizedDescription)")
        }
    }
}

private final class DockerShimHandler: ChannelInboundHandler {
    typealias InboundIn = HTTPServerRequestPart
    typealias OutboundOut = HTTPServerResponsePart

    private let runtime: ContainerRuntimeProtocol
    private let logger: Logger
    private var requestHead: HTTPRequestHead?
    private var bodyBuffer: ByteBuffer?
    private var capturedLogs: [UUID: [String]] = [:]
    private let eventStore: EventRecorder?

    init(runtime: ContainerRuntimeProtocol, logger: Logger) {
        self.runtime = runtime
        self.logger = logger
        self.eventStore = runtime.eventStore
    }

    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let part = self.unwrapInboundIn(data)
        switch part {
        case .head(let head):
            requestHead = head
            bodyBuffer = context.channel.allocator.buffer(capacity: 0)
        case .body(var chunk):
            bodyBuffer?.writeBuffer(&chunk)
        case .end:
            guard let head = requestHead else {
                respond(context: context, status: .badRequest, body: "missing request")
                return
            }
            handle(head: head, context: context)
            requestHead = nil
            bodyBuffer = nil
        }
    }

    func channelReadComplete(context: ChannelHandlerContext) {
        context.flush()
    }

    func errorCaught(context: ChannelHandlerContext, error: Error) {
        logger.warning("Docker shim connection error: \(error.localizedDescription)")
        respond(context: context, status: .internalServerError, body: "error")
    }

    private func handle(head: HTTPRequestHead, context: ChannelHandlerContext) {
        logger.debug("Shim request \(head.method.rawValue) \(head.uri)")
        switch (head.method, head.uri) {
        case (.GET, "/_ping"):
            respond(context: context, status: .ok, body: "OK")
        case (.GET, "/version"):
            let payload: [String: String] = [
                "Version": AppConfig.version,
                "ApiVersion": "1.43",
                "MinAPIVersion": "1.24"
            ]
            respondJSON(context: context, status: .ok, payload: payload)
        case (.GET, "/containers/json"):
            let containers = runtime.list().map { summary -> [String: Any] in
                [
                    "Id": summary.id.uuidString,
                    "Names": ["/\(summary.name)"],
                    "Image": summary.image,
                    "State": summary.status.rawValue,
                    "Status": summary.status.displayName
                ]
            }
            respondJSON(context: context, status: .ok, payload: containers)
        case (.POST, "/containers/create"):
            handleCreate(context: context)
        case (.GET, let uri) where uri.contains("/logs"):
            handleLogs(uri: uri, context: context)
        case (.GET, "/events"):
            let wantsSSE = head.headers.first(name: "Accept")?.contains("text/event-stream") == true
            handleEvents(context: context, stream: wantsSSE)
        default:
            // Handle start/stop: /containers/<id>/start or /containers/<id>/stop
            if let action = action(for: head.uri) {
                handleMutation(action: action, context: context)
            } else {
                respondUnsupported(context: context, reason: "Route \(head.uri) unsupported in shim stub")
            }
        }
    }

    private func handleMutation(action: MutationAction, context: ChannelHandlerContext) {
        guard let container = runtime.list().first(where: { $0.id == action.id }) else {
            respond(context: context, status: .notFound, body: "no such container")
            logger.warning("Shim mutation failed: container \(action.id) not found for \(action.kind)")
            return
        }

        let updated: ContainerSummary?
        switch action.kind {
        case .start:
            updated = runtime.start(containerID: container.id)
        case .stop:
            updated = runtime.stop(containerID: container.id)
        }

        if updated != nil {
            logger.info("Shim \(action.kind) applied to \(container.name) (\(container.id))")
            appendLog(containerID: container.id, line: "\(Date()): \(action.kind) requested via shim")
            eventStore?.record(status: action.kind == .start ? "running" : "stopped", containerId: container.id, image: container.image, kind: "state")
            respond(context: context, status: .noContent, body: nil)
        } else {
            logger.warning("Shim mutation failed for \(container.name) (\(container.id)) kind=\(action.kind)")
            respond(context: context, status: .internalServerError, body: "mutation failed")
        }
    }

    private func handleCreate(context: ChannelHandlerContext) {
        guard let bodyBuffer,
              let bytes = bodyBuffer.getBytes(at: bodyBuffer.readerIndex, length: bodyBuffer.readableBytes) else {
            respond(context: context, status: .badRequest, body: "missing body")
            return
        }
        let payload = (try? JSONSerialization.jsonObject(with: Data(bytes))) as? [String: Any]
        let image = payload?["Image"] as? String ?? "unknown:latest"
        let name = (payload?["name"] as? String) ?? "shim-\(Int.random(in: 1000...9999))"
        let summary = ContainerSummary(name: name, image: image, status: .stopped, ports: [])
        runtime.importContainer(summary)
        appendLog(containerID: summary.id, line: "\(Date()): created via shim (stub)")
        eventStore?.record(status: "created", containerId: summary.id, image: summary.image, kind: "create")
        respondJSON(context: context, status: .created, payload: ["Id": summary.id.uuidString, "Warnings": []])
    }

    private func handleLogs(uri: String, context: ChannelHandlerContext) {
        guard let uuid = containerID(fromLogsURI: uri) else {
            respond(context: context, status: .badRequest, body: "invalid container id")
            return
        }
        let logs = capturedLogs[uuid] ?? ["shim: no logs captured yet"]
        let joined = logs.joined(separator: "\n") + "\n"
        respond(context: context, status: .ok, body: joined)
    }

    private func containerID(fromLogsURI uri: String) -> UUID? {
        let trimmed = uri.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let parts = trimmed.split(separator: "/")
        guard parts.count >= 3, parts[0] == "containers" else { return nil }
        return UUID(uuidString: String(parts[1]))
    }

    private func action(for uri: String) -> MutationAction? {
        let trimmed = uri.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let parts = trimmed.split(separator: "/")
        guard parts.count == 3, parts[0] == "containers", let uuid = UUID(uuidString: String(parts[1])) else {
            return nil
        }
        switch parts[2] {
        case "start":
            return MutationAction(id: uuid, kind: .start)
        case "stop":
            return MutationAction(id: uuid, kind: .stop)
        default:
            return nil
        }
    }

    private func respond(context: ChannelHandlerContext, status: HTTPResponseStatus, body: String?) {
        var headers = HTTPHeaders()
        headers.add(name: "Content-Type", value: "text/plain")
        var buffer = context.channel.allocator.buffer(capacity: 0)
        if let body {
            buffer.writeString(body)
        }
        headers.add(name: "Content-Length", value: "\(buffer.readableBytes)")
        let head = HTTPResponseHead(version: .init(major: 1, minor: 1), status: status, headers: headers)
        context.write(self.wrapOutboundOut(.head(head)), promise: nil)
        context.write(self.wrapOutboundOut(.body(.byteBuffer(buffer))), promise: nil)
        context.writeAndFlush(self.wrapOutboundOut(.end(nil)), promise: nil)
    }

    private func respondJSON(context: ChannelHandlerContext, status: HTTPResponseStatus, payload: Any) {
        guard JSONSerialization.isValidJSONObject(payload),
              let data = try? JSONSerialization.data(withJSONObject: payload, options: []) else {
            respond(context: context, status: .internalServerError, body: "serialization error")
            return
        }

        var headers = HTTPHeaders()
        headers.add(name: "Content-Type", value: "application/json")
        headers.add(name: "Content-Length", value: "\(data.count)")
        let head = HTTPResponseHead(version: .init(major: 1, minor: 1), status: status, headers: headers)
        var buffer = context.channel.allocator.buffer(capacity: data.count)
        buffer.writeBytes(data)
        context.write(self.wrapOutboundOut(.head(head)), promise: nil)
        context.write(self.wrapOutboundOut(.body(.byteBuffer(buffer))), promise: nil)
        context.writeAndFlush(self.wrapOutboundOut(.end(nil)), promise: nil)
    }

    private func respondUnsupported(context: ChannelHandlerContext, reason: String) {
        let payload: [String: String] = [
            "message": reason,
            "hint": "Use native engine APIs or container CLI until shim is fully implemented."
        ]
        respondJSON(context: context, status: .notImplemented, payload: payload)
    }

    private func appendLog(containerID: UUID, line: String) {
        var logs = capturedLogs[containerID] ?? []
        logs.append(line)
        capturedLogs[containerID] = logs.suffix(200) // cap in-memory log size
    }

    private func handleEvents(context: ChannelHandlerContext, stream: Bool) {
        let events: [[String: Any]] = runtime.list().map { container in
            [
                "status": "shim",
                "id": container.id.uuidString,
                "from": container.image,
                "Type": "container",
                "Action": "stub",
                "time": Int(Date().timeIntervalSince1970)
            ]
        }
        let persisted = eventStore?.recent(limit: 50) ?? []
        let merged = persisted.isEmpty ? events : persisted
        let lines = merged.compactMap { event -> String? in
            guard let data = try? JSONSerialization.data(withJSONObject: event, options: []) else { return nil }
            return String(data: data, encoding: .utf8)
        }

        if stream {
            var headers = HTTPHeaders()
            headers.add(name: "Content-Type", value: "text/event-stream")
            headers.add(name: "Connection", value: "close")
            let head = HTTPResponseHead(version: .init(major: 1, minor: 1), status: .ok, headers: headers)
            context.write(self.wrapOutboundOut(.head(head)), promise: nil)
            for line in lines {
                var buffer = context.channel.allocator.buffer(capacity: line.utf8.count + 6)
                buffer.writeString("data: \(line)\n\n")
                context.write(self.wrapOutboundOut(.body(.byteBuffer(buffer))), promise: nil)
            }
            context.writeAndFlush(self.wrapOutboundOut(.end(nil)), promise: nil)
        } else {
            let body = lines.joined(separator: "\n") + "\n"
            var headers = HTTPHeaders()
            headers.add(name: "Content-Type", value: "application/json")
            headers.add(name: "Connection", value: "close")
            headers.add(name: "Content-Length", value: "\(body.utf8.count)")
            let head = HTTPResponseHead(version: .init(major: 1, minor: 1), status: .ok, headers: headers)
            context.write(self.wrapOutboundOut(.head(head)), promise: nil)
            var buffer = context.channel.allocator.buffer(capacity: body.utf8.count)
            buffer.writeString(body)
            context.write(self.wrapOutboundOut(.body(.byteBuffer(buffer))), promise: nil)
            context.writeAndFlush(self.wrapOutboundOut(.end(nil)), promise: nil)
        }
    }

    private struct MutationAction {
        enum Kind {
            case start
            case stop
        }

        let id: UUID
        let kind: Kind
    }
}
