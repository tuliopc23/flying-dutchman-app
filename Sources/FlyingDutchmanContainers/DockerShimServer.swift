import Foundation
import Hummingbird
import Logging
import Shared
import FlyingDutchmanPersistence

/// Docker API compatibility shim that translates Docker commands to Apple Containerization framework calls
public actor DockerShimServer {
    private let logger = Loggers.make(category: "flyingdutchman.shim")
    private let runtime: ContainerizationRuntime
    private let containerStore = ContainerStore()
    
    public init(runtime: ContainerizationRuntime) {
        self.runtime = runtime
    }
    
    public func buildRouter() -> Router<HTTPContext> {
        let router = Router(context: HTTPContext.self)
        
        // 1. Ping
        router.get("/_ping") { _, _ in
            return HTTPResponse.Status.ok
        }
        
        // 2. Version
        router.get("/v1.41/version") { _, _ in
            return [
                "Version": AppConfig.version,
                "ApiVersion": "1.41",
                "MinAPIVersion": "1.24",
                "Arch": "arm64",
                "Os": "linux", // Shim Linux personality
                "KernelVersion": "6.14.9-flyingdutchman"
            ]
        }
        
        // 3. List Containers (docker ps)
        router.get("/v1.41/containers/json") { _, _ in
            let containers = try await self.runtime.listContainers()
            return containers.map { container in
                [
                    "Id": container.id.uuidString,
                    "Names": ["/\(container.name)"],
                    "Image": container.image,
                    "State": container.status.rawValue,
                    "Status": container.status.displayName,
                    "Created": Int(container.createdAt.timeIntervalSince1970)
                ]
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
            
            return HTTPResponse.Status.created
        }
        
        // 5. Start Container
        router.post("/v1.41/containers/{id}/start") { request, context in
            guard let idString = context.parameters.get("id"),
                  let id = UUID(uuidString: idString) else {
                throw HTTPError(.badRequest)
            }
            
            _ = try await self.runtime.startContainer(id: id)
            return HTTPResponse.Status.noContent
        }
        
        // 6. Stop Container
        router.post("/v1.41/containers/{id}/stop") { request, context in
            guard let idString = context.parameters.get("id"),
                  let id = UUID(uuidString: idString) else {
                throw HTTPError(.badRequest)
            }
            
            _ = try await self.runtime.stopContainer(id: id)
            return HTTPResponse.Status.noContent
        }
        
        // 7. Container Logs
        router.get("/v1.41/containers/{id}/logs") { request, context in
            guard let idString = context.parameters.get("id"),
                  let id = UUID(uuidString: idString) else {
                throw HTTPError(.badRequest)
            }
            
            // TODO: Implement streaming response for logs
            return "Log streaming via shim not yet implemented. Use FD app to view logs."
        }

        return router
    }
}
