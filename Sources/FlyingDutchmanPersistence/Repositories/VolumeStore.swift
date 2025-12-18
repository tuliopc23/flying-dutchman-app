import Foundation
import GRDB
import Shared

/// Thread-safe repository for volume persistence operations
public actor VolumeStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    // MARK: - Read Operations

    public func fetchAll() -> [VolumeSummary] {
        (try? dbQueue.read { db in
            try VolumeRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
    }

    public func fetch(id: UUID) throws -> VolumeSummary? {
        try dbQueue.read { db in
            try VolumeRecord
                .filter(Column("id") == id.uuidString)
                .fetchOne(db)?
                .toSummary()
        }
    }

    public func fetch(name: String) throws -> VolumeSummary? {
        try dbQueue.read { db in
            try VolumeRecord
                .filter(Column("name") == name)
                .fetchOne(db)?
                .toSummary()
        }
    }

    // MARK: - Write Operations

    public func insert(_ volume: VolumeSummary) throws {
        try dbQueue.write { db in
            try VolumeRecord(from: volume).insert(db)
        }
    }

    public func update(_ volume: VolumeSummary) throws {
        try dbQueue.write { db in
            var record = VolumeRecord(from: volume)
            record.updatedAt = Date()
            try record.update(db)
        }
    }

    public func upsert(_ volume: VolumeSummary) throws {
        try dbQueue.write { db in
            var record = VolumeRecord(from: volume)
            record.updatedAt = Date()
            try record.save(db)
        }
    }

    public func delete(id: UUID) throws {
        try dbQueue.write { db in
            try VolumeRecord
                .filter(Column("id") == id.uuidString)
                .deleteAll(db)
        }
    }

    public func replaceAll(with summaries: [VolumeSummary]) {
        try? dbQueue.write { db in
            try VolumeRecord.deleteAll(db)
            for summary in summaries {
                try VolumeRecord(from: summary).insert(db)
            }
        }
    }

    // MARK: - Utility

    public func count() throws -> Int {
        try dbQueue.read { db in
            try VolumeRecord.fetchCount(db)
        }
    }

    public func seedIfEmpty(with summaries: [VolumeSummary]) {
        try? dbQueue.write { db in
            let existing = try VolumeRecord.fetchCount(db)
            guard existing == 0 else { return }
            for summary in summaries {
                try VolumeRecord(from: summary).insert(db)
            }
        }
    }
}

private struct VolumeRecord: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var name: String
    var mountPath: String
    var sizeBytes: Int?
    var createdAt: Date
    var updatedAt: Date

    static let databaseTableName = "volumes"

    init(from summary: VolumeSummary) {
        id = summary.id.uuidString
        name = summary.name
        mountPath = summary.mountPath
        sizeBytes = summary.sizeBytes
        createdAt = summary.createdAt
        updatedAt = Date()
    }

    func toSummary() -> VolumeSummary {
        VolumeSummary(
            id: UUID(uuidString: id) ?? UUID(),
            name: name,
            mountPath: mountPath,
            sizeBytes: sizeBytes,
            createdAt: createdAt
        )
    }
}
