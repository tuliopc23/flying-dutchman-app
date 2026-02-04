import Foundation
import Logging
import Shared

public actor VMResourceManager {
    private let logger = Loggers.make(category: "flyingdutchman.machines")
    private let baseDirectory: URL

    public init(baseDirectory: URL? = nil) {
        if let baseDirectory {
            self.baseDirectory = baseDirectory
        } else {
            let fm = FileManager.default
            let appSupport = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm
                .temporaryDirectory
            self.baseDirectory = appSupport.appendingPathComponent("flyingdutchman/machines", isDirectory: true)
        }

        try? FileManager.default.createDirectory(at: self.baseDirectory, withIntermediateDirectories: true)
    }

    func machineDirectory(for machineID: String) -> URL {
        baseDirectory.appendingPathComponent(machineID, isDirectory: true)
    }

    func diskPath(for machineID: String) -> URL {
        machineDirectory(for: machineID).appendingPathComponent("disk.img")
    }

    func kernelPath(for machineID: String) -> URL {
        machineDirectory(for: machineID).appendingPathComponent("vmlinuz")
    }

    func initrdPath(for machineID: String) -> URL {
        machineDirectory(for: machineID).appendingPathComponent("initrd.img")
    }

    func createMachineDirectory(for machineID: String) throws {
        let dir = machineDirectory(for: machineID)
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        logger.info("Created machine directory: \(dir.path)")
    }

    func createDiskImage(for machineID: String, sizeGB: Int) throws {
        let diskPath = diskPath(for: machineID)
        let sizeBytes = UInt64(sizeGB) * 1024 * 1024 * 1024

        // Create sparse disk image
        FileManager.default.createFile(atPath: diskPath.path, contents: nil)
        let fileHandle = try FileHandle(forWritingTo: diskPath)
        try fileHandle.truncate(atOffset: sizeBytes)
        try fileHandle.close()

        logger.info("Created disk image: \(diskPath.path) (\(sizeGB)GB)")
    }

    func deleteMachineResources(for machineID: String) throws {
        let dir = machineDirectory(for: machineID)
        if FileManager.default.fileExists(atPath: dir.path) {
            try FileManager.default.removeItem(at: dir)
            logger.info("Deleted machine resources: \(dir.path)")
        }
    }

    func machineExists(for machineID: String) -> Bool {
        let dir = machineDirectory(for: machineID)
        return FileManager.default.fileExists(atPath: dir.path)
    }

    /// Placeholder for future kernel/initrd download functionality
    func ensureKernelAndInitrd(for machineID: String, distro _: String, version _: String) async throws {
        let kernelPath = kernelPath(for: machineID)
        let initrdPath = initrdPath(for: machineID)

        // For now, we'll expect these to be provided or use a stub
        // In a full implementation, this would download from Ubuntu/Debian repos
        if !FileManager.default.fileExists(atPath: kernelPath.path) {
            logger.warning("Kernel not found at \(kernelPath.path). VM creation will use default boot.")
        }

        if !FileManager.default.fileExists(atPath: initrdPath.path) {
            logger.warning("Initrd not found at \(initrdPath.path). VM creation will use default boot.")
        }
    }
}
