import Foundation
import GRDB
import Shared

/// Thread-safe repository for container persistence operations
public actor ContainerStore: AnyContainerStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    // MARK: - Read Operations

    public nonisolated func fetchAll() -> [ContainerSummary] {
        (try? dbQueue.read { db in
            try ContainerRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
    }

    public func fetch(id: UUID) throws -> ContainerSummary? {
        try dbQueue.read { db in
            try ContainerRecord
                .filter(Column("id") == id.uuidString)
                .fetchOne(db)?
                .toSummary()
        }
    }

    public func fetchRunning() throws -> [ContainerSummary] {
        try dbQueue.read { db in
            try ContainerRecord
                .filter(Column("status") == ContainerSummary.Status.running.rawValue)
                .fetchAll(db)
                .map { $0.toSummary() }
        }
    }

    public func search(query: String) throws -> [ContainerSummary] {
        try dbQueue.read { db in
            let pattern = "%\(query.lowercased())%"
            return try ContainerRecord
                .filter(
                    Column("name").lowercased.like(pattern) ||
                    Column("image").lowercased.like(pattern)
                )
                .fetchAll(db)
                .map { $0.toSummary() }
        }
    }

    // MARK: - Write Operations

    public func insert(_ container: ContainerSummary) throws {
        try dbQueue.write { db in
            try ContainerRecord(from: container).insert(db)
        }
    }

    public func update(_ container: ContainerSummary) throws {
        try dbQueue.write { db in
            var record = ContainerRecord(from: container)
            record.updatedAt = Date()
            try record.update(db)
        }
    }

    public func upsert(_ container: ContainerSummary) throws {
        try dbQueue.write { db in
            var record = ContainerRecord(from: container)
            record.updatedAt = Date()
            try record.save(db) // insert or update
        }
    }

    public func delete(id: UUID) throws {
        try dbQueue.write { db in
            try ContainerRecord
                .filter(Column("id") == id.uuidString)
                .deleteAll(db)
        }
    }

    public nonisolated func replaceAll(with summaries: [ContainerSummary]) {
        try? dbQueue.write { db in
            try ContainerRecord.deleteAll(db)
            for summary in summaries {
                try ContainerRecord(from: summary).insert(db)
            }
        }
    }

    // MARK: - Utility

    public func count() throws -> Int {
        try dbQueue.read { db in
            try ContainerRecord.fetchCount(db)
        }
    }

    public func seedIfEmpty(with summaries: [ContainerSummary]) {
        try? dbQueue.write { db in
            let existing = try ContainerRecord.fetchCount(db)
            guard existing == 0 else { return }
            for summary in summaries {
                try ContainerRecord(from: summary).insert(db)
            }
        }
    }
}

private struct ContainerRecord: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var name: String
    var image: String
    var status: String
    var ports: String
    var createdAt: Date
    var updatedAt: Date

    static let databaseTableName = "containers"

    init(from summary: ContainerSummary) {
        id = summary.id.uuidString
        name = summary.name
        image = summary.image
        status = summary.status.rawValue
        ports = (try? JSONEncoder().encode(summary.ports)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
        createdAt = summary.createdAt
        updatedAt = Date()
    }

    func toSummary() -> ContainerSummary {
        let portArray: [String] = (try? JSONDecoder().decode([String].self, from: Data(ports.utf8))) ?? []
        return ContainerSummary(
            id: UUID(uuidString: id) ?? UUID(),
            name: name,
            image: image,
            status: ContainerSummary.Status(rawValue: status) ?? .stopped,
            ports: portArray,
            createdAt: createdAt
        )
    }
}
