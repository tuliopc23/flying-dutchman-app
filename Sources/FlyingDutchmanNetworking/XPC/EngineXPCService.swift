import Foundation
import Shared

public final class EngineXPCService: NSObject, EngineXPCProtocol {
    public func fetchStatus(reply: @escaping (EngineXPCStatus) -> Void) {
        let status = EngineXPCStatus(
            engine: "running",
            uptimeSeconds: 0,
            workers: ["http": "ready", "xpc": "stub"]
        )
        reply(status)
    }
}
