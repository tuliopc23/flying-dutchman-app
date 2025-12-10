import Foundation

public struct VolumeSummary: Codable, Identifiable, Hashable {
    public let id: UUID
    public var name: String
    public var mountPath: String
    public var sizeBytes: Int?
    public var createdAt: Date

    public init(
        id: UUID = UUID(),
        name: String,
        mountPath: String,
        sizeBytes: Int? = nil,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.mountPath = mountPath
        self.sizeBytes = sizeBytes
        self.createdAt = createdAt
    }
}
