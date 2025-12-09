import Foundation

public struct ContainerSummary: Codable, Identifiable, Hashable {
    public let id: UUID
    public var name: String
    public var image: String
    public var status: Status
    public var ports: [String]
    public var createdAt: Date

    public enum Status: String, Codable {
        case running
        case stopped
        case paused

        public var displayName: String {
            rawValue.capitalized
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
