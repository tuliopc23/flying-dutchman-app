import FlyingDutchmanNetworking
import Observation
import Shared

@MainActor
@Observable
final class ContainerDetailViewModel {
    var container: ContainerSummary
    var logs: [String] = []
    var isLoadingLogs: Bool = false
    var isPerformingAction: Bool = false
    var error: String?

    init(container: ContainerSummary) {
        self.container = container
    }

    func loadLogs() async {
        isLoadingLogs = true
        defer { isLoadingLogs = false }
        do {
            logs = try await EngineClient.containerLogs(containerID: container.id)
        } catch {
            self.error = "Failed to load logs: \(error.localizedDescription)"
        }
    }

    func start() async {
        await performAction { [self] in
            let updated = try await EngineClient.startContainer(id: container.id)
            self.container = updated
            return updated
        }
    }

    func stop() async {
        await performAction { [self] in
            let updated = try await EngineClient.stopContainer(id: container.id)
            self.container = updated
            return updated
        }
    }

    func restart() async {
        await performAction { [self] in
            let updated = try await EngineClient.restartContainer(id: container.id)
            self.container = updated
            return updated
        }
    }

    private func performAction(_ action: @MainActor () async throws -> ContainerSummary) async {
        isPerformingAction = true
        error = nil
        defer { isPerformingAction = false }
        do {
            container = try await action()
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}
