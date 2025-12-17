import Foundation
import SwiftData

@Model
public final class UIState {
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
