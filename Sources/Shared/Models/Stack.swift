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

public struct StackCreateRequest: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    public var containerNames: [String]

    public init(name: String, description: String? = nil, containerNames: [String] = []) {
        self.name = name
        self.description = description
        self.containerNames = containerNames
    }
}

public struct StackActionResponse: Codable, Hashable, Sendable {
    public var stack: StackSummary
    public var affectedContainers: [ContainerSummary]
    public var errors: [String]

    public init(stack: StackSummary, affectedContainers: [ContainerSummary], errors: [String] = []) {
        self.stack = stack
        self.affectedContainers = affectedContainers
        self.errors = errors
    }
}
