import Foundation
import Shared
import Logging

/// State machine that enforces valid container state transitions
public actor ContainerStateMachine {
    private let logger = Loggers.make(category: .containers)
    private let containerID: UUID

    /// Valid state transitions: from -> [to]
    private let validTransitions: [ContainerSummary.Status: [ContainerSummary.Status]] = [
        .created: [.starting, .removing],
        .starting: [.running, .stopped],
        .running: [.stopping],
        .stopping: [.stopped, .running],
        .stopped: [.starting, .removing],
        .removing: [.removed],
        .removed: []
    ]

    /// Current state of the container
    private(set) public var currentState: ContainerSummary.Status

    /// Optional callback for state changes (ContainerizationRuntime uses this to emit events)
    var onStateChange: ((ContainerSummary.Status, ContainerSummary.Status) -> Void)?

    public init(initialState: ContainerSummary.Status = .created, containerID: UUID = UUID()) {
        self.currentState = initialState
        self.containerID = containerID
    }

    /// Attempt to transition to a new state
    /// - Parameter newState: The desired state to transition to
    /// - Throws: ContainerError.invalidState if the transition is invalid
    public func transition(to newState: ContainerSummary.Status) throws {
        let oldState = currentState
        guard canTransition(to: newState) else {
            let reason = "Cannot transition from \(currentState.rawValue) to \(newState.rawValue)"
            logger.error("Invalid state transition: \(reason)")
            throw ContainerError.invalidState(reason)
        }

        logger.info("Container state transition: \(currentState.rawValue) -> \(newState.rawValue)")
        currentState = newState

        // Notify callback about the state change
        onStateChange?(oldState, newState)
    }

    /// Check if a transition to a new state is valid without mutating state
    /// - Parameter newState: The desired state to check
    /// - Returns: true if the transition is valid, false otherwise
    public func canTransition(to newState: ContainerSummary.Status) -> Bool {
        guard let allowedStates = validTransitions[currentState] else {
            return false
        }
        return allowedStates.contains(newState)
    }

    /// Force set the state (use only for reconciliation scenarios)
    /// - Parameter newState: The state to set without validation
    public func forceSet(to newState: ContainerSummary.Status) {
        let oldState = currentState
        logger.warning("Forcing state change: \(currentState.rawValue) -> \(newState.rawValue)")
        currentState = newState

        // Notify callback about the state change
        onStateChange?(oldState, newState)
    }
}

