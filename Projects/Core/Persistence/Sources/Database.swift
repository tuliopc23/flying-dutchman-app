import Foundation
import GRDB
import Shared

public final class DatabaseContainer: @unchecked Sendable {
    public static let shared = DatabaseContainer()
    public let dbQueue: DatabaseQueue

    private init() {
        let logger = Loggers.make(category: "flyingdutchman.persistence")
        let url = DatabaseContainer.databaseURL()

        var queue: DatabaseQueue
        do {
            queue = try DatabaseQueue(path: url.path)
            try DatabaseContainer.migrator.migrate(queue)
            logger.info("Initialized SQLite at \(url.path)")
        } catch {
            logger
                .error("Failed to open SQLite at \(url.path): \(error.localizedDescription). Using in-memory fallback.")
            do {
                queue = try DatabaseQueue()
            } catch {
                fatalError("Failed to create in-memory fallback database: \(error)")
            }
        }

        dbQueue = queue
    }

    private static func databaseURL() -> URL {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let dir = base.appendingPathComponent(AppConfig.appName.lowercased(), isDirectory: true)
        try? fm.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appendingPathComponent("flyingdutchman.sqlite")
    }

    static let migrator: DatabaseMigrator = {
        var migrator = DatabaseMigrator()
        migrator.registerMigration("v1_core_schema", migrate: DatabaseContainer.migrateV1CoreSchema)
        migrator.registerMigration("v3_networks_volumes", migrate: DatabaseContainer.migrateV3NetworksVolumes)
        migrator.registerMigration("v4_container_logs", migrate: DatabaseContainer.migrateV4ContainerLogs)
        migrator.registerMigration("v5_shim_events", migrate: DatabaseContainer.migrateV5ShimEvents)
        migrator.registerMigration("v6_container_events", migrate: DatabaseContainer.migrateV6ContainerEvents)
        migrator.registerMigration("v7_blob_metadata", migrate: DatabaseContainer.migrateV7BlobMetadata)
        migrator.registerMigration("v8_container_mounts", migrate: DatabaseContainer.migrateV8ContainerMounts)
        migrator.registerMigration("v5_ui_state", migrate: DatabaseContainer.migrateV5UIState)
        migrator.registerMigration("v9_ui_state_preferences", migrate: DatabaseContainer.migrateV9UIStatePreferences)
        migrator.registerMigration("v10_container_labels", migrate: DatabaseContainer.migrateV10ContainerLabels)
        return migrator
    }()

    // MARK: - Migrations

    private static func migrateV1CoreSchema(_ db: GRDB.Database) throws {
        try db.create(table: "containers") { t in
            t.column("id", .text).primaryKey()
            t.column("name", .text).notNull()
            t.column("image", .text).notNull()
            t.column("status", .text).notNull()
            t.column("ports", .text).notNull()
            t.column("createdAt", .datetime).notNull()
            t.column("updatedAt", .datetime).notNull()
        }

        try db.create(table: "images") { t in
            t.column("id", .text).primaryKey()
            t.column("name", .text).notNull()
            t.column("tag", .text).notNull()
            t.column("digest", .text)
            t.column("sizeBytes", .integer)
            t.column("createdAt", .datetime).notNull()
        }

        try db.create(table: "stacks") { t in
            t.column("id", .text).primaryKey()
            t.column("name", .text).notNull()
            t.column("description", .text)
            t.column("createdAt", .datetime).notNull()
            t.column("containerNames", .text).notNull().defaults(to: "[]")
        }

        try db.create(table: "containerStacks") { t in
            t.column("containerId", .text).notNull().indexed().references("containers", onDelete: .cascade)
            t.column("stackId", .text).notNull().indexed().references("stacks", onDelete: .cascade)
            t.primaryKey(["containerId", "stackId"])
        }
    }

    private static func migrateV3NetworksVolumes(_ db: GRDB.Database) throws {
        if try !db.tableExists("volumes") {
            try db.create(table: "volumes") { t in
                t.column("id", .text).primaryKey()
                t.column("name", .text).notNull()
                t.column("mountPath", .text).notNull()
                t.column("sizeBytes", .integer)
                t.column("createdAt", .datetime).notNull()
                t.column("updatedAt", .datetime).notNull()
            }
        }

        if try !db.tableExists("networks") {
            try db.create(table: "networks") { t in
                t.column("id", .text).primaryKey()
                t.column("name", .text).notNull()
                t.column("subnet", .text)
                t.column("connectedContainerIDs", .text).notNull().defaults(to: "[]")
                t.column("createdAt", .datetime).notNull()
                t.column("updatedAt", .datetime).notNull()
            }
        }
    }

