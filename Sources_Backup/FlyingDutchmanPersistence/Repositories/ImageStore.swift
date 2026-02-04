import Foundation
import GRDB
import Shared

/// Thread-safe repository for image persistence operations
public actor ImageStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    // MARK: - Read Operations

    public nonisolated func fetchAll() -> [ImageSummary] {
        (try? dbQueue.read { db in
            try ImageRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
    }

    public func fetch(id: UUID) throws -> ImageSummary? {
        try dbQueue.read { db in
            try ImageRecord
                .filter(Column("id") == id.uuidString)
                .fetchOne(db)?
                .toSummary()
        }
    }

    public func fetch(name: String, tag: String) throws -> ImageSummary? {
        try dbQueue.read { db in
            try ImageRecord
                .filter(Column("name") == name && Column("tag") == tag)
                .fetchOne(db)?
                .toSummary()
        }
    }

    public func search(query: String) throws -> [ImageSummary] {
        try dbQueue.read { db in
            let pattern = "%\(query.lowercased())%"
            return try ImageRecord
                .filter(Column("name").lowercased.like(pattern))
                .fetchAll(db)
                .map { $0.toSummary() }
        }
    }

    // MARK: - Write Operations

    public func insert(_ image: ImageSummary) throws {
        try dbQueue.write { db in
            try ImageRecord(from: image).insert(db)
        }
    }

    public func update(_ image: ImageSummary) throws {
        try dbQueue.write { db in
            try ImageRecord(from: image).update(db)
        }
    }

    public func upsert(_ image: ImageSummary) throws {
        try dbQueue.write { db in
            try ImageRecord(from: image).save(db)
        }
    }

    public func delete(id: UUID) throws {
        try dbQueue.write { db in
            try ImageRecord
                .filter(Column("id") == id.uuidString)
                .deleteAll(db)
        }
    }

    // MARK: - Utility

    public func count() throws -> Int {
        try dbQueue.read { db in
            try ImageRecord.fetchCount(db)
        }
    }

    public func seedIfEmpty(with summaries: [ImageSummary]) {
        try? dbQueue.write { db in
            let existing = try ImageRecord.fetchCount(db)
            guard existing == 0 else { return }
            for summary in summaries {
                try ImageRecord(from: summary).insert(db)
            }
        }
    }
}

private struct ImageRecord: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var name: String
    var tag: String
    var digest: String?
    var sizeBytes: Int?
    var createdAt: Date

    static let databaseTableName = "images"

    init(from summary: ImageSummary) {
        id = summary.id.uuidString
        name = summary.name
        tag = summary.tag
        digest = summary.digest
        sizeBytes = summary.sizeBytes
        createdAt = summary.createdAt
    }

    func toSummary() -> ImageSummary {
        ImageSummary(
            id: UUID(uuidString: id) ?? UUID(),
            name: name,
            tag: tag,
            digest: digest,
            sizeBytes: sizeBytes,
            createdAt: createdAt
        )
    }
}
