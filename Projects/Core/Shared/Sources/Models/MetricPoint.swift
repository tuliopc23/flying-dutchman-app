import Foundation

public struct MetricPoint: Codable, Sendable, Identifiable {
    public let id: UUID
    public let timestamp: Date
    public let metricType: String // "cpu", "memory", "network_in", "network_out"
    public let value: Double
    public let resourceID: String? // Container ID or Machine ID

    public init(
        id: UUID = UUID(),
        timestamp: Date = Date(),
        metricType: String,
        value: Double,
        resourceID: String? = nil
    ) {
        self.id = id
        self.timestamp = timestamp
        self.metricType = metricType
        self.value = value
        self.resourceID = resourceID
    }
}
