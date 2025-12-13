import Foundation
import FlyingDutchmanContainers

public enum ContainerizationStub {
    public struct EngineState: Codable {
        public let engine: String
        public let uptimeSeconds: Int
        public let workers: [String: String]
        public let mode: String
    }

    public static func currentState(runtime: ContainerRuntimeProtocol? = nil) -> EngineState {
        let workerStatuses = runtime?.workerStatuses() ?? [:]
        return EngineState(
            engine: "running",
            uptimeSeconds: EngineRuntime.uptimeSeconds,
            workers: [
                "http": "ready",
                "xpc": "ready",
                "containerization": workerStatuses["containerization"] ?? "stub"
            ],
            mode: runtime?.mode.rawValue ?? "stub"
        )
    }
}
