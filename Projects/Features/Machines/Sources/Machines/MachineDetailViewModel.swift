import FlyingDutchmanNetworking
import Foundation
import Observation
import Shared

@MainActor
@Observable
final class MachineDetailViewModel {
    var machine: Machine
    var error: String?
    var isPerformingAction: Bool = false
    private let client: MachinesEngineClient

    init(machine: Machine, client: MachinesEngineClient = .live) {
        self.machine = machine
        self.client = client
    }

    func start() async {
        await performAction { try await self.client.startMachine(self.machine.id) }
    }

    func stop() async {
        await performAction { try await self.client.stopMachine(self.machine.id) }
    }

    func restart() async {
        await performAction { try await self.client.restartMachine(self.machine.id) }
    }

    func delete() async {
        isPerformingAction = true
        defer { isPerformingAction = false }
        do {
            try await client.deleteMachine(machine.id)
        } catch {
            self.error = "Delete failed: \(error.localizedDescription)"
        }
    }

    private func performAction(_ action: @MainActor () async throws -> Machine) async {
        isPerformingAction = true
        error = nil
        defer { isPerformingAction = false }
        do {
            machine = try await action()
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}
