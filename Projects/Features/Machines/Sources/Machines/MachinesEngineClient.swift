import FlyingDutchmanNetworking
import Shared

struct MachinesEngineClient {
    var listMachines: @Sendable () async throws -> [Machine]
    var createMachine: @Sendable (_ name: String, _ config: MachineConfig) async throws -> Machine
    var startMachine: @Sendable (_ id: String) async throws -> Machine
    var stopMachine: @Sendable (_ id: String) async throws -> Machine
    var restartMachine: @Sendable (_ id: String) async throws -> Machine
    var deleteMachine: @Sendable (_ id: String) async throws -> Void

    static let live = Self(
        listMachines: { try await EngineClient.listMachines() },
        createMachine: { name, config in
            try await EngineClient.createMachine(name: name, config: config)
        },
        startMachine: { id in try await EngineClient.startMachine(nameOrID: id) },
        stopMachine: { id in try await EngineClient.stopMachine(nameOrID: id) },
        restartMachine: { id in try await EngineClient.restartMachine(nameOrID: id) },
        deleteMachine: { id in try await EngineClient.deleteMachine(nameOrID: id) }
    )
}
