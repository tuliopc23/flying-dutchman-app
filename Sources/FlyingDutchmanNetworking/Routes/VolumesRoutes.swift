import Foundation
import FlyingDutchmanPersistence
import FlyingDutchmanContainers
import Shared
import Hummingbird

struct VolumesRoutes: @unchecked Sendable {
    let store: VolumeStore?
    let volumeManager: VolumeManager

    init(store: VolumeStore?) {
        self.store = store
        self.volumeManager = VolumeManager(volumeStore: store ?? VolumeStore())
    }

    func register(on router: Router<BasicRequestContext>) {
        router.get("/volumes") { _, _ in
            return store?.fetchAll() ?? []
        }
        
        router.post("/volumes/create") { request, context -> EditedResponse<VolumeSummary> in
            struct CreateVolumeRequest: Decodable {
                let name: String
                let driver: String?
            }
            
            guard let payload = try? await request.decode(as: CreateVolumeRequest.self, context: context) else {
                throw HTTPError(.badRequest)
            }
            
            guard !payload.name.isEmpty else {
                throw HTTPError(.badRequest)
            }
            
            let volume = try await volumeManager.createVolume(
                name: payload.name,
                driver: payload.driver ?? "local"
            )
            
            return EditedResponse(status: .created, response: volume)
        }
        
        router.delete("/volumes/:name") { _, context -> HTTPResponse.Status in
            guard let name = context.parameters.get("name") else {
                throw HTTPError(.badRequest)
            }
            
            do {
                try await volumeManager.removeVolume(name: name)
                return .noContent
            } catch VolumeError.notFound {
                throw HTTPError(.notFound)
            }
        }
    }
}
