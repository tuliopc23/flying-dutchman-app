import Foundation
import Shared

public enum KubernetesClientStub {
    public struct ClusterInfo: Codable {
        public let name: String
        public let version: String
        public let nodes: Int
    }

    public static func info() -> ClusterInfo {
        ClusterInfo(name: "fd-dev", version: "stub", nodes: 1)
    }
}
