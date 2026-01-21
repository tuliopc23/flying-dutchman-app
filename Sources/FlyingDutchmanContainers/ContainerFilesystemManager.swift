import Foundation
import Containerization
import Logging

/// Manages filesystem exposure for running containers
///
/// This actor exposes container rootfs at `~/FlyingDutchman/containers/<id>/rootfs/`
/// to allow Finder browsing of running container filesystems.
///
/// ## Implementation Strategy
///
/// The Apple Containerization framework uses virtiofs to share the container's rootfs
/// with the host. Since the VM runs in a contained environment, we need to:
///
/// 1. **For running containers**: Create a symbolic link to the virtiofs mount point
///    if the framework exposes it, OR use a FUSE-like approach to mirror the filesystem.
///
/// 2. **Fallback**: If direct filesystem access isn't available, we document this
///    as a limitation and defer to Phase 2 (potentially using VSOCK to stream files).
///
/// ## Current Limitations
///
/// - The Containerization framework does not expose a direct API to access the container's
///   rootfs from the host. The VM's filesystem is isolated inside the VM.
/// - Potential solutions for future phases:
///   - VSOCK-based file server inside guest (vminitd extension)
///   - macFUSE integration to mount remote filesystem
///   - File extraction via container export (like `docker export`)
///
/// For Phase 1, we create the directory structure but mark rootfs as "not accessible"
/// until a proper solution is implemented.
public actor ContainerFilesystemManager {
    private let logger = Logger(label: "com.flyingdutchman.filesystem")
    private let baseDirectory: URL
    
    /// Initialize manager with base directory for container filesystems
    /// - Parameter baseDirectory: Base path for all container filesystems
    public init(baseDirectory: URL) {
        self.baseDirectory = baseDirectory
        createBaseDirectory()
    }
    
    /// Convenience initializer using default ~/FlyingDutchman/containers/ path
    public init() {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        self.baseDirectory = homeDir
            .appendingPathComponent("FlyingDutchman")
            .appendingPathComponent("containers")
        createBaseDirectory()
    }
    
    // MARK: - Public API
    
    /// Expose container rootfs at ~/FlyingDutchman/containers/<id>/rootfs/
    ///
    /// **Current Implementation**: Creates directory structure and placeholder file
    /// explaining that direct rootfs access is not yet available.
    ///
    /// **Future Implementation**: Will mount or symlink actual container filesystem
    /// when Containerization framework support is added or VSOCK file server is implemented.
    ///
    /// - Parameters:
    ///   - containerId: UUID of the container
    ///   - container: LinuxContainer instance (currently unused, reserved for future)
    /// - Returns: URL to the rootfs directory
    /// - Throws: If directory creation fails
    public func exposeRootfs(containerId: UUID, container: LinuxContainer) async throws -> URL {
        let containerDir = baseDirectory.appendingPathComponent(containerId.uuidString)
        let rootfsDir = containerDir.appendingPathComponent("rootfs")
        
        // Create directory structure
        try FileManager.default.createDirectory(
            at: rootfsDir,
            withIntermediateDirectories: true
        )
        
        // PHASE 1 LIMITATION: Direct rootfs access not available
        // Create a README explaining the limitation
        let readmePath = rootfsDir.appendingPathComponent("README.txt")
        let readmeContent = """
        Flying Dutchman - Container Filesystem Access
        
        This directory is reserved for container rootfs access.
        
        CURRENT STATUS: Not yet implemented
        
        The Apple Containerization framework does not expose a direct API
        to access the container's filesystem from the host. The container's
        files are isolated inside the Linux VM.
        
        PLANNED SOLUTIONS:
        - VSOCK-based file server (Phase 2)
        - macFUSE integration for remote mounting
        - Container export/import functionality
        
        For now, you can:
        1. Use `fd exec <container> /bin/sh` to access files interactively
        2. Use `fd cp <container>:<path> <host-path>` to copy files (planned)
        3. Export the container as a tar archive (planned)
        
        Container ID: \(containerId)
        Created: \(Date())
        """
        
        try readmeContent.write(to: readmePath, atomically: true, encoding: .utf8)
        
        logger.info("Created rootfs directory structure", metadata: [
            "container": .string(containerId.uuidString),
            "path": .string(rootfsDir.path)
        ])
        
        // TODO: When Containerization framework support is available:
        // - Check if container exposes filesystem handle
        // - Create symlink or mount point
        // - Handle permissions (containers run as root)
        
        return rootfsDir
    }
    
    /// Unmount or remove rootfs exposure
    ///
    /// **Current Implementation**: Removes the rootfs directory entirely.
    ///
    /// **Future Implementation**: Will properly unmount filesystem when mounting is supported.
    ///
    /// - Parameter containerId: UUID of the container
    /// - Throws: If removal fails
    public func unmountRootfs(containerId: UUID) async throws {
        let containerDir = baseDirectory.appendingPathComponent(containerId.uuidString)
        let rootfsDir = containerDir.appendingPathComponent("rootfs")
        
        guard FileManager.default.fileExists(atPath: rootfsDir.path) else {
            logger.debug("Rootfs directory does not exist, nothing to unmount", metadata: [
                "container": .string(containerId.uuidString)
            ])
            return
        }
        
        // TODO: When mounting is implemented:
        // - Check if directory is a mount point
        // - Unmount before removing
        // - Handle busy mount errors gracefully
        
        try FileManager.default.removeItem(at: rootfsDir)
        
        logger.info("Removed rootfs directory", metadata: [
            "container": .string(containerId.uuidString),
            "path": .string(rootfsDir.path)
        ])
    }
    
    /// Get rootfs path if exposed
    ///
    /// - Parameter containerId: UUID of the container
    /// - Returns: URL to rootfs directory if it exists, nil otherwise
    public func getRootfsPath(containerId: UUID) -> URL? {
        let containerDir = baseDirectory.appendingPathComponent(containerId.uuidString)
        let rootfsDir = containerDir.appendingPathComponent("rootfs")
        
        guard FileManager.default.fileExists(atPath: rootfsDir.path) else {
            return nil
        }
        
        return rootfsDir
    }
    
    /// Check if rootfs is exposed for a container
    ///
    /// - Parameter containerId: UUID of the container
    /// - Returns: true if rootfs directory exists
    public func isRootfsExposed(containerId: UUID) -> Bool {
        getRootfsPath(containerId: containerId) != nil
    }
    
    // MARK: - Private Helpers
    
    private func createBaseDirectory() {
        do {
            try FileManager.default.createDirectory(
                at: baseDirectory,
                withIntermediateDirectories: true
            )
            logger.debug("Ensured base directory exists", metadata: [
                "path": .string(baseDirectory.path)
            ])
        } catch {
            logger.error("Failed to create base directory", metadata: [
                "path": .string(baseDirectory.path),
                "error": .string(error.localizedDescription)
            ])
        }
    }
}

// MARK: - Future Implementation Notes

/*
 ## Research Notes for Future Implementation
 
 ### Option 1: VSOCK File Server
 - Extend vminitd to serve filesystem over VSOCK
 - Implement host-side client to mirror files on demand
 - Pros: No special privileges needed, works with any container
 - Cons: Latency, not a true mount
 
 ### Option 2: macFUSE Integration
 - Use macFUSE to create a FUSE filesystem driver
 - FUSE driver fetches files via VSOCK
 - Pros: Native mount, works with Finder, Spotlight, etc.
 - Cons: Requires kernel extension, complexity
 
 ### Option 3: Container Export
 - Like `docker export`: tar the entire rootfs
 - Extract to ~/FlyingDutchman/containers/<id>/rootfs/
 - Pros: Simple, no runtime dependencies
 - Cons: Not live, potentially large, slow
 
 ### Option 4: VM Snapshot Access
 - If Virtualization framework exposes disk image
 - Mount disk image read-only on host
 - Pros: Direct access, fast
 - Cons: May not be supported, read-only
 
 ### Recommendation
 Start with Option 1 (VSOCK File Server) in Phase 2, as it's the most practical
 and doesn't require kernel extensions or snapshots.
 */
