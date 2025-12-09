import Foundation
import Hummingbird
import FlyingDutchmanContainers
import Shared

struct ContainersRoutes {
    let runtime: ContainerRuntime
    let store: AnyContainerStore?

    func register(on router: HBRouter) {
        router.get("/containers") { _ in
            runtime.list()
        }

        router.post("/containers/:id/start") { request -> ContainerSummary in
            let id = try containerID(from: request)
            guard let updated = runtime.start(containerID: id) else {
                throw HBHTTPError(.notFound)
            }
            persist()
            return updated
        }

        router.post("/containers/:id/stop") { request -> ContainerSummary in
            let id = try containerID(from: request)
            guard let updated = runtime.stop(containerID: id) else {
                throw HBHTTPError(.notFound)
            }
            persist()
            return updated
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
