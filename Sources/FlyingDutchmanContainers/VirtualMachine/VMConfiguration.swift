import Foundation
import Virtualization

public struct VMConfiguration {
    let machineID: String
    let cpuCount: Int
    let memorySize: UInt64
    let diskPath: URL
    let kernelPath: URL?
    let initrdPath: URL?
    let sharedDirectories: [SharedDirectory]
    
    public struct SharedDirectory: Sendable {
        public let hostPath: URL
        public let guestMountPoint: String
        public let readOnly: Bool
        
        public init(hostPath: URL, guestMountPoint: String, readOnly: Bool) {
            self.hostPath = hostPath
            self.guestMountPoint = guestMountPoint
            self.readOnly = readOnly
        }
    }
    
    public static func build(
        machineID: String,
        cpuCount: Int,
        memoryGB: Int,
        diskPath: URL,
        kernelPath: URL? = nil,
        initrdPath: URL? = nil,
        sharedDirectories: [SharedDirectory] = []
    ) throws -> VZVirtualMachineConfiguration {
        let config = VZVirtualMachineConfiguration()
        
        // CPU configuration
        config.cpuCount = cpuCount
        
        // Memory configuration
        config.memorySize = UInt64(memoryGB) * 1024 * 1024 * 1024
        
        // Boot loader - Linux kernel boot
        if let kernelPath = kernelPath, let initrdPath = initrdPath {
            let bootloader = VZLinuxBootLoader(kernelURL: kernelPath)
            bootloader.initialRamdiskURL = initrdPath
            bootloader.commandLine = "console=hvc0 root=/dev/vda rw"
            config.bootLoader = bootloader
        }
        
        // Storage - virtio block device
        let diskAttachment = try VZDiskImageStorageDeviceAttachment(
            url: diskPath,
            readOnly: false
        )
        let blockDevice = VZVirtioBlockDeviceConfiguration(attachment: diskAttachment)
        config.storageDevices = [blockDevice]
        
        // Network - virtio network device with NAT
        let networkDevice = VZVirtioNetworkDeviceConfiguration()
        networkDevice.attachment = VZNATNetworkDeviceAttachment()
        config.networkDevices = [networkDevice]
        
        // Entropy (random number generator)
        config.entropyDevices = [VZVirtioEntropyDeviceConfiguration()]
        
        // Serial console
        let serialConfig = VZVirtioConsoleDeviceSerialPortConfiguration()
        let consoleAttachment = VZFileHandleSerialPortAttachment(
            fileHandleForReading: FileHandle.standardInput,
            fileHandleForWriting: FileHandle.standardOutput
        )
        serialConfig.attachment = consoleAttachment
        config.serialPorts = [serialConfig]
        
        // File sharing - virtiofs
        if !sharedDirectories.isEmpty {
            var sharingDevices: [VZDirectorySharingDeviceConfiguration] = []
            
            for sharedDir in sharedDirectories {
                let share = VZSingleDirectoryShare(directory: VZSharedDirectory(url: sharedDir.hostPath, readOnly: sharedDir.readOnly))
                let tag = VZVirtioFileSystemDeviceConfiguration.macOSGuestAutomountTag
                let sharingDevice = VZVirtioFileSystemDeviceConfiguration(tag: tag)
                sharingDevice.share = share
                sharingDevices.append(sharingDevice)
            }
            
            config.directorySharingDevices = sharingDevices
        }
        
        // Validate configuration
        try config.validate()
        
        return config
    }
}
