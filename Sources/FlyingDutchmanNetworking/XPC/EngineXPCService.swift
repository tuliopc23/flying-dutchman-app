import Foundation
import Shared
import FlyingDutchmanContainers

public final class EngineXPCService: NSObject, EngineXPCProtocol {
    public func fetchStatus(reply: @escaping (NSData) -> Void) {
        let status = EngineXPCStatus(
            engine: "running",
            uptimeSeconds: EngineRuntime.uptimeSeconds,
            workers: [
                "http": "ready",
                "xpc": "stub",
                "containerization": ContainerizationClient.shared.workerStatus
            ]
        )

        let data = (try? JSONEncoder().encode(status)) ?? Data()
        reply(data as NSData)
    }
}
