import FlyingDutchmanNetworking
import Foundation
import Shared

struct KubernetesEngineClient {
    var listMachines: @Sendable () async throws -> [Machine]
    var listContainers: @Sendable () async throws -> [ContainerSummary]
    var createMachine: @Sendable (_ name: String, _ config: MachineConfig) async throws -> Machine
    var createContainer: @Sendable (_ name: String, _ image: String, _ config: ContainerConfig) async throws
        -> ContainerSummary
    var startMachine: @Sendable (_ id: String) async throws -> Machine
    var startContainer: @Sendable (_ id: UUID) async throws -> ContainerSummary
    var stopMachine: @Sendable (_ id: String) async throws -> Machine
    var stopContainer: @Sendable (_ id: UUID) async throws -> ContainerSummary
    var deleteMachine: @Sendable (_ id: String) async throws -> Void
    var removeContainer: @Sendable (_ id: UUID) async throws -> Void
    var executeMachineCommand: @Sendable (_ id: String, _ command: String) async throws -> String

    static let live = Self(
        listMachines: { try await EngineClient.listMachines() },
        listContainers: { try await EngineClient.listContainers() },
        createMachine: { name, config in
            try await EngineClient.createMachine(name: name, config: config)
        },
        createContainer: { name, image, config in
            try await EngineClient.createContainer(name: name, image: image, config: config)
        },
        startMachine: { id in try await EngineClient.startMachine(nameOrID: id) },
        startContainer: { id in try await EngineClient.startContainer(id: id) },
        stopMachine: { id in try await EngineClient.stopMachine(nameOrID: id) },
        stopContainer: { id in try await EngineClient.stopContainer(id: id) },
        deleteMachine: { id in try await EngineClient.deleteMachine(nameOrID: id) },
        removeContainer: { id in try await EngineClient.removeContainer(id: id) },
        executeMachineCommand: { id, command in
            try await EngineClient.executeMachineCommand(nameOrID: id, command: command)
        }
    )
}
