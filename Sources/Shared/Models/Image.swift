import Foundation

public struct ImageSummary: Codable, Identifiable, Hashable {
    public let id: UUID
    public var name: String
    public var tag: String
    public var digest: String?
    public var sizeBytes: Int?
    public var createdAt: Date

    public init(
        id: UUID = UUID(),
        name: String,
        tag: String,
        digest: String? = nil,
        sizeBytes: Int? = nil,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.tag = tag
        self.digest = digest
        self.sizeBytes = sizeBytes
        self.createdAt = createdAt
    }

    public var displayName: String { "\(name):\(tag)" }
}
