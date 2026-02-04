import Foundation
import Logging

public enum AppConfig {
    public static let appName = "FlyingDutchman"
    public static let version = "0.1.0"

    public enum Engine {
        public static let host = "127.0.0.1"
        public static let port: Int = 8080
        public static var healthURL: URL {
            URL(string: "http://\(host):\(port)/health")!
        }
    }

    public enum Database {
        private static var appSupportDir: String {
            let fm = FileManager.default
            let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
            return base.appendingPathComponent("flyingdutchman").path
        }

        public static var machinesPath: String {
            "\(appSupportDir)/machines.db"
        }
    }

    public enum Networking {
        public static let dnsPort: Int = 5353
        public static let httpsProxyPort: Int = 8443
        public static let primaryDomainSuffix = "flyingdutchman.local"
        public static let legacyDomainSuffix = "fd.local"
        public static let containerDomainSuffixes = [
            primaryDomainSuffix,
            legacyDomainSuffix,
        ]
        public static let kubernetesPrimarySuffix = "k8s.flyingdutchman.local"
        public static let kubernetesLegacySuffix = "k8s.fd.local"
        public static let kubernetesDomainSuffixes = [
            kubernetesPrimarySuffix,
            kubernetesLegacySuffix,
        ]
        public static let resolverDomainSuffixes = containerDomainSuffixes + kubernetesDomainSuffixes
        public static let proxyDomainSuffixes = resolverDomainSuffixes

        public static func hostname(for containerName: String, suffix: String = primaryDomainSuffix) -> String {
            "\(containerName).\(suffix)"
        }

        public static func url(for containerName: String, scheme: String = "https") -> URL? {
            let host = hostname(for: containerName)
            return URL(string: "\(scheme)://\(host):\(httpsProxyPort)")
        }

        public static func kubernetesHostname(
            for clusterName: String,
            suffix: String = kubernetesPrimarySuffix
        ) -> String {
            "\(clusterName).\(suffix)"
        }

        public static func kubernetesURL(
            for clusterName: String,
            scheme: String = "https"
        ) -> URL? {
            let host = kubernetesHostname(for: clusterName)
            return URL(string: "\(scheme)://\(host):\(httpsProxyPort)")
        }
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
