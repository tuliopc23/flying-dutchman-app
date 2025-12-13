import Foundation
import Hummingbird
import FlyingDutchmanContainers
import Shared

struct ContainersRoutes: @unchecked Sendable {
    let runtime: ContainerRuntimeProtocol
    let store: AnyContainerStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/containers") { _, _ in
            runtime.list()
        }

        router.get("/containers/:id") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            guard let summary = runtime.list().first(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }
            return summary
        }

        router.post("/containers/:id/start") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            guard let updated = runtime.start(containerID: id) else {
                throw HTTPError(.notFound)
            }
            persist()
            return updated
        }

        router.post("/containers/:id/stop") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            guard let updated = runtime.stop(containerID: id) else {
                throw HTTPError(.notFound)
            }
            persist()
            return updated
        }

        router.post("/containers/:id/restart") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            guard let updated = runtime.restart(containerID: id) else {
                throw HTTPError(.notFound)
            }
            persist()
            return updated
        }

        router.get("/containers/:id/logs") { _, context -> String in
            let id = try containerID(from: context)
            let logs = runtime.logs(for: id)
            return logs.joined(separator: "\n") + "\n"
        }
    }

    private func persist() {
        guard let store else { return }
        runtime.export(to: store)
    }

    private func containerID(from context: BasicRequestContext) throws -> UUID {
        try context.parameters.require("id", as: UUID.self)
    }
}
