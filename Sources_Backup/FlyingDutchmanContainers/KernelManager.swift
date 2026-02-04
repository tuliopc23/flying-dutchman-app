import Foundation
import Logging
import AsyncHTTPClient
import Shared
import SystemPackage

/// Manager for downloading and managing Linux kernels for container VMs
public actor KernelManager {
    private let logger = Loggers.make(category: .containers)
    private let httpClient: HTTPClient

    /// GitHub repository for kernel releases
    private let githubRepo = "apple/containerization"

    /// Default kernel version to use
    private let defaultKernelVersion = "1.0.0"

    /// Default initfs reference
    private let defaultInitfsReference = "ghcr.io/apple/containerization/vminit:0.13.0"

    /// Storage path for kernels
    private let kernelsDir: FilePath
    
    /// Path where ContainerizationClient expects the default kernel
    private let defaultKernelSymlinkPath: FilePath

    public init() {
        self.httpClient = HTTPClient(eventLoopGroupProvider: .singleton)
        self.kernelsDir = KernelManager.kernelsDirectory()
        self.defaultKernelSymlinkPath = FilePath(ContainerizationClient.kernelPath.path)

        // Create kernels directory if it doesn't exist
        try? FileManager.default.createDirectory(
            atPath: kernelsDir.string,
            withIntermediateDirectories: true
        )
        
        // Ensure the kernel parent directory exists for the symlink
        let kernelParentDir = ContainerizationClient.kernelPath.deletingLastPathComponent()
        try? FileManager.default.createDirectory(
            at: kernelParentDir,
            withIntermediateDirectories: true
        )
    }

    /// Download kernel for the specified version
    /// - Parameter version: Kernel version to download (defaults to latest if nil)
    /// - Returns: Path to downloaded kernel
    /// - Throws: KernelError if download fails
    public func downloadKernel(version: String? = nil) async throws -> FilePath {
        let kernelVersion = version ?? defaultKernelVersion
        logger.info("Downloading kernel version \(kernelVersion)")

        let kernelPath = kernelPath(for: kernelVersion)

        // Check if kernel already exists
        if FileManager.default.fileExists(atPath: kernelPath.string) {
            logger.info("Kernel \(kernelVersion) already exists at \(kernelPath.string)")
            return kernelPath
        }

        // Fetch release info from GitHub
        let releaseInfo = try await fetchReleaseInfo(version: kernelVersion)

        // Download kernel asset
        guard let assetURL = releaseInfo.assetURL else {
            throw KernelError.downloadFailed("No kernel asset found for version \(kernelVersion)")
        }

        logger.info("Downloading kernel from \(assetURL)")

        let request = try HTTPClient.Request(url: assetURL)
        let response = try await httpClient.execute(request: request).get()

        guard response.status == .ok else {
            throw KernelError.downloadFailed("HTTP \(response.status.code) when downloading kernel")
        }

        guard let body = response.body else {
            throw KernelError.downloadFailed("Empty response when downloading kernel")
        }

        let kernelData = body.getData(at: 0, length: body.readableBytes) ?? Data()
        try kernelData.write(to: URL(fileURLWithPath: kernelPath.string))

        // Set executable permissions
        try? FileManager.default.setAttributes(
            [FileAttributeKey.posixPermissions: 0o755],
            ofItemAtPath: kernelPath.string
        )
        
        // Create/update symlink at default kernel location for ContainerizationClient
        try updateDefaultKernelSymlink(to: kernelPath)

        logger.info("Kernel \(kernelVersion) downloaded successfully to \(kernelPath.string)")
        return kernelPath
    }
    
    /// Update the default kernel symlink to point to a specific kernel version
    /// - Parameter kernelPath: Path to the kernel to make default
    /// - Throws: Error if symlink creation fails
    private func updateDefaultKernelSymlink(to kernelPath: FilePath) throws {
        let symlinkPath = defaultKernelSymlinkPath.string
        
        // Remove existing symlink or file if it exists
        if FileManager.default.fileExists(atPath: symlinkPath) {
            try FileManager.default.removeItem(atPath: symlinkPath)
        }
        
        // Create symlink
        try FileManager.default.createSymbolicLink(
            atPath: symlinkPath,
            withDestinationPath: kernelPath.string
        )
        
        logger.info("Updated default kernel symlink: \(symlinkPath) -> \(kernelPath.string)")
        
        // Refresh ContainerizationClient availability
        ContainerizationClient.shared.refresh()
    }

    /// Get the default kernel path (symlink location expected by ContainerizationClient)
    /// - Returns: Path to the default kernel
    /// - Throws: KernelError if kernel not found
    public func getDefaultKernel() throws -> FilePath {
        // First check the symlink location (preferred)
        if FileManager.default.fileExists(atPath: defaultKernelSymlinkPath.string) {
            return defaultKernelSymlinkPath
        }
        
        // Fall back to versioned kernel if symlink doesn't exist
        let kernelPath = kernelPath(for: defaultKernelVersion)
        guard FileManager.default.fileExists(atPath: kernelPath.string) else {
            throw KernelError.notFound("Default kernel not found. Please run: dutchman kernel download")
        }
        
        // Create symlink for next time
        try? updateDefaultKernelSymlink(to: kernelPath)

        return defaultKernelSymlinkPath
    }

    /// Get the initfs reference for image pulling
    /// - Returns: The initfs Docker image reference
    public func getInitfsReference() -> String {
        return defaultInitfsReference
    }

    /// List available kernel versions
    /// - Returns: Array of kernel version strings
    public func listKernels() -> [String] {
        guard let contents = try? FileManager.default.contentsOfDirectory(atPath: kernelsDir.string) else {
            return []
        }

        return contents.filter { $0.hasSuffix("vmlinux") || $0.hasSuffix("vmlinuz") }
            .map { $0.replacingOccurrences(of: "vmlinux-", with: "")
                     .replacingOccurrences(of: "vmlinuz-", with: "")
                     .replacingOccurrences(of: ".vmlinux", with: "")
                     .replacingOccurrences(of: ".vmlinuz", with: "") }
            .sorted()
    }

    /// Validate kernel file integrity
    /// - Parameter version: Kernel version to validate
    /// - Returns: true if valid, false otherwise
    public func validateKernel(version: String) -> Bool {
        let kernelPath = kernelPath(for: version)

        guard FileManager.default.fileExists(atPath: kernelPath.string) else {
            return false
        }

        let attributes = try? FileManager.default.attributesOfItem(atPath: kernelPath.string)
        guard let fileSize = attributes?[.size] as? UInt64 else {
            return false
        }

        // Minimum kernel size check (at least 1MB)
        if fileSize < 1_048_576 {
            logger.error("Kernel file too small: \(fileSize) bytes")
            return false
        }

        logger.debug("Kernel \(version) validated successfully (size: \(fileSize) bytes)")
        return true
    }

    /// Delete a kernel version
    /// - Parameter version: Kernel version to delete
    /// - Throws: KernelError if deletion fails
    public func deleteKernel(version: String) throws {
        let kernelPath = kernelPath(for: version)

        guard FileManager.default.fileExists(atPath: kernelPath.string) else {
            throw KernelError.notFound("Kernel version \(version) not found")
        }

        try FileManager.default.removeItem(atPath: kernelPath.string)
        logger.info("Kernel version \(version) deleted")
    }

    // MARK: - Private Helpers

    private func kernelPath(for version: String) -> FilePath {
        let filename = "vmlinux-\(version)"
        return kernelsDir.appending(filename)
    }

    private func fetchReleaseInfo(version: String) async throws -> KernelReleaseInfo {
        let url: String
        if version.lowercased() == "latest" {
            url = "https://api.github.com/repos/\(githubRepo)/releases/latest"
        } else {
            url = "https://api.github.com/repos/\(githubRepo)/releases/tags/v\(version)"
        }

        logger.debug("Fetching release info from \(url)")

        var request = try HTTPClient.Request(url: url)
        request.headers.add(name: "Accept", value: "application/vnd.github.v3+json")

        let response = try await httpClient.execute(request: request).get()

        guard response.status == .ok else {
            throw KernelError.downloadFailed("HTTP \(response.status.code) when fetching release info")
        }

        guard let body = response.body else {
            throw KernelError.downloadFailed("Empty response when fetching release info")
        }

        let data = body.getData(at: 0, length: body.readableBytes) ?? Data()

        struct GitHubRelease: Codable {
            let tagName: String
            let assets: [Asset]

            struct Asset: Codable {
                let name: String
                let browserDownloadUrl: String
            }
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let release = try decoder.decode(GitHubRelease.self, from: data)

        // Find the kernel asset
        let kernelAsset = release.assets.first { asset in
            asset.name.hasPrefix("vmlinux") || asset.name.hasPrefix("vmlinuz")
        }

        return KernelReleaseInfo(
            version: release.tagName.replacingOccurrences(of: "v", with: ""),
            assetURL: kernelAsset?.browserDownloadUrl
        )
    }

    /// Get the kernels directory path
    static func kernelsDirectory() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!

        let kernelsURL = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("kernels")

        return FilePath(kernelsURL.path)
    }
}

// MARK: - Supporting Types

private struct KernelReleaseInfo {
    let version: String
    let assetURL: String?
}

// MARK: - Errors

public enum KernelError: LocalizedError {
    case notFound(String)
    case downloadFailed(String)
    case invalidKernel(String)

    public var errorDescription: String? {
        switch self {
        case let .notFound(message):
            return "Kernel not found: \(message)"
        case let .downloadFailed(reason):
            return "Failed to download kernel: \(reason)"
        case let .invalidKernel(reason):
            return "Invalid kernel: \(reason)"
        }
    }
}
