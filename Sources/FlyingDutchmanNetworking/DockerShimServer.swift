import Foundation
import Hummingbird
import Logging
import Shared
import FlyingDutchmanPersistence
import FlyingDutchmanContainers

/// Docker API compatibility shim that translates Docker commands to Apple Containerization framework calls
public struct DockerShimServer: @unchecked Sendable {
    private let logger = Loggers.make(category: "flyingdutchman.shim")
    private let runtime: any ContainerRuntimeProtocol
    
    public init(runtime: any ContainerRuntimeProtocol) {
        self.runtime = runtime
    }
    
    public func register(on router: Router<BasicRequestContext>) {
        
        // 1. Ping
        router.get("/_ping") { _, _ in
            return Response(status: .ok)
        }
        
        // 2. Version
        router.get("/v1.41/version") { _, _ in
            return DockerVersionResponse(
                version: AppConfig.version,
                apiVersion: "1.41",
                minAPIVersion: "1.24",
                arch: "arm64",
                os: "linux",
                kernelVersion: "6.14.9-flyingdutchman"
            )
        }
        
        // 3. List Containers (docker ps)
        router.get("/v1.41/containers/json") { [runtime] _, _ in
            let containers = try await runtime.listContainers()
            return containers.map { container in
                DockerContainerResponse(
                    id: container.id.uuidString,
                    names: ["/\(container.name)"],
                    image: container.image,
                    state: container.status.rawValue,
                    status: container.status.displayName,
                    created: Int(container.createdAt.timeIntervalSince1970)
                )
            }
        }
        
        // 4. Create Container (docker run/create)
        router.post("/v1.41/containers/create") { request, context in
            struct CreateRequest: Codable {
                let Image: String
                let Name: String?
                let Cmd: [String]?
                let Env: [String]?
            }
            
            let body = try await request.decode(as: CreateRequest.self, context: context)
            let name = body.Name ?? "fd-\(UUID().uuidString.prefix(8))"
            
            let summary = try await self.runtime.createContainer(
                name: name,
                image: body.Image,
                config: ContainerConfig(ports: [])
            )
            
            var responseHeaders = HTTPFields()
            responseHeaders[.location] = "/v1.41/containers/\(summary.id.uuidString)"
            return Response(status: .created, headers: responseHeaders, body: .init(byteBuffer: ByteBuffer()))
        }
        
        // 5. Start Container
        router.post("/v1.41/containers/:id/start") { [runtime] _, context in
            let idString = try context.parameters.require("id", as: String.self)
            guard let id = UUID(uuidString: idString) else {
                throw HTTPError(.badRequest)
            }
            
            _ = try await runtime.startContainer(id: id)
            return Response(status: .noContent)
        }
        
        // 6. Stop Container
        router.post("/v1.41/containers/:id/stop") { [runtime] _, context in
            let idString = try context.parameters.require("id", as: String.self)
            guard let id = UUID(uuidString: idString) else {
                throw HTTPError(.badRequest)
            }
            
            _ = try await runtime.stopContainer(id: id)
            return Response(status: .noContent)
        }
        
        // 7. Remove Container
        router.delete("/v1.41/containers/:id") { [runtime] _, context in
            let idString = try context.parameters.require("id", as: String.self)
            guard let id = UUID(uuidString: idString) else {
                throw HTTPError(.badRequest)
            }
            
            try await runtime.removeContainer(id: id)
            return Response(status: .noContent)
        }
        
        // 8. Container Logs
        router.get("/v1.41/containers/:id/logs") { request, context in
            let idString = try context.parameters.require("id", as: String.self)
            guard UUID(uuidString: idString) != nil else {
                throw HTTPError(.badRequest)
            }
            
            // TODO: Implement streaming response for logs
            let message = "Log streaming via shim not yet implemented. Use FD app to view logs."
            var buffer = ByteBufferAllocator().buffer(capacity: message.utf8.count)
            buffer.writeString(message)
            return Response(status: .ok, body: .init(byteBuffer: buffer))
        }
        
        // 9. List Images
        router.get("/v1.41/images/json") { [runtime] _, _ in
            let images = try await runtime.listImages()
            return images.map { image in
                DockerImageResponse(
                    id: image.digest ?? image.id.uuidString,
                    repoTags: ["\(image.name):\(image.tag)"],
                    size: image.sizeBytes ?? 0,
                    created: Int(image.createdAt.timeIntervalSince1970)
                )
            }
        }
        
        // 10. Pull Image
        router.post("/v1.41/images/create") { request, context in
            // Parse query parameters: ?fromImage=alpine:latest
            let query = try? request.uri.decodeQuery(as: ImagePullQuery.self, context: context)
            guard let imageRef = query?.fromImage else {
                throw HTTPError(.badRequest)
            }
            
            _ = try await self.runtime.pullImage(reference: imageRef)
            
            // Docker API expects streaming progress, but for now return simple response
            let message = "Image \(imageRef) pulled successfully"
            var buffer = ByteBufferAllocator().buffer(capacity: message.utf8.count)
            buffer.writeString(message)
            return Response(status: .ok, body: .init(byteBuffer: buffer))
        }
        
        // 11. System Info
        router.get("/v1.41/info") { [runtime] _, _ in
            let containers = try await runtime.listContainers()
            let images = try await runtime.listImages()
            
            return DockerInfoResponse(
                containers: containers.count,
                containersRunning: containers.filter { $0.status == .running }.count,
                containersPaused: containers.filter { $0.status == .paused }.count,
                containersStopped: containers.filter { $0.status == .stopped }.count,
                images: images.count,
                operatingSystem: "macOS",
                architecture: "arm64",
                kernelVersion: "Darwin",
                osType: "darwin",
                osVersion: ProcessInfo.processInfo.operatingSystemVersionString
            )
        }
    }
}

// MARK: - Docker API Response Types

private struct DockerVersionResponse: ResponseEncodable {
    let version: String
    let apiVersion: String
    let minAPIVersion: String
    let arch: String
    let os: String
    let kernelVersion: String
    
    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case apiVersion = "ApiVersion"
        case minAPIVersion = "MinAPIVersion"
        case arch = "Arch"
        case os = "Os"
        case kernelVersion = "KernelVersion"
    }
}

private struct DockerContainerResponse: ResponseEncodable {
    let id: String
    let names: [String]
    let image: String
    let state: String
    let status: String
    let created: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case names = "Names"
        case image = "Image"
        case state = "State"
        case status = "Status"
        case created = "Created"
    }
}

private struct DockerImageResponse: ResponseEncodable {
    let id: String
    let repoTags: [String]
    let size: Int
    let created: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case repoTags = "RepoTags"
        case size = "Size"
        case created = "Created"
    }
}

private struct DockerInfoResponse: ResponseEncodable {
    let containers: Int
    let containersRunning: Int
    let containersPaused: Int
    let containersStopped: Int
    let images: Int
    let operatingSystem: String
    let architecture: String
    let kernelVersion: String
    let osType: String
    let osVersion: String
    
    enum CodingKeys: String, CodingKey {
        case containers = "Containers"
        case containersRunning = "ContainersRunning"
        case containersPaused = "ContainersPaused"
        case containersStopped = "ContainersStopped"
        case images = "Images"
        case operatingSystem = "OperatingSystem"
        case architecture = "Architecture"
        case kernelVersion = "KernelVersion"
        case osType = "OSType"
        case osVersion = "OSVersion"
    }
}

private struct ImagePullQuery: Decodable {
    let fromImage: String?
    
    enum CodingKeys: String, CodingKey {
        case fromImage
    }
}
