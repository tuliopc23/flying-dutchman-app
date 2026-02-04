@testable import FlyingDutchmanContainers
@testable import Shared
import XCTest

final class ContainerStateMachineTests: XCTestCase {
    var stateMachine: ContainerStateMachine!

    override func setUp() async throws {
        try await super.setUp()
        stateMachine = ContainerStateMachine(initialState: .created, containerID: UUID())
    }

    // MARK: - Valid State Transitions

    func testTransitionFromCreatedToStarting() throws {
        try stateMachine.transition(to: .starting)
        XCTAssertEqual(stateMachine.currentState, .starting)
    }

    func testTransitionFromCreatedToRemoving() throws {
        try stateMachine.transition(to: .removing)
        XCTAssertEqual(stateMachine.currentState, .removing)
    }

    func testTransitionFromStartingToRunning() throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)
        XCTAssertEqual(stateMachine.currentState, .running)
    }

    func testTransitionFromStartingToStopped() throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .stopped)
        XCTAssertEqual(stateMachine.currentState, .stopped)
    }

    func testTransitionFromRunningToStopping() throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)
        try stateMachine.transition(to: .stopping)
        XCTAssertEqual(stateMachine.currentState, .stopping)
    }

    func testTransitionFromStoppingToStopped() throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)
        try stateMachine.transition(to: .stopping)
        try stateMachine.transition(to: .stopped)
        XCTAssertEqual(stateMachine.currentState, .stopped)
    }

    func testTransitionFromStoppingToRunning() throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)
        try stateMachine.transition(to: .stopping)
        try stateMachine.transition(to: .running)
        XCTAssertEqual(stateMachine.currentState, .running)
    }

    func testTransitionFromStoppedToStarting() throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .stopped)
        try stateMachine.transition(to: .starting)
        XCTAssertEqual(stateMachine.currentState, .starting)
    }

    func testTransitionFromStoppedToRemoving() throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .stopped)
        try stateMachine.transition(to: .removing)
        XCTAssertEqual(stateMachine.currentState, .removing)
    }

    func testTransitionFromRemovingToRemoved() throws {
        try stateMachine.transition(to: .removing)
        try stateMachine.transition(to: .removed)
        XCTAssertEqual(stateMachine.currentState, .removed)
    }

    // MARK: - Invalid State Transitions

    func testTransitionFromRemovedToAnyStateThrows() async throws {
        try stateMachine.transition(to: .removing)
        try stateMachine.transition(to: .removed)

        // Removed is a terminal state - no transitions allowed
        try await assertAsyncThrows(
            stateMachine.transition(to: .created)
        )
        try await assertAsyncThrows(
            stateMachine.transition(to: .starting)
        )
        try await assertAsyncThrows(
            stateMachine.transition(to: .running)
        )
    }

    func testTransitionFromCreatedToRunningThrows() async {
        // Must go through starting first
        try await assertAsyncThrows(
            stateMachine.transition(to: .running)
        )
        XCTAssertEqual(stateMachine.currentState, .created) // State unchanged
    }

    func testTransitionFromRunningToStartingThrows() async throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)

        // Cannot go back to starting from running
        try await assertAsyncThrows(
            stateMachine.transition(to: .starting)
        )
    }

    func testTransitionFromStoppingToStartingThrows() async throws {
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)
        try stateMachine.transition(to: .stopping)

        // Cannot skip stopped
        try await assertAsyncThrows(
            stateMachine.transition(to: .starting)
        )
    }

    // MARK: - Can Transition Check

    func testCanTransitionReturnsTrueForValidTransitions() {
        XCTAssertTrue(stateMachine.canTransition(to: .starting))
        XCTAssertTrue(stateMachine.canTransition(to: .removing))
        XCTAssertFalse(stateMachine.canTransition(to: .running))
    }

    func testCanTransitionDoesNotMutateState() {
        XCTAssertTrue(stateMachine.canTransition(to: .starting))
        XCTAssertEqual(stateMachine.currentState, .created) // Unchanged
    }

    // MARK: - Force Set

    func testForceSetAllowsInvalidTransitions() {
        try? stateMachine.transition(to: .removing)
        try? stateMachine.transition(to: .removed)

        // Force set ignores transition rules
        stateMachine.forceSet(to: .running)
        XCTAssertEqual(stateMachine.currentState, .running)
    }

    // MARK: - State Change Callback

    func testStateChangeCallbackInvoked() throws {
        var callbackInvocations: [(ContainerSummary.Status, ContainerSummary.Status)] = []

        stateMachine.onStateChange = { from, to in
            callbackInvocations.append((from, to))
        }

        try stateMachine.transition(to: .starting)

        XCTAssertEqual(callbackInvocations.count, 1)
        XCTAssertEqual(callbackInvocations[0].0, .created)
        XCTAssertEqual(callbackInvocations[0].1, .starting)
    }

    func testStateChangeCallbackInvokedForForceSet() {
        var callbackInvocations: [(ContainerSummary.Status, ContainerSummary.Status)] = []

        stateMachine.onStateChange = { from, to in
            callbackInvocations.append((from, to))
        }

        stateMachine.forceSet(to: .running)

        XCTAssertEqual(callbackInvocations.count, 1)
        XCTAssertEqual(callbackInvocations[0].0, .created)
        XCTAssertEqual(callbackInvocations[0].1, .running)
    }

    func testStateChangeCallbackNotInvokedForInvalidTransition() {
        var callbackInvoked = false

        stateMachine.onStateChange = { _, _ in
            callbackInvoked = true
        }

        // Invalid transition - callback should not be called
        _ = try? stateMachine.transition(to: .running)

        XCTAssertFalse(callbackInvoked)
    }

    // MARK: - Full Lifecycle

    func testFullContainerLifecycle() throws {
        var stateChanges: [ContainerSummary.Status] = []

        stateMachine.onStateChange = { _, to in
            stateChanges.append(to)
        }

        // Full lifecycle: created -> starting -> running -> stopping -> stopped -> removing -> removed
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)
        try stateMachine.transition(to: .stopping)
        try stateMachine.transition(to: .stopped)
        try stateMachine.transition(to: .removing)
        try stateMachine.transition(to: .removed)

        XCTAssertEqual(stateChanges, [.starting, .running, .stopping, .stopped, .removing, .removed])
    }

    func testRestartCycle() throws {
        // Simulate a container restart
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)
        try stateMachine.transition(to: .stopping)
        try stateMachine.transition(to: .stopped)
        try stateMachine.transition(to: .starting)
        try stateMachine.transition(to: .running)

        XCTAssertEqual(stateMachine.currentState, .running)
    }

    // MARK: - Helper

    private func assertAsyncThrows(_ closure: @autoclosure () async throws -> Void) async {
        do {
            try await closure()
            XCTFail("Expected error was not thrown")
        } catch {
            // Expected
            XCTAssertTrue(error is ContainerError)
        }
    }
}
