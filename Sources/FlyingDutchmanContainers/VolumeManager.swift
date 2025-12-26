import Foundation
import Logging
import Shared

/// Manages named volumes for container storage
public actor VolumeManager {
    private let logger = Loggers.make(category: .containers)
    private let volumeStore: VolumeStore

    /// Storage path for volumes
    private let volumesDir: FilePath

    public init(volumeStore: VolumeStore = VolumeStore()) {
        self.volumeStore = volumeStore
        self.volumesDir = Self.volumesDirectory()

        // Create volumes directory if it doesn't exist
        try? FileManager.default.createDirectory(
            atPath: volumesDir.string,
            withIntermediateDirectories: true
        )
    }

    /// Create a named volume
    /// - Parameters:
    ///   - name: Name of the volume
    ///   - driver: Volume driver (defaults to "local")
    /// - Returns: Created volume summary
    /// - Throws: VolumeError if creation fails
    public func createVolume(name: String, driver: String = "local") throws -> VolumeSummary {
        logger.info("Creating volume '\(name)' with driver '\(driver)'")

        // Check if volume already exists
        if let existing = try? volumeStore.fetch(name: name) {
            logger.warning("Volume '\(name)' already exists")
            return existing
        }

        // Create volume directory
        let volumePath = volumePath(for: name)
        try FileManager.default.createDirectory(atPath: volumePath.string, withIntermediateDirectories: true)

        // Set proper permissions
        try? FileManager.default.setAttributes(
            [FileAttributeKey.posixPermissions: 0o755],
            ofItemAtPath: volumePath.string
        )

        // Create volume record
        let volume = VolumeSummary(
            name: name,
            mountPath: volumePath.string,
            sizeBytes: 0  // Will be calculated on use
        )

        try volumeStore.insert(volume)

        logger.info("Volume '\(name)' created at \(volumePath.string)")
        return volume
    }

    /// Get or create a volume (idempotent)
    /// - Parameters:
    ///   - name: Name of the volume
    ///   - driver: Volume driver (defaults to "local")
    /// - Returns: Volume summary
    /// - Throws: VolumeError if operation fails
    public func getOrCreateVolume(name: String, driver: String = "local") throws -> VolumeSummary {
        if let existing = try? volumeStore.fetch(name: name) {
            return existing
        }

        return try createVolume(name: name, driver: driver)
    }

    /// Remove a named volume
    /// - Parameter name: Name of the volume to remove
    /// - Throws: VolumeError if removal fails
    public func removeVolume(name: String) throws {
        logger.info("Removing volume '\(name)'")

        guard let volume = try volumeStore.fetch(name: name) else {
            throw VolumeError.notFound(name)
        }

        // Check if volume is in use
        // In a real implementation, this would check container references
        // For now, we allow removal

        // Remove volume directory
        let volumePath = volumePath(for: name)
        if FileManager.default.fileExists(atPath: volumePath.string) {
            try FileManager.default.removeItem(atPath: volumePath.string)
        }

        // Remove from database
        try volumeStore.delete(id: volume.id)

        logger.info("Volume '\(name)' removed")
    }

    /// Prune unused volumes
    /// - Returns: Number of volumes removed
    /// - Throws: VolumeError if pruning fails
    public func pruneVolumes() throws -> Int {
        logger.info("Pruning unused volumes")

        let volumes = volumeStore.fetchAll()
        var removedCount = 0

        // In a real implementation, this would check which volumes are attached to containers
        // For now, we'll remove all but the "default" volume
        for volume in volumes {
            if volume.name != "default" {
                try removeVolume(name: volume.name)
                removedCount += 1
            }
        }

        logger.info("Pruned \(removedCount) volumes")
        return removedCount
    }

    /// Inspect a volume
    /// - Parameter name: Name of the volume
    /// - Returns: Detailed volume information
    /// - Throws: VolumeError if volume not found
    public func inspectVolume(name: String) throws -> VolumeInspection {
        guard let volume = try volumeStore.fetch(name: name) else {
            throw VolumeError.notFound(name)
        }

        let volumePath = volumePath(for: name)

        // Calculate volume size
        var totalSize: Int64 = 0
        if let enumerator = FileManager.default.enumerator(atPath: volumePath.string, includingPropertiesForKeys: [.fileSizeKey]) {
            for case let fileURL as URL in enumerator {
                if let resourceValues = try? fileURL.resourceValues(forKeys: [.fileSizeKey]),
                   let fileSize = resourceValues.fileSize {
                    totalSize += Int64(fileSize)
                }
            }
        }

        return VolumeInspection(
            name: volume.name,
            driver: "local",
            mountpoint: volumePath.string,
            createdAt: volume.createdAt,
            sizeBytes: totalSize,
            status: .available
        )
    }

    /// List all volumes
    /// - Returns: Array of volume summaries
    public func listVolumes() -> [VolumeSummary] {
        volumeStore.fetchAll()
    }

    /// Validate a mount specification
    /// - Parameter mount: Mount specification (e.g., "host:container:ro" or "host:container")
    /// - Returns: Parsed mount
    /// - Throws: VolumeError if invalid
    public func validateMount(_ mount: String) throws -> Mount {
        let parts = mount.split(separator: ":", maxSplits: 3).map { String($0) }

        guard parts.count >= 2 else {
            throw VolumeError.invalidMount("Mount must be in format 'host:container' or 'host:container:mode'")
        }

        let hostPath = parts[0]
        let containerPath = parts[1]
        let mode = parts.count >= 3 ? parts[2] : "rw"

        // Validate mode
        guard ["ro", "rw", "z", "Z"].contains(mode) else {
            throw VolumeError.invalidMount("Invalid mount mode: \(mode). Must be ro, rw, z, or Z")
        }

        // Check if host path is a named volume
        let isNamedVolume = !hostPath.contains("/")

        // If not a named volume, validate host path exists
        if !isNamedVolume {
            let expandedPath = NSString(string: hostPath).expandingTildeInPath

            if !FileManager.default.fileExists(atPath: expandedPath) {
                throw VolumeError.mountPathNotFound(hostPath)
            }
        }

        return Mount(
            source: hostPath,
            destination: containerPath,
            mode: mode,
            type: isNamedVolume ? .volume : .bind
        )
    }

    /// Setup a volume for a container
    /// - Parameter mount: Mount specification
    /// - Returns: Actual host path to use
    /// - Throws: VolumeError if setup fails
    public func setupVolume(mount: Mount) throws -> String {
        switch mount.type {
        case .volume:
            // Named volume - ensure it exists
            let volume = try getOrCreateVolume(name: mount.source)
            return volume.mountPath

        case .bind:
            // Bind mount - return expanded path
            return NSString(string: mount.source).expandingTildeInPath
        }
    }

    // MARK: - Private Helpers

    private func volumePath(for name: String) -> FilePath {
        let safeName = name.replacingOccurrences(of: "/", with: "_")
        return volumesDir.appending(safeName)
    }

    /// Get volumes directory path
    private static func volumesDirectory() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!

        let volumesPath = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("volumes")

        return FilePath(volumesPath.path)
    }
}

