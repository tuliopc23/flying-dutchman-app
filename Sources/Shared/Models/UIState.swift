import Foundation
import SQLiteData

@Table
public struct UIState: Codable, Identifiable, Hashable, Sendable {
    public let id: UUID
    public var selectedSection: String
    public var appearanceOverride: String?
    public var engineHost: String
    public var enginePort: Int
    public var defaultFollowLogs: Bool
    public var logsPollIntervalSeconds: Double
    public var eventsPollIntervalSeconds: Double
    public var eventsLimit: Int
    public var lastUpdated: Date

    public init(
        id: UUID = UUID(),
        selectedSection: String = "containers",
        appearanceOverride: String? = nil,
        engineHost: String = AppConfig.Engine.host,
        enginePort: Int = AppConfig.Engine.port,
        defaultFollowLogs: Bool = false,
        logsPollIntervalSeconds: Double = 5,
        eventsPollIntervalSeconds: Double = 5,
        eventsLimit: Int = 50,
        lastUpdated: Date = .init()
    ) {
        self.id = id
        self.selectedSection = selectedSection
        self.appearanceOverride = appearanceOverride
        self.engineHost = engineHost
        self.enginePort = enginePort
        self.defaultFollowLogs = defaultFollowLogs
        self.logsPollIntervalSeconds = logsPollIntervalSeconds
        self.eventsPollIntervalSeconds = eventsPollIntervalSeconds
        self.eventsLimit = eventsLimit
        self.lastUpdated = lastUpdated
    }
}
