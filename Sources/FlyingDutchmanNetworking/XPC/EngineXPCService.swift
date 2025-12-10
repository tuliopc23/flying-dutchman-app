import Foundation
import Shared
import FlyingDutchmanContainers

public final class EngineXPCService: NSObject, EngineXPCProtocol {
    public func fetchStatus(reply: @escaping (EngineXPCStatus) -> Void) {
        let status = EngineXPCStatus(
            engine: "running",
            uptimeSeconds: EngineRuntime.uptimeSeconds,
            workers: [
                "http": "ready",
                "xpc": "stub",
                "containerization": ContainerizationClient.shared.workerStatus
            ]
        )
        reply(status)
    }
}
