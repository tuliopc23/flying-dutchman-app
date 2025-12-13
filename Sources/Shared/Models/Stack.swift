import Foundation

public struct StackSummary: Codable, Identifiable, Hashable, Sendable {
    public let id: UUID
    public var name: String
    public var description: String?
    public var createdAt: Date
    public var containerNames: [String]

    public init(
        id: UUID = UUID(),
        name: String,
        description: String? = nil,
        createdAt: Date = Date(),
        containerNames: [String] = []
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.createdAt = createdAt
        self.containerNames = containerNames
    }
}
