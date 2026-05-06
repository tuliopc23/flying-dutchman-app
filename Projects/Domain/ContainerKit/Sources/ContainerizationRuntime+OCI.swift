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

extension ContainerizationRuntime {
    func pullOCIManifest(imageRef: ImageReference, authToken: String?) async throws -> OCIManifest {
        let registryBase = imageRef.registry == "docker.io" ? "https://registry-1.docker.io" : "https://\(imageRef.registry)"
        let manifestURL = "\(registryBase)/v2/\(imageRef.name)/manifests/\(imageRef.tag)"

        logger.info("Fetching manifest from \(manifestURL)")

        var request = try HTTPClient.Request(url: manifestURL)
        request.headers.add(
            name: "Accept",
            value: "application/vnd.oci.image.manifest.v1+json,application/vnd.docker.distribution.manifest.v2+json"
        )

        // Add auth header if token available
        if let token = authToken {
            request.headers.add(name: "Authorization", value: "Bearer \(token)")
        }

        let response = try await httpClient.execute(request: request).get()

        guard response.status == .ok else {
            if response.status.code == 401 {
                throw OCIRegistryError.unauthorized(statusCode: 401)
            }
            throw ContainerError.imageNotFound("Failed to fetch manifest: HTTP \(response.status.code)")
        }

        guard let body = response.body else {
            throw ContainerError.imageNotFound("Empty manifest response")
        }

        let manifestData = body.getData(at: 0, length: body.readableBytes) ?? Data()
        return try JSONDecoder().decode(OCIManifest.self, from: manifestData)
    }

    func downloadOCILayerData(
        imageRef: ImageReference,
        digest: String,
        authToken: String?
    ) async throws -> Data {
        let registryBase = imageRef.registry == "docker.io" ? "https://registry-1.docker.io" : "https://\(imageRef.registry)"
        let blobURL = "\(registryBase)/v2/\(imageRef.name)/blobs/\(digest)"

        logger.info("Downloading blob from \(blobURL)")

        var request = try HTTPClient.Request(url: blobURL)

        // Add auth header if token available
        if let token = authToken {
            request.headers.add(name: "Authorization", value: "Bearer \(token)")
        }

        let response = try await httpClient.execute(request: request).get()

        guard response.status == .ok else {
            if response.status.code == 401 {
                throw OCIRegistryError.unauthorized(statusCode: 401)
            }
            throw ContainerError.imageNotFound("Failed to download blob \(digest): HTTP \(response.status.code)")
        }

        guard let body = response.body else {
            throw ContainerError.imageNotFound("Empty blob response")
        }

        let blobData = body.getData(at: 0, length: body.readableBytes) ?? Data()
        logger.info("Downloaded blob \(digest) (\(blobData.count) bytes)")
        return blobData
    }

    func parseImageReference(_ reference: String) throws -> ImageReference {
        let parts = reference.split(separator: ":")
        let name = String(parts[0])
        let tag = parts.count > 1 ? String(parts[1]) : "latest"

        return ImageReference(
            registry: "docker.io",
            name: name,
            tag: tag
        )
    }

    func ensureImage(_ ref: ImageReference) async throws -> ImageSummary {
        if let existing = try await imageStore.fetch(name: ref.name, tag: ref.tag) {
            return existing
        }
        return try await pullImage(reference: "\(ref.name):\(ref.tag)")
    }
}
