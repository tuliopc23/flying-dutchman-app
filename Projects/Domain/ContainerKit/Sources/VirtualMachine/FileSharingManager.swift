import Foundation
import Logging
import Shared
import Virtualization

public actor FileSharingManager {
    private let logger = Loggers.make(category: "flyingdutchman.machines.sharing")

    public init() {}

    public func createSharedDirectories(for machineID: String) -> [VMConfiguration.SharedDirectory] {
        var sharedDirs: [VMConfiguration.SharedDirectory] = []

        // Share user's home directory (read-only by default)
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        sharedDirs.append(VMConfiguration.SharedDirectory(
            hostPath: homeDir,
            guestMountPoint: "/mnt/mac",
            readOnly: false
        ))

        // Create machine-specific shared folder
        let fm = FileManager.default
        let appSupport = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let machineSharedDir = appSupport.appendingPathComponent(
            "flyingdutchman/shared/\(machineID)",
            isDirectory: true
        )

        do {
            try fm.createDirectory(at: machineSharedDir, withIntermediateDirectories: true)
            sharedDirs.append(VMConfiguration.SharedDirectory(
                hostPath: machineSharedDir,
                guestMountPoint: "/mnt/shared",
                readOnly: false
            ))
            logger.info("Created shared directory: \(machineSharedDir.path)")
        } catch {
            logger.error("Failed to create shared directory: \(error.localizedDescription)")
        }

        return sharedDirs
    }

    public func getSharedDirectoryPath(for machineID: String) -> URL {
        let fm = FileManager.default
        let appSupport = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        return appSupport.appendingPathComponent("flyingdutchman/shared/\(machineID)", isDirectory: true)
    }

    public func cleanupSharedDirectory(for machineID: String) throws {
        let sharedDir = getSharedDirectoryPath(for: machineID)
        if FileManager.default.fileExists(atPath: sharedDir.path) {
            try FileManager.default.removeItem(at: sharedDir)
            logger.info("Cleaned up shared directory: \(sharedDir.path)")
        }
    }
}
