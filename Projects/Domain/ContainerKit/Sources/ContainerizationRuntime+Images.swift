import AsyncHTTPClient
import Containerization
import ContainerizationExtras
import ContainerizationOCI
import FlyingDutchmanPersistence
import Foundation
import Logging
import NIOCore
import NIOTransportServices
import Shared
import SystemPackage

public extension ContainerizationRuntime {
    func pullImage(reference: String) async throws -> ImageSummary {
        try await pullImageWithRetry(reference: reference, retryCount: 0)
    }

    /// Pull image with authentication retry logic
    private func pullImageWithRetry(reference: String, retryCount: Int) async throws -> ImageSummary {
        let imageRef = try parseImageReference(reference)

        logger.info("Pulling image \(imageRef.name):\(imageRef.tag) from \(imageRef.registry)")

        // Prepare storage paths
        let blobsDir = self.blobsPath()
        let manifestsDir = self.manifestsPath()
        try FileManager.default.createDirectory(atPath: blobsDir.string, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(atPath: manifestsDir.string, withIntermediateDirectories: true)

        // Get auth token if available
        let scope = "repository:\(imageRef.name):pull"
        let authToken = try await authManager.getAuthToken(registry: imageRef.registry, scope: scope)

        // Pull manifest using OCI Distribution API
        let manifest: OCIManifest
        do {
            manifest = try await pullOCIManifest(imageRef: imageRef, authToken: authToken)
        } catch let error as OCIRegistryError where error.statusCode == 401 {
            // Authentication failed - try to refresh token and retry once
            if retryCount == 0 {
                logger.info("Received 401, refreshing token and retrying")
                try await authManager.refreshToken(registry: imageRef.registry)
                return try await pullImageWithRetry(reference: reference, retryCount: 1)
            } else {
                // Already retried, give up
                logger.error("Authentication failed after retry")
                throw ContainerError.imageNotFound("Authentication required. Run: fd login \(imageRef.registry)")
            }
        }

        // Download and store layer blobs
        var layerDigests: [String] = []
        var totalSize: Int = 0

        for layer in manifest.layers {
            let digest = layer.digest
            layerDigests.append(digest)

            // Skip if already cached
            if await imageCache.hasBlob(digest: digest) {
                logger.info("Layer \(digest) already cached, skipping download")
                totalSize += layer.size
                continue
            }

            logger.info("Downloading layer \(digest) (\(layer.mediaType))")
            let blobData = try await downloadOCILayerData(imageRef: imageRef, digest: digest, authToken: authToken)
            try await imageCache.storeBlob(digest: digest, data: blobData)
            totalSize += blobData.count
        }

        // Save manifest metadata for later reconstruction
        let storedManifest = StoredManifest(layers: layerDigests)
        let manifestData = try JSONEncoder().encode(storedManifest)
        let manifestPath = self.manifestFilePath(name: imageRef.name, tag: imageRef.tag)
        try manifestData.write(to: URL(fileURLWithPath: manifestPath.string))

        // Create image record
        let image = ImageSummary(
            name: imageRef.name,
            tag: imageRef.tag,
            digest: manifest.config.digest,
            sizeBytes: totalSize
        )

        try await imageStore.insert(image)

        do {
            _ = try await imageFilesystem.exposeImage(
                imageName: imageRef.name,
                tag: imageRef.tag,
                layerDigests: layerDigests
            )
        } catch {
            logger.warning("Failed to expose image \(imageRef.name):\(imageRef.tag): \(error)")
        }

        logger.info("Image \(reference) pulled successfully (\(layerDigests.count) layers, \(totalSize) bytes)")
        return image
    }

    func listImages() async throws -> [ImageSummary] {
        imageStore.fetchAll()
    }

    func buildImage(request: ImageBuildRequest) async throws -> ImageBuildResult {
        let (image, logs, builder) = try HostImageBuilder.build(request: request)
        try await imageStore.upsert(image)
        logger.info("Built image \(image.displayName) using \(builder)")
        return ImageBuildResult(image: image, logs: logs, builder: builder)
    }
}
