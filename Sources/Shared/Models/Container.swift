import Foundation

public struct ContainerSummary: Codable, Identifiable, Hashable, Sendable {
    public let id: UUID
    public var name: String
    public var image: String
    public var status: Status
    public var ports: [String]
    public var createdAt: Date

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
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.status = status
        self.ports = ports
        self.createdAt = createdAt
    }
}

public protocol AnyContainerStore: Sendable {
    func fetchAll() -> [ContainerSummary]
    func replaceAll(with summaries: [ContainerSummary])
}
