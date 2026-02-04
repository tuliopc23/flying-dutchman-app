import Foundation
import Shared
import FlyingDutchmanContainers

public enum ContainerizationStub {
    public struct EngineState: Codable {
        public let engine: String
        public let uptimeSeconds: Int
        public let workers: [String: String]
        public let mode: String
    }

    public static func currentState(runtime: ContainerRuntimeProtocol? = nil) async -> EngineState {
        let runtimeName = await runtime?.name ?? "stub"
        return EngineState(
            engine: "running",
            uptimeSeconds: EngineRuntime.uptimeSeconds,
            workers: [
                "http": "ready",
                "xpc": "ready",
                "containerization": runtimeName
            ],
            mode: runtimeName
        )
    }
}
