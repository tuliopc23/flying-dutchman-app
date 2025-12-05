import Foundation

public enum ContainerizationStub {
    public struct EngineState: Codable {
        public let engine: String
        public let uptimeSeconds: Int
        public let workers: [String: String]
    }

    public static func currentState() -> EngineState {
        EngineState(
            engine: "running",
            uptimeSeconds: EngineRuntime.uptimeSeconds,
            workers: [
                "http": "ready",
                "xpc": "ready",
                "containerization": "stub"
            ]
        )
    }
}
