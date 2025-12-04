import Foundation
import Logging

public struct AppConfig {
    public static let appName = "FlyingDutchman"
    public static let version = "0.1.0"

    public struct Engine {
        public static let host = "127.0.0.1"
        public static let port: Int = 8080
        public static var healthURL: URL { URL(string: "http://\(host):\(port)/health")! }
    }
}

public enum Loggers {
    public static func make(category: String = "flyingdutchman.shared") -> Logger {
        Logger(label: category)
    }
}

public struct EngineStatus: Codable {
    public let status: String
    public let engine: String
}

public struct EngineStatusDetail: Codable {
    public let engine: String
    public let uptimeSeconds: Int
    public let workers: [String: String]
}
