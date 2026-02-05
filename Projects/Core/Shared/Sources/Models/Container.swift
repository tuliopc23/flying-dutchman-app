import Foundation

public enum MountType: String, Codable, Sendable {
    case bind
    case volume
    case tmpfs
}

public struct MountSpec: Codable, Hashable, Sendable {
    public let source: String
    public let destination: String
    public let type: MountType
    public let readOnly: Bool

    public init(
        source: String,
        destination: String,
        type: MountType,
        readOnly: Bool = false
    ) {
        self.source = source
        self.destination = destination
        self.type = type
        self.readOnly = readOnly
    }
}

public struct ContainerSummary: Codable, Identifiable, Hashable, Sendable {
    public let id: UUID
    public var name: String
    public var image: String
    public var status: Status
    public var ports: [String]
    public var mounts: [MountSpec]
    public var createdAt: Date

    /// Path to exposed rootfs directory (nil if not running or not exposed)
    public var rootfsPath: String?

    /// Allocated IP address (Phase 2)
    public var ipAddress: String?

    /// Container labels (Phase 3.5)
    public var labels: [String: String]?

    public enum Status: String, Codable, Sendable {
        case created
        case starting
        case running
        case stopping
        case stopped
        case removing
        case removed

        public var displayName: String {
            rawValue.capitalized
        }

        public var isRunning: Bool {
            self == .running
        }

        public var isStopped: Bool {
            self == .stopped || self == .created || self == .removed
        }

        public var isTransient: Bool {
            self == .starting || self == .stopping || self == .removing
        }
    }

    public init(
        id: UUID = UUID(),
        name: String,
        image: String,
        status: Status,
        ports: [String],
        mounts: [MountSpec] = [],
        createdAt: Date = Date(),
        rootfsPath: String? = nil,
        ipAddress: String? = nil,
        labels: [String: String]? = nil
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.status = status
        self.ports = ports
        self.mounts = mounts
        self.createdAt = createdAt
        self.rootfsPath = rootfsPath
        self.ipAddress = ipAddress
        self.labels = labels
    }
}

public protocol AnyContainerStore: Sendable {
    func fetchAll() -> [ContainerSummary]
    func replaceAll(with summaries: [ContainerSummary])
}
