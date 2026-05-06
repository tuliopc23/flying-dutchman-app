import FlyingDutchmanContainers
import Foundation
import Shared

public enum EngineClient {
    @MainActor private static var configuredHost: String = AppConfig.Engine.host
    @MainActor private static var configuredPort: Int = AppConfig.Engine.port

    @MainActor public static func configure(host: String, port: Int) {
        configuredHost = host
        configuredPort = port
    }

    @MainActor static var baseURL: String {
        "http://\(configuredHost):\(configuredPort)"
    }

    public enum AuthenticationError: Error, LocalizedError {
        case failed(message: String)

        public var errorDescription: String? {
            switch self {
            case let .failed(message):
                "Authentication failed: \(message)"
            }
        }
    }
}
