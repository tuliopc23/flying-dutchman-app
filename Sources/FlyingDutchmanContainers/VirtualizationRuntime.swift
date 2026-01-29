import Foundation
import Virtualization
import Shared
import FlyingDutchmanPersistence
import Logging

public actor VirtualizationRuntime: MachineRuntimeProtocol {
    private let logger = Loggers.make(category: .containers)
    private let machineStore: MachineStore
    private var runningVMs: [String: VZVirtualMachine] = [:]
    
    public init(machineStore: MachineStore? = nil) {
        self.machineStore = machineStore ?? MachineStore()
    }
    
    public func createMachine(name: String, config: MachineConfig) async throws -> Machine {
        logger.info("Creating machine: \(name) with \(config.distro):\(config.version)")
        
        // Validate distro
        guard MachineDistro(rawValue: config.distro) != nil else {
            throw MachineError.unsupportedDistro(config.distro)
        }
        
        // Create machine record
        var machine = Machine(
            name: name,
            distro: config.distro,
            version: config.version,
            status: .stopped,
            cpuCount: config.cpuCount,
            memoryGB: config.memoryGB,
            diskGB: config.diskGB
        )
        
        // Save to store
        try machineStore.create(machine)
        
        // TODO: Download/prepare disk image
        // TODO: Setup virtiofs for file sharing
        // TODO: Configure SSH keys
        
        logger.info("Machine \(name) created successfully")
        return machine
    }
    
    public func startMachine(id: String) async throws -> Machine {
        guard var machine = try machineStore.fetch(id: id) else {
            throw MachineError.machineNotFound(id)
        }
        
        guard machine.status != .running else {
            throw MachineError.machineAlreadyRunning(id)
        }
        
        logger.info("Starting machine: \(machine.name)")
        
        // Update status to starting
        machine.status = .starting
        try machineStore.update(machine)
        
        // TODO: Create VZVirtualMachineConfiguration
        // TODO: Setup networking
        // TODO: Setup file sharing
        // TODO: Start VM
        
        // For now, simulate successful start
        machine.status = .running
        machine.ipAddress = "192.168.64.2" // Placeholder
        machine.sshPort = 22
        try machineStore.update(machine)
        
        logger.info("Machine \(machine.name) started successfully")
        return machine
    }
    
    public func stopMachine(id: String) async throws -> Machine {
        guard var machine = try machineStore.fetch(id: id) else {
            throw MachineError.machineNotFound(id)
        }
        
        guard machine.status == .running else {
            throw MachineError.machineNotRunning(id)
        }
        
        logger.info("Stopping machine: \(machine.name)")
        
        machine.status = .stopping
        try machineStore.update(machine)
        
        // Stop the VM if running
        if let vm = runningVMs[id] {
            try await vm.stop()
            runningVMs.removeValue(forKey: id)
        }
        
        machine.status = .stopped
        machine.ipAddress = nil
        try machineStore.update(machine)
        
        logger.info("Machine \(machine.name) stopped successfully")
        return machine
    }
    
    public func restartMachine(id: String) async throws -> Machine {
        _ = try await stopMachine(id: id)
        return try await startMachine(id: id)
    }
    
    public func deleteMachine(id: String) async throws {
        guard let machine = try machineStore.fetch(id: id) else {
            throw MachineError.machineNotFound(id)
        }
        
        // Stop if running
        if machine.status == .running {
            _ = try await stopMachine(id: id)
        }
        
        logger.info("Deleting machine: \(machine.name)")
        
        // TODO: Delete disk images and configuration files
        
        try machineStore.delete(id: id)
        
        logger.info("Machine \(machine.name) deleted successfully")
    }
    
    public func listMachines() async throws -> [Machine] {
        try machineStore.fetchAll()
    }
    
    public func getMachine(id: String) async throws -> Machine? {
        try machineStore.fetch(id: id)
    }
    
    public func executeCommand(machineID: String, command: String) async throws -> String {
        guard let machine = try machineStore.fetch(id: machineID) else {
            throw MachineError.machineNotFound(machineID)
        }
        
        guard machine.status == .running else {
            throw MachineError.machineNotRunning(machineID)
        }
        
        logger.info("Executing command in machine \(machine.name): \(command)")
        
        // TODO: Implement command execution via SSH or guest agent
        throw MachineError.commandExecutionFailed("Command execution not yet implemented")
    }
}
