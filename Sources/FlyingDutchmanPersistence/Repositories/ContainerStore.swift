import Foundation
import GRDB
import Shared

public struct ContainerStore {
    private let dbQueue: DatabaseQueue

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    public func fetchAll() -> [ContainerSummary] {
        (try? dbQueue.read { db in
            try ContainerRecord.fetchAll(db).map { $0.toSummary() }
        }) ?? []
    }

    public func replaceAll(with summaries: [ContainerSummary]) {
        try? dbQueue.write { db in
            try ContainerRecord.deleteAll(db)
            for summary in summaries {
                try ContainerRecord(from: summary).insert(db)
            }
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
