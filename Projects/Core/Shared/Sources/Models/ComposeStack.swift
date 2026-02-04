import Foundation

public struct ComposeStack: Identifiable, Hashable, Sendable {
    public let id: UUID
    public var name: String
    public var status: Status
    public var description: String?

    public enum Status: String, Sendable {
        case active
        case empty
    }

    public init(id: UUID = .init(), name: String, status: Status, description: String? = nil) {
        self.id = id
        self.name = name
        self.status = status
        self.description = description
    }
}

public extension ComposeStack {
    static var samples: [ComposeStack] {
        [
            .init(name: "Core Services", status: .active, description: "Nginx + API + Worker"),
            .init(name: "Empty Project", status: .empty, description: "Create your first stack"),
            .init(name: "Mobile Backend", status: .active, description: "Auth + Postgres + Redis")
        ]
    }
}

public typealias Project = ComposeStack
