import Foundation
import GRDB
import Shared

public final class MachineStore: Sendable {
    private let dbQueue: DatabaseQueue
    
    public init(dbQueue: DatabaseQueue? = nil) {
        if let dbQueue = dbQueue {
            self.dbQueue = dbQueue
        } else {
            let path = AppConfig.Database.machinesPath
            do {
                try FileManager.default.createDirectory(
                    at: URL(fileURLWithPath: path).deletingLastPathComponent(),
                    withIntermediateDirectories: true
                )
                self.dbQueue = try DatabaseQueue(path: path)
                try self.dbQueue.write { db in
                    try db.create(table: "machines", ifNotExists: true) { t in
                        t.column("id", .text).primaryKey()
                        t.column("name", .text).notNull()
                        t.column("distro", .text).notNull()
                        t.column("version", .text).notNull()
                        t.column("status", .text).notNull()
                        t.column("cpuCount", .integer).notNull()
                        t.column("memoryGB", .integer).notNull()
                        t.column("diskGB", .integer).notNull()
                        t.column("macAddress", .text)
                        t.column("ipAddress", .text)
                        t.column("sshPort", .integer)
                        t.column("createdAt", .datetime).notNull()
                        t.column("updatedAt", .datetime).notNull()
                    }
                    
                    if try !db.columns(in: "machines").contains(where: { $0.name == "macAddress" }) {
                        try db.alter(table: "machines") { t in
                            t.add(column: "macAddress", .text)
                        }
                    }
                }
            } catch {
                fatalError("Failed to initialize MachineStore: \(error)")
            }
        }
    }
    
    public func create(_ machine: Machine) throws {
        try dbQueue.write { db in
            try db.execute(
                sql: """
                INSERT INTO machines (id, name, distro, version, status, cpuCount, memoryGB, diskGB, macAddress, ipAddress, sshPort, createdAt, updatedAt)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """,
                arguments: [
                    machine.id,
                    machine.name,
                    machine.distro,
                    machine.version,
                    machine.status.rawValue,
                    machine.cpuCount,
                    machine.memoryGB,
                    machine.diskGB,
                    machine.macAddress,
                    machine.ipAddress,
                    machine.sshPort,
                    machine.createdAt,
                    machine.updatedAt
                ]
            )
        }
    }
    
    public func update(_ machine: Machine) throws {
        try dbQueue.write { db in
            try db.execute(
                sql: """
                UPDATE machines
                SET name = ?, distro = ?, version = ?, status = ?, cpuCount = ?, memoryGB = ?, diskGB = ?, macAddress = ?, ipAddress = ?, sshPort = ?, updatedAt = ?
                WHERE id = ?
                """,
                arguments: [
                    machine.name,
                    machine.distro,
                    machine.version,
                    machine.status.rawValue,
                    machine.cpuCount,
                    machine.memoryGB,
                    machine.diskGB,
                    machine.macAddress,
                    machine.ipAddress,
                    machine.sshPort,
                    Date(),
                    machine.id
                ]
            )
        }
    }
    
    public func delete(id: String) throws {
        try dbQueue.write { db in
            try db.execute(sql: "DELETE FROM machines WHERE id = ?", arguments: [id])
        }
    }
    
    public func fetch(id: String) throws -> Machine? {
        try dbQueue.read { db in
            try Row.fetchOne(db, sql: "SELECT * FROM machines WHERE id = ?", arguments: [id])
                .map(parseMachine)
        }
    }
    
    public func fetchAll() throws -> [Machine] {
        try dbQueue.read { db in
            try Row.fetchAll(db, sql: "SELECT * FROM machines ORDER BY createdAt DESC")
                .map(parseMachine)
        }
    }
    
    public func fetchByName(_ name: String) throws -> Machine? {
        try dbQueue.read { db in
            try Row.fetchOne(db, sql: "SELECT * FROM machines WHERE name = ?", arguments: [name])
                .map(parseMachine)
        }
    }
    
    private func parseMachine(_ row: Row) -> Machine {
        Machine(
            id: row["id"],
            name: row["name"],
            distro: row["distro"],
            version: row["version"],
            status: MachineStatus(rawValue: row["status"]) ?? .stopped,
            cpuCount: row["cpuCount"],
            memoryGB: row["memoryGB"],
            diskGB: row["diskGB"],
            macAddress: row["macAddress"],
            ipAddress: row["ipAddress"],
            sshPort: row["sshPort"],
            createdAt: row["createdAt"],
            updatedAt: row["updatedAt"]
        )
    }
}
