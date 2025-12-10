import Foundation

public struct DockerEvent: Codable, Identifiable, Hashable {
    public let id: String
    public let status: String
    public let from: String?
    public let type: String
    public let action: String
    public let time: Int

    public init(
        id: String,
        status: String,
        from: String?,
        type: String = "container",
        action: String,
        time: Int
    ) {
        self.id = id
        self.status = status
        self.from = from
        self.type = type
        self.action = action
        self.time = time
    }
}
