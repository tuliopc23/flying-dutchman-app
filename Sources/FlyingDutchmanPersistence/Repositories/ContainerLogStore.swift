import Foundation
import GRDB
import Shared

public struct ContainerLogStore: ContainerLogStoring {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    public func append(containerID: UUID, line: String, date: Date = Date()) {
        try? dbQueue.write { db in
            try ContainerLogRecord(containerId: containerID.uuidString, line: line, createdAt: date).insert(db)
            try pruneIfNeeded(db: db, containerID: containerID)
        }
    }

    public func fetch(containerID: UUID, limit: Int = 200) -> [String] {
        (try? dbQueue.read { db in
            try ContainerLogRecord
                .filter(Column("containerId") == containerID.uuidString)
                .order(Column("id").desc)
                .limit(limit)
                .fetchAll(db)
                .reversed()
                .map { $0.line }
        }) ?? []
    }

    private func pruneIfNeeded(db: Database, containerID: UUID, maxRetained: Int = 500) throws {
        let count = try ContainerLogRecord
            .filter(Column("containerId") == containerID.uuidString)
            .fetchCount(db)
        if count > maxRetained {
            let idsToDelete = try Int.fetchAll(db, sql: """
            SELECT id FROM containerLogs WHERE containerId = ? ORDER BY id ASC LIMIT ?
            """, arguments: [containerID.uuidString, count - maxRetained])
            if !idsToDelete.isEmpty {
                try ContainerLogRecord.deleteAll(db, keys: idsToDelete)
            }
        }
    }
}

private struct ContainerLogRecord: Codable, FetchableRecord, PersistableRecord {
    var id: Int64?
    var containerId: String
    var line: String
    var createdAt: Date

    static let databaseTableName = "containerLogs"
}
