import Foundation

public struct NetworkSummary: Codable, Identifiable, Hashable {
    public let id: UUID
    public var name: String
    public var subnet: String?
    public var connectedContainerIDs: [UUID]
    public var createdAt: Date

    public init(
        id: UUID = UUID(),
        name: String,
        subnet: String? = nil,
        connectedContainerIDs: [UUID] = [],
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.subnet = subnet
        self.connectedContainerIDs = connectedContainerIDs
        self.createdAt = createdAt
    }
}
