import Foundation
import Hummingbird
import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers

struct StacksRoutes: @unchecked Sendable {
    let runtime: ContainerRuntimeProtocol
    let store: StackStore?

    func register(on router: Router<BasicRequestContext>) {
        router.get("/stacks") { _, _ -> [StackSummary] in
            guard let store else { return [] }
            return store.fetchAll()
        }

        router.get("/stacks/:id") { _, context -> StackSummary in
            let id = try context.parameters.require("id", as: UUID.self)
            guard let store, let stack = store.fetch(id: id) else {
                throw HTTPError(.notFound)
            }
            return stack
        }

        router.post("/stacks") { request, context -> StackSummary in
            let payload = try await request.decode(as: StackCreateRequest.self, context: context)
            let name = payload.name.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !name.isEmpty else { throw HTTPError(.badRequest) }
            guard let store else { throw HTTPError(.serviceUnavailable) }
            do {
                return try store.create(
                    StackCreateRequest(
                        name: name,
                        description: payload.description,
                        containerNames: payload.containerNames
                    )
                )
            } catch {
                throw HTTPError(.internalServerError)
            }
        }

        router.post("/stacks/:id/start") { _, context -> StackActionResponse in
            let id = try context.parameters.require("id", as: UUID.self)
            guard let store, let stack = store.fetch(id: id) else {
                throw HTTPError(.notFound)
            }
            return try await perform(action: "start", stack: stack)
        }

        router.post("/stacks/:id/stop") { _, context -> StackActionResponse in
            let id = try context.parameters.require("id", as: UUID.self)
            guard let store, let stack = store.fetch(id: id) else {
                throw HTTPError(.notFound)
            }
            return try await perform(action: "stop", stack: stack)
        }
    }

    private func perform(action: String, stack: StackSummary) async throws -> StackActionResponse {
        let containers = try await runtime.listContainers()
        let containersByName = Dictionary(uniqueKeysWithValues: containers.map { ($0.name, $0) })
        var updated: [ContainerSummary] = []
        var errors: [String] = []

        let orderedNames: [String]
        if action == "stop" {
            orderedNames = stack.containerNames.reversed()
        } else {
            orderedNames = stack.containerNames
        }

        for name in orderedNames {
            guard let existing = containersByName[name] else {
                errors.append("Container '\(name)' not found")
                continue
            }
            do {
                let result: ContainerSummary
                switch action {
                case "stop":
                    result = try await runtime.stopContainer(id: existing.id)
                default:
                    result = try await runtime.startContainer(id: existing.id)
                }
                updated.append(result)
            } catch {
                errors.append("Failed to \(action) '\(name)': \(error.localizedDescription)")
            }
        }

        return StackActionResponse(stack: stack, affectedContainers: updated, errors: errors)
    }
}
