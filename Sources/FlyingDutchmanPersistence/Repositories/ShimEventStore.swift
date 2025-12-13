import Foundation
import GRDB
import Shared

public struct ShimEventStore: EventRecorder, @unchecked Sendable {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    public func record(status: String, containerId: UUID?, image: String?, kind: String, timestamp: Date = Date()) {
        try? dbQueue.write { db in
            try ShimEventRecord(
                status: status,
                containerId: containerId?.uuidString,
                image: image,
                kind: kind,
                timestamp: timestamp
            ).insert(db)
            try pruneIfNeeded(db: db)
        }
    }

    public func recent(limit: Int = 50) -> [[String: Any]] {
        (try? dbQueue.read { db in
            try ShimEventRecord
                .order(Column("id").desc)
                .limit(limit)
                .fetchAll(db)
                .map { $0.toJSON() }
        }) ?? []
    }

    private func pruneIfNeeded(db: Database) throws {
        let count = try ShimEventRecord.fetchCount(db)
        let maxRetained = 500
        if count > maxRetained {
            let idsToDelete = try Int.fetchAll(db, sql: """
            SELECT id FROM shimEvents ORDER BY id ASC LIMIT ?
            """, arguments: [count - maxRetained])
            if !idsToDelete.isEmpty {
                try ShimEventRecord.deleteAll(db, keys: idsToDelete)
            }
        }
    }
}

private struct ShimEventRecord: Codable, FetchableRecord, PersistableRecord {
    var id: Int64?
    var status: String
    var containerId: String?
    var image: String?
    var kind: String
    var timestamp: Date

    static let databaseTableName = "shimEvents"

    func toJSON() -> [String: Any] {
        var dict: [String: Any] = [
            "status": status,
            "Action": kind,
            "time": Int(timestamp.timeIntervalSince1970)
        ]
        if let containerId { dict["id"] = containerId }
        if let image { dict["from"] = image }
        dict["Type"] = "container"
        return dict
    }
}
