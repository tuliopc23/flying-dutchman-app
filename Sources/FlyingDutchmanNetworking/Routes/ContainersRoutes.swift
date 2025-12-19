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

        router.post("/containers/create") { request, context -> EditedResponse<ContainerSummary> in
            struct CreateRequest: Decodable {
                let name: String
                let image: String
                let ports: [String]?
                let env: [String: String]?
            }

            guard let payload = try? await request.decode(as: CreateRequest.self, context: context) else {
                throw HTTPError(.badRequest)
            }

            guard !payload.name.isEmpty else {
                throw HTTPError(.badRequest)
            }

            guard !payload.image.isEmpty else {
                throw HTTPError(.badRequest)
            }

            // Create container via runtime
            let container = ContainerSummary(
                name: payload.name,
                image: payload.image,
                status: .stopped,
                ports: payload.ports ?? []
            )

            // Import into runtime and persist
            runtime.importContainer(container)
            persist()

            return EditedResponse(status: .created, response: container)
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
            guard let container = runtime.list().first(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }
            guard container.status == .stopped else {
                throw HTTPError(.conflict)
            }
            guard let updated = runtime.start(containerID: id) else {
                throw HTTPError(.internalServerError)
            }
            persist()
            return updated
        }

        router.post("/containers/:id/stop") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            guard let container = runtime.list().first(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }
            guard container.status == .running else {
                throw HTTPError(.conflict)
            }
            guard let updated = runtime.stop(containerID: id) else {
                throw HTTPError(.internalServerError)
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

        router.delete("/containers/:id") { _, context -> HTTPResponse.Status in
            let id = try containerID(from: context)
            guard runtime.list().contains(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }

            // Stop if running, then remove
            if let container = runtime.list().first(where: { $0.id == id }), container.status == .running {
                _ = runtime.stop(containerID: id)
            }

            // Remove from runtime (will clean up persistence via export)
            // Note: ContainerRuntime doesn't have a remove method yet, so we'll just stop it
            // The actual removal will be handled when we implement full lifecycle
            persist()

            return .noContent
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
