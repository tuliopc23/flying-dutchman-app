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
    /// Creates a logger for the specified category.
    /// - Parameter category: The log category
    /// - Returns: A configured Logger instance
    public static func make(category: LogCategory) -> Logger {
        Logger(label: category.label)
    }

    /// Creates a logger with a custom label string.
    /// - Parameter category: A custom logger label string
    /// - Returns: A configured Logger instance
    public static func make(category: String) -> Logger {
        Logger(label: category)
    }
}

public struct EngineStatus: Codable, Sendable {
    public let status: String
    public let engine: String
}

public struct EngineStatusDetail: Codable, Sendable {
    public let engine: String
    public let uptimeSeconds: Int
    public let workers: [String: String]
    public let mode: String?
}
