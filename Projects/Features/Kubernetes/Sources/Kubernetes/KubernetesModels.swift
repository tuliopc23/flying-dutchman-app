import Shared

public enum KubernetesClusterKind: String, Sendable {
    case vm
    case container
}

public struct KubernetesCluster: Identifiable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let kind: KubernetesClusterKind
    public let status: ClusterStatus
    public let ipAddress: String?
    public let kubernetesVersion: String?

    public enum ClusterStatus: String, Sendable {
        case running
        case stopped
        case starting
        case stopping
        case error
    }
}