// MARK: - Supporting Types

public struct Mount: Sendable {
    public let source: String       // Host path or volume name
    public let destination: String  // Container path
    public let mode: String          // ro, rw, etc.
    public let type: MountType

    public enum MountType: Sendable {
        case bind    // Bind mount from host path
        case volume  // Named volume
    }
}

public struct VolumeInspection: Sendable {
    public let name: String
    public let driver: String
    public let mountpoint: String
    public let createdAt: Date
    public let sizeBytes: Int64
    public let status: VolumeStatus

    public enum VolumeStatus: String, Sendable {
        case available
        case inUse
        case error
    }
}

// MARK: - Errors

public enum VolumeError: LocalizedError {
    case notFound(String)
    case invalidMount(String)
    case mountPathNotFound(String)
    case creationFailed(String)
    case removalFailed(String)

    public var errorDescription: String? {
        switch self {
        case let .notFound(name):
            return "Volume '\(name)' not found"
        case let .invalidMount(reason):
            return "Invalid mount: \(reason)"
        case let .mountPathNotFound(path):
            return "Mount path not found: \(path)"
        case let .creationFailed(reason):
            return "Failed to create volume: \(reason)"
        case let .removalFailed(reason):
            return "Failed to remove volume: \(reason)"
        }
    }
}
