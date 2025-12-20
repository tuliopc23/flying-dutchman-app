import Foundation
import Hummingbird
import FlyingDutchmanContainers
import Shared

struct ContainersRoutes: @unchecked Sendable {
    let runtime: ContainerRuntimeProtocol
    let store: AnyContainerStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/containers") { _, _ in
            try await runtime.listContainers()
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
            let config = ContainerConfig(ports: payload.ports, env: payload.env)
            let container = try await runtime.createContainer(
                name: payload.name,
                image: payload.image,
                config: config
            )

            // Persist to store if provided
            if let store {
                var all = store.fetchAll()
                all.append(container)
                store.replaceAll(with: all)
            }

            return EditedResponse(status: .created, response: container)
        }

        router.get("/containers/:id") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            let containers = try await runtime.listContainers()
            guard let summary = containers.first(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }
            return summary
        }

        router.post("/containers/:id/start") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            let containers = try await runtime.listContainers()
            guard let container = containers.first(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }
            guard container.status == .stopped else {
                throw HTTPError(.conflict)
            }
            let updated = try await runtime.startContainer(id: id)
            
            // Persist to store if provided
            if let store {
                var all = store.fetchAll()
                if let index = all.firstIndex(where: { $0.id == updated.id }) {
                    all[index] = updated
                } else {
                    all.append(updated)
                }
                store.replaceAll(with: all)
            }
            
            return updated
        }

        router.post("/containers/:id/stop") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            let containers = try await runtime.listContainers()
            guard let container = containers.first(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }
            guard container.status == .running else {
                throw HTTPError(.conflict)
            }
            let updated = try await runtime.stopContainer(id: id)
            
            // Persist to store if provided
            if let store {
                var all = store.fetchAll()
                if let index = all.firstIndex(where: { $0.id == updated.id }) {
                    all[index] = updated
                } else {
                    all.append(updated)
                }
                store.replaceAll(with: all)
            }
            
            return updated
        }

        router.post("/containers/:id/restart") { _, context -> ContainerSummary in
            let id = try containerID(from: context)
            // Stop first, then start
            _ = try await runtime.stopContainer(id: id)
            try? await Task.sleep(nanoseconds: 500_000_000) // Brief delay
            let updated = try await runtime.startContainer(id: id)
            
            // Persist to store if provided
            if let store {
                var all = store.fetchAll()
                if let index = all.firstIndex(where: { $0.id == updated.id }) {
                    all[index] = updated
                } else {
                    all.append(updated)
                }
                store.replaceAll(with: all)
            }
            
            return updated
        }

        router.delete("/containers/:id") { _, context -> HTTPResponse.Status in
            let id = try containerID(from: context)
            let containers = try await runtime.listContainers()
            guard containers.contains(where: { $0.id == id }) else {
                throw HTTPError(.notFound)
            }

            // Stop if running, then remove
            if let container = containers.first(where: { $0.id == id }), container.status == .running {
                _ = try? await runtime.stopContainer(id: id)
            }

            // Remove container
            try await runtime.removeContainer(id: id)
            
            // Remove from store if provided
            if let store {
                var all = store.fetchAll()
                all.removeAll { $0.id == id }
                store.replaceAll(with: all)
            }

            return .noContent
        }

        router.get("/containers/:id/logs") { _, context -> String in
            let id = try containerID(from: context)
            let logStream = try await runtime.getContainerLogs(id: id)
            var logLines: [String] = []
            for try await line in logStream {
                logLines.append(line)
            }
            return logLines.joined(separator: "\n") + "\n"
        }
    }

    private func containerID(from context: BasicRequestContext) throws -> UUID {
        try context.parameters.require("id", as: UUID.self)
    }
}
