import Foundation

/// Events that can be emitted by a container during its lifecycle
public struct ContainerEvent: Identifiable, Sendable {
    public let id: UUID
    public let containerID: UUID
    public let type: EventType
    public let timestamp: Date

    public enum EventType: Sendable {
        /// Container state has changed (e.g., created -> starting)
        case stateChanged(from: ContainerSummary.Status, to: ContainerSummary.Status)

        /// Container produced log output
        case logOutput(String)

        /// Container resource usage updated
        case resourceUpdate(ResourceInfo)
    }

    public struct ResourceInfo: Sendable {
        public let cpuPercent: Double
        public let memoryBytes: Int
        public let memoryPercent: Double
        
        public init(cpuPercent: Double, memoryBytes: Int, memoryPercent: Double) {
            self.cpuPercent = cpuPercent
            self.memoryBytes = memoryBytes
            self.memoryPercent = memoryPercent
        }
    }

    public init(
        id: UUID = UUID(),
        containerID: UUID,
        type: EventType,
        timestamp: Date = Date()
    ) {
        self.id = id
        self.containerID = containerID
        self.type = type
        self.timestamp = timestamp
    }
}
