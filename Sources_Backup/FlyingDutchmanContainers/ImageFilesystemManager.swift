import Foundation
import Logging
import SystemPackage
import Shared

/// Manages exposure of image layers as browsable directories
public actor ImageFilesystemManager {
    private let logger = Loggers.make(category: .containers)

    /// Base directory for images
    private let imagesBaseDir: FilePath
    
    /// Base directory for containers
    private let containersBaseDir: FilePath

    public init() {
        self.imagesBaseDir = Self.imagesDirectory()
        self.containersBaseDir = Self.containersDirectory()

        // Create base directories if they don't exist
        try? FileManager.default.createDirectory(
            atPath: imagesBaseDir.string,
            withIntermediateDirectories: true
        )
        
        try? FileManager.default.createDirectory(
            atPath: containersBaseDir.string,
            withIntermediateDirectories: true
        )
    }

    /// Expose an image's layers as a read-only directory
    /// - Parameters:
    ///   - imageName: Name of the image (e.g., "nginx")
    ///   - tag: Image tag (e.g., "latest")
    ///   - layerDigests: Array of layer digests (SHA256 hashes)
    /// - Returns: Path to the exposed image directory
    /// - Throws: FilesystemError if exposure fails
    public func exposeImage(imageName: String, tag: String, layerDigests: [String]) throws -> FilePath {
        let safeName = imageName.replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: ":", with: "_")
        let imageDir = imagesBaseDir.appending("\(safeName)_\(tag)")

        logger.info("Exposing image \(imageName):\(tag) at \(imageDir.string)")

        // Create image directory if it doesn't exist
        if FileManager.default.fileExists(atPath: imageDir.string) {
            logger.debug("Image directory already exists: \(imageDir.string)")
            return imageDir
        }

        try FileManager.default.createDirectory(atPath: imageDir.string, withIntermediateDirectories: true)

        // Create layer directories
        let layersDir = imageDir.appending("layers")
        try FileManager.default.createDirectory(atPath: layersDir.string, withIntermediateDirectories: true)

        // Create symlinks or directories for each layer
        for (index, digest) in layerDigests.enumerated() {
            let layerDir = layersDir.appending("layer_\(index)_\(digest)")

            // In a real implementation, this would either:
            // 1. Extract the layer tarball to this directory
            // 2. Create a union mount (overlayfs) combining all layers
            // For now, create a placeholder directory
            try FileManager.default.createDirectory(atPath: layerDir.string, withIntermediateDirectories: true)

            // Create metadata file
            let metadata = LayerMetadata(
                digest: digest,
                index: index,
                exposedAt: Date()
            )
            try writeLayerMetadata(metadata, to: layerDir)

            logger.debug("Created layer directory: \(layerDir.string)")
        }

        // Create combined filesystem view (union mount placeholder)
        let combinedFS = imageDir.appending("combined")
        try FileManager.default.createDirectory(atPath: combinedFS.string, withIntermediateDirectories: true)

        // Create image metadata
        let imageMetadata = ImageMetadata(
            name: imageName,
            tag: tag,
            layerDigests: layerDigests,
            exposedAt: Date()
        )
        try writeImageMetadata(imageMetadata, to: imageDir)

        logger.info("Image \(imageName):\(tag) exposed successfully")
        return imageDir
    }

    /// Get the path to an exposed image
    /// - Parameters:
    ///   - imageName: Name of the image
    ///   - tag: Image tag
    /// - Returns: Path to the image directory, or nil if not exposed
    public func getExposedImage(imageName: String, tag: String) -> FilePath? {
        let safeName = imageName.replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: ":", with: "_")
        let imageDir = imagesBaseDir.appending("\(safeName)_\(tag)")

        guard FileManager.default.fileExists(atPath: imageDir.string) else {
            return nil
        }

        return imageDir
    }

    /// Remove an exposed image directory
    /// - Parameters:
    ///   - imageName: Name of the image
    ///   - tag: Image tag
    /// - Throws: FilesystemError if removal fails
    public func removeExposedImage(imageName: String, tag: String) throws {
        let safeName = imageName.replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: ":", with: "_")
        let imageDir = imagesBaseDir.appending("\(safeName)_\(tag)")

        guard FileManager.default.fileExists(atPath: imageDir.string) else {
            throw FilesystemError.notFound("Image not exposed: \(imageName):\(tag)")
        }

        try FileManager.default.removeItem(atPath: imageDir.string)
        logger.info("Removed exposed image: \(imageName):\(tag)")
    }

    /// List all exposed images
    /// - Returns: Array of image metadata
    public func listExposedImages() -> [ImageMetadata] {
        guard let contents = try? FileManager.default.contentsOfDirectory(atPath: imagesBaseDir.string) else {
            return []
        }

        return contents.compactMap { directoryName -> ImageMetadata? in
            let imageDir = imagesBaseDir.appending(directoryName)
            return readImageMetadata(from: imageDir)
        }.sorted { $0.exposedAt < $1.exposedAt }
    }

    /// Cleanup old exposed images
    /// - Parameter olderThan: Remove images exposed before this date
    /// - Throws: FilesystemError if cleanup fails
    public func cleanupOldImages(olderThan date: Date) throws {
        let images = listExposedImages()

        for image in images where image.exposedAt < date {
            logger.info("Cleaning up old image: \(image.name):\(image.tag) (exposed: \(image.exposedAt))")
            try removeExposedImage(imageName: image.name, tag: image.tag)
        }

        logger.info("Cleanup completed")
    }

    // MARK: - Private Helpers

    private func writeImageMetadata(_ metadata: ImageMetadata, to directory: FilePath) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(metadata)

        let metadataPath = directory.appending("image_metadata.json")
        try data.write(to: URL(fileURLWithPath: metadataPath.string))
    }

    private func readImageMetadata(from directory: FilePath) -> ImageMetadata? {
        let metadataPath = directory.appending("image_metadata.json")

        guard let data = try? Data(contentsOf: URL(fileURLWithPath: metadataPath.string)) else {
            return nil
        }

        return try? JSONDecoder().decode(ImageMetadata.self, from: data)
    }

    private func writeLayerMetadata(_ metadata: LayerMetadata, to directory: FilePath) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(metadata)

        let metadataPath = directory.appending("layer_metadata.json")
        try data.write(to: URL(fileURLWithPath: metadataPath.string))
    }

    private static func imagesDirectory() -> FilePath {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        let imagesDir = homeDir
            .appendingPathComponent("FlyingDutchman")
            .appendingPathComponent("images")

        return FilePath(imagesDir.path)
    }
    
    private static func containersDirectory() -> FilePath {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        let containersDir = homeDir
            .appendingPathComponent("FlyingDutchman")
            .appendingPathComponent("containers")

        return FilePath(containersDir.path)
    }
    
    public func exposeContainer(id: UUID, name: String) throws -> FilePath {
        let containerDir = containersBaseDir.appending(name)
        
        logger.info("Exposing container \(name) (\(id)) at \(containerDir.string)")
        
        if FileManager.default.fileExists(atPath: containerDir.string) {
            logger.debug("Container directory already exists: \(containerDir.string)")
            return containerDir
        }
        
        try FileManager.default.createDirectory(atPath: containerDir.string, withIntermediateDirectories: true)
        
        let metadataDir = containerDir.appending("metadata")
        try FileManager.default.createDirectory(atPath: metadataDir.string, withIntermediateDirectories: true)
        
        let containerMetadata = ContainerFilesystemMetadata(
            id: id,
            name: name,
            exposedAt: Date()
        )
        try writeContainerMetadata(containerMetadata, to: containerDir)
        
        logger.info("Container \(name) exposed successfully")
        return containerDir
    }
    
    public func removeExposedContainer(name: String) throws {
        let containerDir = containersBaseDir.appending(name)
        
        guard FileManager.default.fileExists(atPath: containerDir.string) else {
            throw FilesystemError.notFound("Container not exposed: \(name)")
        }
        
        try FileManager.default.removeItem(atPath: containerDir.string)
        logger.info("Removed exposed container: \(name)")
    }
    
    private func writeContainerMetadata(_ metadata: ContainerFilesystemMetadata, to directory: FilePath) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(metadata)
        
        let metadataPath = directory.appending("metadata").appending("container.json")
        try data.write(to: URL(fileURLWithPath: metadataPath.string))
    }
}

private struct ContainerFilesystemMetadata: Codable {
    let id: UUID
    let name: String
    let exposedAt: Date
}

// MARK: - Metadata Types

public struct ImageMetadata: Codable, Sendable {
    public let name: String
    public let tag: String
    public let layerDigests: [String]
    public let exposedAt: Date

    public init(name: String, tag: String, layerDigests: [String], exposedAt: Date) {
        self.name = name
        self.tag = tag
        self.layerDigests = layerDigests
        self.exposedAt = exposedAt
    }

    public var fullName: String {
        "\(name):\(tag)"
    }

    public var layerCount: Int {
        layerDigests.count
    }
}

private struct LayerMetadata: Codable {
    let digest: String
    let index: Int
    let exposedAt: Date
}

// MARK: - Errors

public enum FilesystemError: LocalizedError {
    case notFound(String)
    case creationFailed(String)
    case removalFailed(String)

    public var errorDescription: String? {
        switch self {
        case let .notFound(message):
            return "Not found: \(message)"
        case let .creationFailed(reason):
            return "Failed to create directory: \(reason)"
        case let .removalFailed(reason):
            return "Failed to remove directory: \(reason)"
        }
    }
}
