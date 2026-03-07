import Foundation
import GRDB
import Shared

/// Thread-safe repository for UI state persistence
public actor UIStateStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    public nonisolated func get() -> UIState {
        (try? dbQueue.read { db in
            try UIStateRecord
                .order(Column("lastUpdated").desc)
                .fetchOne(db)?
                .toModel()
        }) ?? UIState()
    }

    public func save(_ state: UIState) throws {
        try dbQueue.write { db in
            try UIStateRecord.deleteAll(db)
            try UIStateRecord(from: state).insert(db)
        }
    }
}

private struct UIStateRecord: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var selectedSection: String
    var appearanceOverride: String?
    var engineHost: String
    var enginePort: Int
    var defaultFollowLogs: Bool
    var logsPollIntervalSeconds: Double
    var eventsPollIntervalSeconds: Double
    var eventsLimit: Int
    var defaultMachineCPUCount: Int
    var defaultMachineMemoryGB: Int
    var defaultMachineDiskGB: Int
    var defaultKubernetesCPUCount: Int
    var defaultKubernetesMemoryGB: Int
    var startEngineOnLaunch: Bool
    var launchAtLogin: Bool
    var lastUpdated: Date

    static let databaseTableName = "uiState"

    init(from model: UIState) {
        id = model.id.uuidString
        selectedSection = model.selectedSection
        appearanceOverride = model.appearanceOverride
        engineHost = model.engineHost
        enginePort = model.enginePort
        defaultFollowLogs = model.defaultFollowLogs
        logsPollIntervalSeconds = model.logsPollIntervalSeconds
        eventsPollIntervalSeconds = model.eventsPollIntervalSeconds
        eventsLimit = model.eventsLimit
        defaultMachineCPUCount = model.defaultMachineCPUCount
        defaultMachineMemoryGB = model.defaultMachineMemoryGB
        defaultMachineDiskGB = model.defaultMachineDiskGB
        defaultKubernetesCPUCount = model.defaultKubernetesCPUCount
        defaultKubernetesMemoryGB = model.defaultKubernetesMemoryGB
        startEngineOnLaunch = model.startEngineOnLaunch
        launchAtLogin = model.launchAtLogin
        lastUpdated = model.lastUpdated
    }

    func toModel() -> UIState {
        UIState(
            id: UUID(uuidString: id) ?? UUID(),
            selectedSection: selectedSection,
            appearanceOverride: appearanceOverride,
            engineHost: engineHost,
            enginePort: enginePort,
            defaultFollowLogs: defaultFollowLogs,
            logsPollIntervalSeconds: logsPollIntervalSeconds,
            eventsPollIntervalSeconds: eventsPollIntervalSeconds,
            eventsLimit: eventsLimit,
            defaultMachineCPUCount: defaultMachineCPUCount,
            defaultMachineMemoryGB: defaultMachineMemoryGB,
            defaultMachineDiskGB: defaultMachineDiskGB,
            defaultKubernetesCPUCount: defaultKubernetesCPUCount,
            defaultKubernetesMemoryGB: defaultKubernetesMemoryGB,
            startEngineOnLaunch: startEngineOnLaunch,
            launchAtLogin: launchAtLogin,
            lastUpdated: lastUpdated
        )
    }
}
