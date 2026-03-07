import Foundation
import Shared
import Testing
@testable import Machines

@MainActor
@Suite("Machine List ViewModel Tests")
struct MachineListViewModelTests {
    @Test("load surfaces failures and clears stale machine state")
    func loadSurfacesFailures() async {
        let existing = Machine(name: "stale", distro: "ubuntu", version: "24.04")
        let viewModel = MachineListViewModel(client: .stub(
            listMachines: { throw TestFailure.listFailed }
        ))
        viewModel.machines = [existing]

        await viewModel.load()

        #expect(viewModel.machines.isEmpty)
        #expect(viewModel.error == "Failed to load machines: list failed")
        #expect(!viewModel.isLoading)
    }

    @Test("create appends the created machine")
    func createAppendsCreatedMachine() async {
        let created = Machine(name: "builder", distro: "ubuntu", version: "24.04", status: .creating)
        let viewModel = MachineListViewModel(client: .stub(
            createMachine: { _, _ in created }
        ))

        await viewModel.create(name: "builder", config: MachineConfig(distro: "ubuntu", version: "24.04"))

        #expect(viewModel.machines == [created])
        #expect(viewModel.error == nil)
        #expect(!viewModel.isLoading)
    }

    @Test("start updates an existing machine entry")
    func startUpdatesExistingMachine() async {
        let machine = Machine(id: "vm-1", name: "vm-1", distro: "ubuntu", version: "24.04", status: .stopped)
        let running = Machine(id: machine.id, name: machine.name, distro: machine.distro, version: machine.version, status: .running)

        let viewModel = MachineListViewModel(client: .stub(
            startMachine: { id in
                #expect(id == machine.id)
                return running
            }
        ))
        viewModel.machines = [machine]

        await viewModel.start(machine)

        #expect(viewModel.machines == [running])
        #expect(viewModel.error == nil)
        #expect(!viewModel.isLoading)
    }
}

private extension MachinesEngineClient {
    static func stub(
        listMachines: @Sendable @escaping () async throws -> [Machine] = { [] },
        createMachine: @Sendable @escaping (_ name: String, _ config: MachineConfig) async throws -> Machine = { name, config in
            Machine(name: name, distro: config.distro, version: config.version, status: .creating)
        },
        startMachine: @Sendable @escaping (_ id: String) async throws -> Machine = { id in
            Machine(id: id, name: id, distro: "ubuntu", version: "24.04", status: .running)
        },
        stopMachine: @Sendable @escaping (_ id: String) async throws -> Machine = { id in
            Machine(id: id, name: id, distro: "ubuntu", version: "24.04", status: .stopped)
        },
        restartMachine: @Sendable @escaping (_ id: String) async throws -> Machine = { id in
            Machine(id: id, name: id, distro: "ubuntu", version: "24.04", status: .running)
        },
        deleteMachine: @Sendable @escaping (_ id: String) async throws -> Void = { _ in }
    ) -> Self {
        Self(
            listMachines: listMachines,
            createMachine: createMachine,
            startMachine: startMachine,
            stopMachine: stopMachine,
            restartMachine: restartMachine,
            deleteMachine: deleteMachine
        )
    }
}

private enum TestFailure: LocalizedError {
    case listFailed

    var errorDescription: String? {
        switch self {
        case .listFailed:
            "list failed"
        }
    }
}