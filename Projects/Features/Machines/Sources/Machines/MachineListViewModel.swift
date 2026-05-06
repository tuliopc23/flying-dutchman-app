import Dependencies
import DesignSystem
import Shared
import SwiftUI

@MainActor
@Observable
public final class MachineListViewModel {
    public var machines: [Machine] = []
    public var error: String?
    public var isLoading: Bool = false
    public var searchQuery: String = ""
    public var showRunningOnly: Bool = false
    public var showCreateSheet: Bool = false

    private let client: MachinesEngineClient

    public init() {
        client = .live
    }

    init(client: MachinesEngineClient) {
        self.client = client
    }

    public var filtered: [Machine] {
        machines.filter { machine in
            let matchesQuery: Bool
            if searchQuery.isEmpty {
                matchesQuery = true
            } else {
                let needle = searchQuery.lowercased()
                matchesQuery = machine.name.lowercased().contains(needle)
                    || machine.distro.lowercased().contains(needle)
            }
            let matchesStatus = !showRunningOnly || machine.status == .running
            return matchesQuery && matchesStatus
        }
    }

    public func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            machines = try await client.listMachines()
        } catch {
            machines = []
            self.error = "Failed to load machines: \(error.localizedDescription)"
        }
    }

    public func start(_ machine: Machine) async {
        await mutate(machine) { id in
            try await self.client.startMachine(id)
        }
    }

    public func stop(_ machine: Machine) async {
        await mutate(machine) { id in
            try await self.client.stopMachine(id)
        }
    }

    public func restart(_ machine: Machine) async {
        await mutate(machine) { id in
            try await self.client.restartMachine(id)
        }
    }

    public func delete(_ machine: Machine) async {
        isLoading = true
        defer { isLoading = false }
        do {
            try await client.deleteMachine(machine.id)
            machines.removeAll { $0.id == machine.id }
        } catch {
            self.error = "Delete failed: \(error.localizedDescription)"
        }
    }

    public func create(name: String, config: MachineConfig) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let created = try await client.createMachine(name, config)
            machines.append(created)
        } catch {
            self.error = "Create failed: \(error.localizedDescription)"
        }
    }

    private func mutate(
        _ machine: Machine,
        action: @escaping (String) async throws -> Machine
    ) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let updated = try await action(machine.id)
            if let index = machines.firstIndex(where: { $0.id == updated.id }) {
                machines[index] = updated
            }
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}
