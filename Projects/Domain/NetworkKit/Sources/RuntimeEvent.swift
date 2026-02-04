import Foundation
import Shared

public struct RuntimeEvent: Codable, Identifiable, Sendable {
    public let id: String
    public let containerId: String
    public let type: EventType
    public let timestamp: Date

    public struct ResourceInfo: Codable, Sendable {
        public let cpuPercent: Double
        public let memoryBytes: Int
        public let memoryPercent: Double

        public init(cpuPercent: Double, memoryBytes: Int, memoryPercent: Double) {
            self.cpuPercent = cpuPercent
            self.memoryBytes = memoryBytes
            self.memoryPercent = memoryPercent
        }
    }

    public enum EventType: Sendable {
        case stateChanged(from: ContainerSummary.Status, to: ContainerSummary.Status)
        case logOutput(String)
        case resourceUpdate(ResourceInfo)
    }

    public init(id: String, containerId: String, type: EventType, timestamp: Date) {
        self.id = id
        self.containerId = containerId
        self.type = type
        self.timestamp = timestamp
    }
}

extension RuntimeEvent.EventType: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case from
        case to
        case message
        case cpuPercent
        case memoryBytes
        case memoryPercent
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
            self = .resourceUpdate(.init(
                cpuPercent: cpuPercent,
                memoryBytes: memoryBytes,
                memoryPercent: memoryPercent
            ))
        default:
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "Unknown runtime event type: \(type)"
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case let .stateChanged(from, to):
            try container.encode("stateChanged", forKey: .type)
            try container.encode(from, forKey: .from)
            try container.encode(to, forKey: .to)
        case let .logOutput(message):
            try container.encode("logOutput", forKey: .type)
            try container.encode(message, forKey: .message)
        case let .resourceUpdate(info):
            try container.encode("resourceUpdate", forKey: .type)
            try container.encode(info.cpuPercent, forKey: .cpuPercent)
            try container.encode(info.memoryBytes, forKey: .memoryBytes)
            try container.encode(info.memoryPercent, forKey: .memoryPercent)
        }
    }
}
