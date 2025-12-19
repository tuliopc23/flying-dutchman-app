import Foundation
import Shared
import FlyingDutchmanContainers

public final class EngineXPCService: NSObject, EngineXPCProtocol {
    private let runtime: ContainerRuntimeProtocol

    public init(runtime: ContainerRuntimeProtocol) {
        self.runtime = runtime
        super.init()
    }

    public func fetchStatus(reply: @escaping (NSData) -> Void) {
        let status = EngineXPCStatus(
            engine: "running",
            uptimeSeconds: EngineRuntime.uptimeSeconds,
            workers: [
                "http": "ready",
                "xpc": "ready",
                "containerization": ContainerizationClient.shared.workerStatus
            ],
            runtimeMode: runtime.mode.rawValue
        )

        let data = (try? JSONEncoder().encode(status)) ?? Data()
        reply(data as NSData)
    }

    public func listContainers(reply: @escaping (NSData?, NSError?) -> Void) {
        let containers = runtime.list()

        guard let data = try? JSONEncoder().encode(containers) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 500,
                userInfo: [NSLocalizedDescriptionKey: "Failed to encode containers"]
            )
            reply(nil, error)
            return
        }

        reply(data as NSData, nil)
    }

    public func startContainer(id: String, reply: @escaping (NSData?, NSError?) -> Void) {
        guard let uuid = UUID(uuidString: id) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Invalid container ID format"]
            )
            reply(nil, error)
            return
        }

        guard let updated = runtime.start(containerID: uuid) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 404,
                userInfo: [NSLocalizedDescriptionKey: "Container not found"]
            )
            reply(nil, error)
            return
        }

        guard let data = try? JSONEncoder().encode(updated) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 500,
                userInfo: [NSLocalizedDescriptionKey: "Failed to encode container"]
            )
            reply(nil, error)
            return
        }

        reply(data as NSData, nil)
    }

    public func stopContainer(id: String, reply: @escaping (NSData?, NSError?) -> Void) {
        guard let uuid = UUID(uuidString: id) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Invalid container ID format"]
            )
            reply(nil, error)
            return
        }

        guard let updated = runtime.stop(containerID: uuid) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 404,
                userInfo: [NSLocalizedDescriptionKey: "Container not found"]
            )
            reply(nil, error)
            return
        }

        guard let data = try? JSONEncoder().encode(updated) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 500,
                userInfo: [NSLocalizedDescriptionKey: "Failed to encode container"]
            )
            reply(nil, error)
            return
        }

        reply(data as NSData, nil)
    }
}