    private static func migrateV4ContainerLogs(_ db: GRDB.Database) throws {
        if try !db.tableExists("containerLogs") {
            try db.create(table: "containerLogs") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("containerId", .text).notNull().indexed()
                t.column("line", .text).notNull()
                t.column("createdAt", .datetime).notNull()
            }
        }
    }

    private static func migrateV5ShimEvents(_ db: GRDB.Database) throws {
        if try !db.tableExists("shimEvents") {
            try db.create(table: "shimEvents") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("status", .text).notNull()
                t.column("containerId", .text)
                t.column("image", .text)
                t.column("kind", .text).notNull()
                t.column("timestamp", .datetime).notNull()
            }
        }
    }

    private static func migrateV6ContainerEvents(_ db: GRDB.Database) throws {
        if try !db.tableExists("containerEvents") {
            try db.create(table: "containerEvents") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("eventId", .text).notNull().unique()
                t.column("containerId", .text).notNull().indexed()
                t.column("eventType", .text).notNull()
                t.column("eventData", .blob).notNull()
                t.column("timestamp", .datetime).notNull().indexed()
            }
        }
    }

    private static func migrateV7BlobMetadata(_ db: GRDB.Database) throws {
        if try !db.tableExists("blobMetadata") {
            try db.create(table: "blobMetadata") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("digest", .text).notNull().unique()
                t.column("size", .integer).notNull()
                t.column("lastAccessed", .datetime).notNull().indexed()
            }
        }
    }

    private static func migrateV8ContainerMounts(_ db: GRDB.Database) throws {
        if try !db.columns(in: "containers").contains(where: { $0.name == "mounts" }) {
            try db.alter(table: "containers") { t in
                t.add(column: "mounts", .text).notNull().defaults(to: "[]")
            }
        }
    }

    private static func migrateV5UIState(_ db: GRDB.Database) throws {
        if try !db.tableExists("uiState") {
            try db.create(table: "uiState") { t in
                t.column("id", .text).primaryKey()
                t.column("selectedSection", .text).notNull()
                t.column("appearanceOverride", .text)
                t.column("engineHost", .text).notNull()
                t.column("enginePort", .integer).notNull()
                t.column("defaultFollowLogs", .boolean).notNull()
                t.column("logsPollIntervalSeconds", .double).notNull()
                t.column("eventsPollIntervalSeconds", .double).notNull()
                t.column("eventsLimit", .integer).notNull()
                t.column("defaultMachineCPUCount", .integer).notNull().defaults(to: 2)
                t.column("defaultMachineMemoryGB", .integer).notNull().defaults(to: 2)
                t.column("defaultMachineDiskGB", .integer).notNull().defaults(to: 20)
                t.column("defaultKubernetesCPUCount", .integer).notNull().defaults(to: 2)
                t.column("defaultKubernetesMemoryGB", .integer).notNull().defaults(to: 2)
                t.column("startEngineOnLaunch", .boolean).notNull().defaults(to: true)
                t.column("launchAtLogin", .boolean).notNull().defaults(to: false)
                t.column("lastUpdated", .datetime).notNull()
            }
        }
    }

    private static func migrateV9UIStatePreferences(_ db: GRDB.Database) throws {
        if try db.tableExists("uiState") {
            let columns = try db.columns(in: "uiState")
            let hasColumn = { (name: String) in columns.contains { $0.name == name } }
            try db.alter(table: "uiState") { t in
                if !hasColumn("defaultMachineCPUCount") {
                    t.add(column: "defaultMachineCPUCount", .integer)
                        .notNull()
                        .defaults(to: 2)
                }
                if !hasColumn("defaultMachineMemoryGB") {
                    t.add(column: "defaultMachineMemoryGB", .integer)
                        .notNull()
                        .defaults(to: 2)
                }
                if !hasColumn("defaultMachineDiskGB") {
                    t.add(column: "defaultMachineDiskGB", .integer)
                        .notNull()
                        .defaults(to: 20)
                }
                if !hasColumn("defaultKubernetesCPUCount") {
                    t.add(column: "defaultKubernetesCPUCount", .integer)
                        .notNull()
                        .defaults(to: 2)
                }
                if !hasColumn("defaultKubernetesMemoryGB") {
                    t.add(column: "defaultKubernetesMemoryGB", .integer)
                        .notNull()
                        .defaults(to: 2)
                }
                if !hasColumn("startEngineOnLaunch") {
                    t.add(column: "startEngineOnLaunch", .boolean)
                        .notNull()
                        .defaults(to: true)
                }
                if !hasColumn("launchAtLogin") {
                    t.add(column: "launchAtLogin", .boolean)
                        .notNull()
                        .defaults(to: false)
                }
            }
        }
    }

    private static func migrateV10ContainerLabels(_ db: GRDB.Database) throws {
        if try !db.columns(in: "containers").contains(where: { $0.name == "labels" }) {
            try db.alter(table: "containers") { t in
                t.add(column: "labels", .text).notNull().defaults(to: "{}")
            }
        }
    }
}
