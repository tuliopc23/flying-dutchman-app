import AsyncHTTPClient
import Containerization
import ContainerizationExtras
import ContainerizationOCI
import FlyingDutchmanPersistence
import Foundation
import Logging
import NIOCore
import NIOTransportServices
import Shared
import SystemPackage

extension ContainerizationRuntime {
    public func eventStream() -> AsyncStream<ContainerEvent> {
        if let stream = _eventStream {
            return stream
        }
        let stream = AsyncStream<ContainerEvent> { continuation in
            self.eventContinuation = continuation
        }
        _eventStream = stream
        return stream
    }

    /// Emit a container event to all subscribers
    private func emitEvent(_ event: ContainerEvent) {
        eventContinuation?.yield(event)
    }

    /// Emit a state change event
    func emitStateChange(containerID: UUID, from: ContainerSummary.Status, to: ContainerSummary.Status) {
        let event = ContainerEvent(
            containerID: containerID,
            type: .stateChanged(from: from, to: to)
        )
        emitEvent(event)

        // Persist event for replay on reconnect
        Task {
            await eventStore.record(event)
        }
    }

    /// Emit a log output event
    private func emitLog(containerID: UUID, message: String) {
        let event = ContainerEvent(
            containerID: containerID,
            type: .logOutput(message)
        )
        emitEvent(event)
    }
}
