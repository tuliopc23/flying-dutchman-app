import Foundation
import GRDB
import Shared

/// Thread-safe repository for network persistence operations
public actor NetworkStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    // MARK: - Read Operations

    public func fetchAll() -> [NetworkSummary] {
        (try? dbQueue.read { db in
            try NetworkRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
    }

    public func fetch(id: UUID) throws -> NetworkSummary? {
        try dbQueue.read { db in
            try NetworkRecord
                .filter(Column("id") == id.uuidString)
                .fetchOne(db)?
                .toSummary()
        }
    }

    public func fetch(name: String) throws -> NetworkSummary? {
        try dbQueue.read { db in
            try NetworkRecord
                .filter(Column("name") == name)
                .fetchOne(db)?
                .toSummary()
        }
    }

    // MARK: - Write Operations

    public func insert(_ network: NetworkSummary) throws {
        try dbQueue.write { db in
            try NetworkRecord(from: network).insert(db)
        }
    }

    public func update(_ network: NetworkSummary) throws {
        try dbQueue.write { db in
            var record = NetworkRecord(from: network)
            record.updatedAt = Date()
            try record.update(db)
        }
    }

    public func upsert(_ network: NetworkSummary) throws {
        try dbQueue.write { db in
            var record = NetworkRecord(from: network)
            record.updatedAt = Date()
            try record.save(db)
        }
    }

    public func delete(id: UUID) throws {
        try dbQueue.write { db in
            try NetworkRecord
                .filter(Column("id") == id.uuidString)
                .deleteAll(db)
        }
    }

    public func replaceAll(with summaries: [NetworkSummary]) {
        try? dbQueue.write { db in
            try NetworkRecord.deleteAll(db)
            for summary in summaries {
                try NetworkRecord(from: summary).insert(db)
            }
        }
    }

    // MARK: - Utility

    public func count() throws -> Int {
        try dbQueue.read { db in
            try NetworkRecord.fetchCount(db)
        }
    }

    public func seedIfEmpty(with summaries: [NetworkSummary]) {
        try? dbQueue.write { db in
            let existing = try NetworkRecord.fetchCount(db)
            guard existing == 0 else { return }
            for summary in summaries {
                try NetworkRecord(from: summary).insert(db)
            }
        }
    }
}

private struct NetworkRecord: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var name: String
    var subnet: String?
    var connectedContainerIDs: String
    var createdAt: Date
    var updatedAt: Date

    static let databaseTableName = "networks"

    init(from summary: NetworkSummary) {
        id = summary.id.uuidString
        name = summary.name
        subnet = summary.subnet
        connectedContainerIDs = (try? JSONEncoder().encode(summary.connectedContainerIDs.map { $0.uuidString })).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
        createdAt = summary.createdAt
        updatedAt = Date()
    }

    func toSummary() -> NetworkSummary {
        let ids: [UUID] = (try? JSONDecoder().decode([String].self, from: Data(connectedContainerIDs.utf8)).compactMap { UUID(uuidString: $0) }) ?? []
        return NetworkSummary(
            id: UUID(uuidString: id) ?? UUID(),
            name: name,
            subnet: subnet,
            connectedContainerIDs: ids,
            createdAt: createdAt
        )
    }
}
