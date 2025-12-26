import Foundation
import GRDB
import Shared

/// Store for persisting container events for replay on reconnect
public actor ContainerEventStore {
    private let dbQueue: DatabaseQueue
    private let logger = Loggers.make(category: .containers)

    /// Maximum number of events to retain per container
    private let maxEventsPerContainer = 100

    /// Maximum age of events to retain (24 hours)
    private let maxEventAge: TimeInterval = 24 * 60 * 60

    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue) {
        self.dbQueue = dbQueue
    }

    /// Record a container event
    public func record(_ event: ContainerEvent) {
        do {
            try dbQueue.write { db in
                let record = ContainerEventRecord(from: event)
                try record.insert(db)

                // Prune old events
                try pruneOldEvents(db: db, containerID: event.containerID)
            }
        } catch {
            logger.error("Failed to record container event: \(error)")
        }
    }

    /// Get recent events for a specific container
    public func events(for containerID: UUID, limit: Int = 50) -> [ContainerEvent] {
        do {
            return try dbQueue.read { db in
                try ContainerEventRecord
                    .filter(Column("containerId") == containerID.uuidString)
                    .order(Column("timestamp").desc)
                    .limit(limit)
                    .fetchAll(db)
                    .map { $0.toContainerEvent() }
            }
        } catch {
            logger.error("Failed to fetch events for container \(containerID): \(error)")
            return []
        }
    }

    /// Get recent events across all containers
    public func recent(limit: Int = 100) -> [ContainerEvent] {
        do {
            return try dbQueue.read { db in
                try ContainerEventRecord
                    .order(Column("timestamp").desc)
                    .limit(limit)
                    .fetchAll(db)
                    .map { $0.toContainerEvent() }
                    .reversed() // Return in chronological order
            }
        } catch {
            logger.error("Failed to fetch recent events: \(error)")
            return []
        }
    }

    /// Delete all events for a specific container
    public func deleteEvents(for containerID: UUID) {
        do {
            try dbQueue.write { db in
                try ContainerEventRecord
                    .filter(Column("containerId") == containerID.uuidString)
                    .deleteAll(db)
            }
        } catch {
            logger.error("Failed to delete events for container \(containerID): \(error)")
        }
    }

    /// Prune old events for a container
    private func pruneOldEvents(db: Database, containerID: UUID) throws {
        // Delete events older than max age
        let cutoffDate = Date().addingTimeInterval(-maxEventAge)
        try ContainerEventRecord
            .filter(Column("containerId") == containerID.uuidString)
            .filter(Column("timestamp") < cutoffDate)
            .deleteAll(db)

        // If still too many events, delete oldest ones
        let count = try ContainerEventRecord
            .filter(Column("containerId") == containerID.uuidString)
            .fetchCount(db)

        if count > maxEventsPerContainer {
            let idsToDelete = try Int.fetchAll(db, sql: """
            SELECT id FROM containerEvents
            WHERE containerId = ?
            ORDER BY timestamp ASC
            LIMIT ?
            """, arguments: [containerID.uuidString, count - maxEventsPerContainer])

            if !idsToDelete.isEmpty {
                try ContainerEventRecord.deleteAll(db, keys: idsToDelete)
            }
        }
    }
}

// MARK: - Database Record

private struct ContainerEventRecord: Codable, FetchableRecord, PersistableRecord {
    var id: Int64?
    var eventId: String
    var containerId: String
    var eventType: String
    var eventData: Data  // JSON-encoded event-specific data
    var timestamp: Date

    static let databaseTableName = "containerEvents"

    init(from event: ContainerEvent) {
        self.id = nil
        self.eventId = event.id.uuidString
        self.containerId = event.containerID.uuidString
        self.timestamp = event.timestamp

        // Encode event type
        switch event.type {
        case .stateChanged:
            self.eventType = "stateChanged"
        case .logOutput:
            self.eventType = "logOutput"
        case .resourceUpdate:
            self.eventType = "resourceUpdate"
        }

        // Encode event-specific data
        self.eventData = (try? JSONEncoder().encode(event.type)) ?? Data()
    }

    func toContainerEvent() -> ContainerEvent? {
        guard let eventID = UUID(uuidString: eventId),
              let containerID = UUID(uuidString: containerId) else {
            return nil
        }

        let decoder = JSONDecoder()
        let eventType: ContainerEvent.EventType?

        switch self.eventType {
        case "stateChanged":
            eventType = try? decoder.decode(ContainerEvent.EventType.StateChanged.self, from: eventData)
        case "logOutput":
            eventType = try? decoder.decode(ContainerEvent.EventType.LogOutput.self, from: eventData)
        case "resourceUpdate":
            eventType = try? decoder.decode(ContainerEvent.EventType.ResourceUpdate.self, from: eventData)
        default:
            return nil
        }

        guard let type = eventType else {
            return nil
        }

        return ContainerEvent(id: eventID, containerID: containerID, type: type, timestamp: timestamp)
    }
}

// MARK: - Codable Event Types

extension ContainerEvent.EventType: Codable {
    enum CodingKeys: String, CodingKey {
        case type, from, to, message, cpuPercent, memoryBytes, memoryPercent
    }

    enum StateChanged {
        case stateChanged(from: ContainerSummary.Status, to: ContainerSummary.Status)
    }

    enum LogOutput {
        case logOutput(String)
    }

    enum ResourceUpdate {
        case resourceUpdate(ContainerEvent.ResourceInfo)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)

        switch type {
        case "stateChanged":
            let from = try container.decode(ContainerSummary.Status.self, forKey: .from)
            let to = try container.decode(ContainerSummary.Status.self, forKey: .to)
            self = .stateChanged(from: from, to: to)

        case "logOutput":
            let message = try container.decode(String.self, forKey: .message)
            self = .logOutput(message)

        case "resourceUpdate":
            let cpuPercent = try container.decode(Double.self, forKey: .cpuPercent)
            let memoryBytes = try container.decode(Int.self, forKey: .memoryBytes)
            let memoryPercent = try container.decode(Double.self, forKey: .memoryPercent)
            let resourceInfo = ContainerEvent.ResourceInfo(
                cpuPercent: cpuPercent,
                memoryBytes: memoryBytes,
                memoryPercent: memoryPercent
            )
            self = .resourceUpdate(resourceInfo)

        default:
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "Unknown event type: \(type)"
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .stateChanged(let from, let to):
            try container.encode("stateChanged", forKey: .type)
            try container.encode(from, forKey: .from)
            try container.encode(to, forKey: .to)

        case .logOutput(let message):
            try container.encode("logOutput", forKey: .type)
            try container.encode(message, forKey: .message)

        case .resourceUpdate(let info):
            try container.encode("resourceUpdate", forKey: .type)
            try container.encode(info.cpuPercent, forKey: .cpuPercent)
            try container.encode(info.memoryBytes, forKey: .memoryBytes)
            try container.encode(info.memoryPercent, forKey: .memoryPercent)
        }
    }
}
