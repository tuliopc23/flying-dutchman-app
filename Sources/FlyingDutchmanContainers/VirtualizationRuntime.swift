import Foundation
import Virtualization
import Shared
import FlyingDutchmanPersistence
import Logging

public actor VirtualizationRuntime: MachineRuntimeProtocol {
    private let logger = Loggers.make(category: .containers)
    private let machineStore: MachineStore
    private let resourceManager: VMResourceManager
    private let fileSharingManager: FileSharingManager
    private let kernelDownloader: KernelDownloader
    private let sshConfigurator: SSHConfigurator
    private var runningVMs: [String: VZVirtualMachine] = [:]
    private var vmDelegates: [String: VMDelegate] = [:]
    
    public init(
        machineStore: MachineStore? = nil,
        resourceManager: VMResourceManager? = nil,
        fileSharingManager: FileSharingManager? = nil,
        kernelDownloader: KernelDownloader? = nil,
        sshConfigurator: SSHConfigurator? = nil
    ) {
        self.machineStore = machineStore ?? MachineStore()
        self.resourceManager = resourceManager ?? VMResourceManager()
        self.fileSharingManager = fileSharingManager ?? FileSharingManager()
        self.kernelDownloader = kernelDownloader ?? KernelDownloader()
        self.sshConfigurator = sshConfigurator ?? SSHConfigurator()
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
            status: .creating,
            cpuCount: config.cpuCount,
            memoryGB: config.memoryGB,
            diskGB: config.diskGB
        )
        
        // Save to store
        try machineStore.create(machine)
        
        do {
            // Create machine directory
            try await resourceManager.createMachineDirectory(for: machine.id)
            let machineDir = await resourceManager.machineDirectory(for: machine.id)
            
            // Create disk image
            try await resourceManager.createDiskImage(for: machine.id, sizeGB: config.diskGB)
            
            // Generate SSH keys
            let (publicKey, privateKey) = try await sshConfigurator.generateSSHKeyPair(for: machine.id)
            try await sshConfigurator.saveSSHKeys(
                for: machine.id,
                publicKey: publicKey,
                privateKey: privateKey,
                machineDirectory: machineDir
            )
            
            // Create cloud-init user data if provided
            if let cloudInitData = config.cloudInitData {
                let cloudInitPath = machineDir.appendingPathComponent("user-data.yml")
                try cloudInitData.write(to: cloudInitPath, atomically: true, encoding: .utf8)
            } else {
                // Generate default cloud-init with SSH key
                let defaultCloudInit = await sshConfigurator.createCloudInitUserData(
                    sshPublicKey: publicKey,
                    hostname: name
                )
                let cloudInitPath = machineDir.appendingPathComponent("user-data.yml")
                try defaultCloudInit.write(to: cloudInitPath, atomically: true, encoding: .utf8)
            }
            
            // Download kernel and initrd
            let kernelPath = await resourceManager.kernelPath(for: machine.id)
            let initrdPath = await resourceManager.initrdPath(for: machine.id)
            
            do {
                try await kernelDownloader.ensureKernel(
                    for: machine.id,
                    distro: config.distro,
                    version: config.version,
                    targetKernelPath: kernelPath,
                    targetInitrdPath: initrdPath
                )
            } catch {
                logger.warning("Kernel download failed, machine will need manual kernel setup: \(error.localizedDescription)")
            }
            
            // Update status to stopped (ready to start)
            machine.status = .stopped
            try machineStore.update(machine)
            
            logger.info("Machine \(name) created successfully")
            return machine
        } catch {
            // Cleanup on failure
            machine.status = .error
            try? machineStore.update(machine)
            try? await resourceManager.deleteMachineResources(for: machine.id)
            throw MachineError.virtualizationError("Failed to create machine: \(error.localizedDescription)")
        }
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
        
        do {
            // Get resource paths
            let diskPath = await resourceManager.diskPath(for: machine.id)
            let kernelPath = await resourceManager.kernelPath(for: machine.id)
            let initrdPath = await resourceManager.initrdPath(for: machine.id)
            
            // Check if kernel and initrd exist
            let hasKernel = FileManager.default.fileExists(atPath: kernelPath.path)
            let hasInitrd = FileManager.default.fileExists(atPath: initrdPath.path)
            
            // Setup file sharing
            let sharedDirectories = await fileSharingManager.createSharedDirectories(for: machine.id)
            
            // Build VM configuration
            let vmConfig = try VMConfiguration.build(
                machineID: machine.id,
                cpuCount: machine.cpuCount,
                memoryGB: machine.memoryGB,
                diskPath: diskPath,
                kernelPath: hasKernel ? kernelPath : nil,
                initrdPath: hasInitrd ? initrdPath : nil,
                sharedDirectories: sharedDirectories
            )
            
            // Create virtual machine
            let vm = VZVirtualMachine(configuration: vmConfig)
            
            // Create and set delegate
            let delegate = VMDelegate(machineID: machine.id, logger: logger)
            vmDelegates[machine.id] = delegate
            vm.delegate = delegate
            
            // Start the VM
            try await vm.start()
            
            // Store running VM
            runningVMs[machine.id] = vm
            
            // Update machine status
            machine.status = .running
            machine.ipAddress = "192.168.64.2" // TODO: Get actual IP from VM
            machine.sshPort = 22
            try machineStore.update(machine)
            
            logger.info("Machine \(machine.name) started successfully")
            return machine
        } catch {
            machine.status = .error
            try? machineStore.update(machine)
            throw MachineError.virtualizationError("Failed to start machine: \(error.localizedDescription)")
        }
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
        
        // Delete machine resources
        try await resourceManager.deleteMachineResources(for: id)
        
        // Cleanup shared directories
        try await fileSharingManager.cleanupSharedDirectory(for: id)
        
        // Remove from store
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
