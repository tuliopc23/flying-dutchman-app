import Foundation
import GRDB
import Shared

public struct StackStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    public func fetchAll() -> [StackSummary] {
        (try? dbQueue.read { db in
            try StackRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
    }

    public func seedIfEmpty(with summaries: [StackSummary]) {
        try? dbQueue.write { db in
            let existing = try StackRecord.fetchCount(db)
            guard existing == 0 else { return }
            for summary in summaries {
                try StackRecord(from: summary).insert(db)
            }
        }
    }

    public func create(_ request: StackCreateRequest) throws -> StackSummary {
        let summary = StackSummary(name: request.name, description: request.description, containerNames: request.containerNames)
        try dbQueue.write { db in
            try StackRecord(from: summary).insert(db)
        }
        return summary
    }

    public func fetch(id: UUID) -> StackSummary? {
        (try? dbQueue.read { db in
            try StackRecord
                .filter(Column("id") == id.uuidString)
                .fetchOne(db)?
                .toSummary()
        }) ?? nil
    }
}

private struct StackRecord: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var name: String
    var description: String?
    var createdAt: Date
    var containerNames: String

    static let databaseTableName = "stacks"

    init(from summary: StackSummary) {
        id = summary.id.uuidString
        name = summary.name
        description = summary.description
        createdAt = summary.createdAt
        containerNames = (try? JSONEncoder().encode(summary.containerNames)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
    }

    func toSummary() -> StackSummary {
        let containers: [String] = (try? JSONDecoder().decode([String].self, from: Data(containerNames.utf8))) ?? []
        return StackSummary(
            id: UUID(uuidString: id) ?? UUID(),
            name: name,
            description: description,
            createdAt: createdAt,
            containerNames: containers
        )
    }
}
