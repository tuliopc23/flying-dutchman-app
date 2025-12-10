import Foundation
import GRDB
import Shared
import FlyingDutchmanContainers

public final class DatabaseContainer {
    public static let shared = DatabaseContainer()
    public let dbQueue: DatabaseQueue

    private init() {
        let logger = Loggers.make(category: "flyingdutchman.persistence")
        let url = DatabaseContainer.databaseURL()
        do {
            dbQueue = try DatabaseQueue(path: url.path)
            try DatabaseContainer.migrator.migrate(dbQueue)
            logger.info("Initialized SQLite at \(url.path)")
        } catch {
            logger.error("Failed to open SQLite at \(url.path): \(error.localizedDescription). Using in-memory fallback.")
            dbQueue = try! DatabaseQueue()
        }
    }

    private static func databaseURL() -> URL {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let dir = base.appendingPathComponent(AppConfig.appName.lowercased(), isDirectory: true)
        try? fm.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appendingPathComponent("flyingdutchman.sqlite")
    }

    private static var migrator: DatabaseMigrator = {
        var migrator = DatabaseMigrator()
        migrator.registerMigration("v1_core_schema") { db in
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
        migrator.registerMigration("v2_stack_container_names") { db in
            if try db.tableExists("stacks"), try !db.columnExists("containerNames", in: "stacks") {
                try db.alter(table: "stacks") { t in
                    t.add(column: "containerNames", .text).notNull().defaults(to: "[]")
                }
            }
        }
        migrator.registerMigration("v3_networks_volumes") { db in
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
        migrator.registerMigration("v4_container_logs") { db in
            if try !db.tableExists("containerLogs") {
                try db.create(table: "containerLogs") { t in
                    t.autoIncrementedPrimaryKey("id")
                    t.column("containerId", .text).notNull().indexed()
                    t.column("line", .text).notNull()
                    t.column("createdAt", .datetime).notNull()
                }
            }
        }
        migrator.registerMigration("v5_shim_events") { db in
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
        return migrator
    }()
}
