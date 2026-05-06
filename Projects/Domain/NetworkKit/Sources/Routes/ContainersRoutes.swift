import FlyingDutchmanContainers
import Foundation
import Hummingbird
import Shared

struct ContainersRoutes: @unchecked Sendable {
    let runtime: ContainerRuntimeProtocol
    let store: AnyContainerStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/containers") { _, _ in try await runtime.listContainers() }
        router.post("/containers/create") { request, context in try await self.handleCreate(
            request: request,
            context: context
        ) }
        router.get("/containers/:id") { _, context in try await self.handleGet(context: context) }
        router.post("/containers/:id/start") { _, context in try await self.handleStart(context: context) }
        router.post("/containers/:id/stop") { _, context in try await self.handleStop(context: context) }
        router.post("/containers/:id/restart") { _, context in try await self.handleRestart(context: context) }
        router.delete("/containers/:id") { _, context in try await self.handleDelete(context: context) }
        router.get("/containers/:id/logs") { _, context in try await self.handleLogs(context: context) }
    }

    private func handleCreate(
        request: Request,
        context: BasicRequestContext
    ) async throws -> EditedResponse<ContainerSummary> {
        struct CreateRequest: Decodable {
            let name: String
            let image: String
            let config: ContainerConfig?
            let ports: [String]?
            let env: [String: String]?
            let volumes: [String]?
        }

        guard let payload = try? await request.decode(as: CreateRequest.self, context: context) else {
            throw HTTPError(.badRequest)
        }
        guard !payload.name.isEmpty, !payload.image.isEmpty else { throw HTTPError(.badRequest) }

        let baseConfig = payload.config ?? ContainerConfig.default
        let config = ContainerConfig(
            ports: baseConfig.ports ?? payload.ports,
            portMappings: baseConfig.portMappings,
            env: baseConfig.env ?? payload.env,
            volumes: baseConfig.volumes ?? payload.volumes,
            networkMode: baseConfig.networkMode,
            cpuLimit: baseConfig.cpuLimit,
            memoryLimit: baseConfig.memoryLimit,
            command: baseConfig.command,
            workingDir: baseConfig.workingDir
        )

        let container = try await runtime.createContainer(name: payload.name, image: payload.image, config: config)
        persist(container: container)
        return EditedResponse(status: .created, response: container)
    }

    private func handleGet(context: BasicRequestContext) async throws -> ContainerSummary {
        let id = try containerID(from: context)
        let containers = try await runtime.listContainers()
        guard let summary = containers.first(where: { $0.id == id }) else { throw HTTPError(.notFound) }
        return summary
    }

    private func handleStart(context: BasicRequestContext) async throws -> ContainerSummary {
        let id = try containerID(from: context)
        let containers = try await runtime.listContainers()
        guard let container = containers.first(where: { $0.id == id }) else { throw HTTPError(.notFound) }
        guard container.status == .stopped else { throw HTTPError(.conflict) }
        let updated = try await runtime.startContainer(id: id)
        persist(container: updated)
        return updated
    }

    private func handleStop(context: BasicRequestContext) async throws -> ContainerSummary {
        let id = try containerID(from: context)
        let containers = try await runtime.listContainers()
        guard let container = containers.first(where: { $0.id == id }) else { throw HTTPError(.notFound) }
        guard container.status == .running else { throw HTTPError(.conflict) }
        let updated = try await runtime.stopContainer(id: id)
        persist(container: updated)
        return updated
    }

    private func handleRestart(context: BasicRequestContext) async throws -> ContainerSummary {
        let id = try containerID(from: context)
        _ = try await runtime.stopContainer(id: id)
        try? await Task.sleep(nanoseconds: 500_000_000)
        let updated = try await runtime.startContainer(id: id)
        persist(container: updated)
        return updated
    }

    private func handleDelete(context: BasicRequestContext) async throws -> HTTPResponse.Status {
        let id = try containerID(from: context)
        let containers = try await runtime.listContainers()
        guard containers.contains(where: { $0.id == id }) else { throw HTTPError(.notFound) }
        if let container = containers.first(where: { $0.id == id }), container.status == .running {
            _ = try? await runtime.stopContainer(id: id)
        }
        try await runtime.removeContainer(id: id)
        removeFromStore(id: id)
        return .noContent
    }

    private func handleLogs(context: BasicRequestContext) async throws -> String {
        let id = try containerID(from: context)
        let logStream = try await runtime.getContainerLogs(id: id)
        var logLines: [String] = []
        for try await line in logStream {
            logLines.append(line)
        }
        return logLines.joined(separator: "\n") + "\n"
    }

    private func persist(container: ContainerSummary) {
        guard let store else { return }
        var all = store.fetchAll()
        if let index = all.firstIndex(where: { $0.id == container.id }) {
            all[index] = container
        } else {
            all.append(container)
        }
        store.replaceAll(with: all)
    }

    private func removeFromStore(id: UUID) {
        guard let store else { return }
        var all = store.fetchAll()
        all.removeAll { $0.id == id }
        store.replaceAll(with: all)
    }

    private func containerID(from context: BasicRequestContext) throws -> UUID {
        try context.parameters.require("id", as: UUID.self)
    }
}
