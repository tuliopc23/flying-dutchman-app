import Foundation
import GRDB
import Shared

public struct VolumeStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    public func fetchAll() -> [VolumeSummary] {
        (try? dbQueue.read { db in
            try VolumeRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
    }

    public func replaceAll(with summaries: [VolumeSummary]) {
        try? dbQueue.write { db in
            try VolumeRecord.deleteAll(db)
            for summary in summaries {
                try VolumeRecord(from: summary).insert(db)
            }
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
