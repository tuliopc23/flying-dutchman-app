import Foundation
import Hummingbird
import FlyingDutchmanContainers
import Shared

struct ContainersRoutes {
    let runtime: ContainerRuntimeProtocol
    let store: AnyContainerStore?

    func register(on router: HBRouter) {
        router.get("/containers") { request in
            Loggers.make(category: "flyingdutchman.networking").debug("GET /containers from \(request.remoteAddress?.description ?? \"unknown\")")
            runtime.list()
        }

        router.get("/containers/:id") { request -> ContainerSummary in
            let id = try containerID(from: request)
            guard let summary = runtime.list().first(where: { $0.id == id }) else {
                throw HBHTTPError(.notFound)
            }
            return summary
        }

        router.post("/containers/:id/start") { request -> ContainerSummary in
            Loggers.make(category: "flyingdutchman.networking").debug("POST /containers/\(request.parameters.get(\"id\") ?? \"\")/start")
            let id = try containerID(from: request)
            guard let updated = runtime.start(containerID: id) else {
                throw HBHTTPError(.notFound)
            }
            persist()
            return updated
        }

        router.post("/containers/:id/stop") { request -> ContainerSummary in
            Loggers.make(category: "flyingdutchman.networking").debug("POST /containers/\(request.parameters.get(\"id\") ?? \"\")/stop")
            let id = try containerID(from: request)
            guard let updated = runtime.stop(containerID: id) else {
                throw HBHTTPError(.notFound)
            }
            persist()
            return updated
        }

        router.post("/containers/:id/restart") { request -> ContainerSummary in
            Loggers.make(category: "flyingdutchman.networking").debug("POST /containers/\(request.parameters.get(\"id\") ?? \"\")/restart")
            let id = try containerID(from: request)
            guard let updated = runtime.restart(containerID: id) else {
                throw HBHTTPError(.notFound)
            }
            persist()
            return updated
        }

        router.get("/containers/:id/logs") { request -> HBResponse in
            let id = try containerID(from: request)
            let logs = runtime.logs(for: id)
            let joined = logs.joined(separator: "\n") + "\n"
            var buffer = ByteBuffer()
            buffer.writeString(joined)
            var headers = HTTPHeaders()
            headers.add(name: "Content-Type", value: "text/plain")
            headers.add(name: "Content-Length", value: "\(buffer.readableBytes)")
            return HBResponse(status: .ok, headers: headers, body: .byteBuffer(buffer))
        }
    }

    private func persist() {
        guard let store else { return }
        runtime.export(to: store)
    }

    private func containerID(from request: HBRequest) throws -> UUID {
        guard let idString = request.parameters.get("id"), let uuid = UUID(uuidString: idString) else {
            throw HBHTTPError(.badRequest)
        }
        return uuid
    }
}
