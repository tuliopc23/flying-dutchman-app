import Foundation
import GRDB
import Shared

public struct ImageStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    public func fetchAll() -> [ImageSummary] {
        (try? dbQueue.read { db in
            try ImageRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
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
