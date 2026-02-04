import Foundation
import Shared

public protocol MachineRuntimeProtocol: Sendable {
    func createMachine(name: String, config: MachineConfig) async throws -> Machine
    func startMachine(id: String) async throws -> Machine
    func stopMachine(id: String) async throws -> Machine
    func restartMachine(id: String) async throws -> Machine
    func deleteMachine(id: String) async throws
    func listMachines() async throws -> [Machine]
    func getMachine(id: String) async throws -> Machine?
    func executeCommand(machineID: String, command: String) async throws -> String
}

public enum MachineError: Error, Sendable {
    case machineNotFound(String)
    case machineAlreadyRunning(String)
    case machineNotRunning(String)
    case invalidConfiguration(String)
    case virtualizationError(String)
    case commandExecutionFailed(String)
    case unsupportedDistro(String)
}
