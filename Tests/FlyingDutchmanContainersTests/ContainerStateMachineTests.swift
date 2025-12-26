import XCTest
@testable import FlyingDutchmanContainers
@testable import Shared

final class ContainerStateMachineTests: XCTestCase {
    var stateMachine: ContainerStateMachine!

    override func setUp() async throws {
        try await super.setUp()
        stateMachine = ContainerStateMachine(initialState: .created, containerID: UUID())
    }

    // MARK: - Valid State Transitions

    func testTransitionFromCreatedToStarting() async throws {
        try await stateMachine.transition(to: .starting)
        XCTAssertEqual(stateMachine.currentState, .starting)
    }

    func testTransitionFromCreatedToRemoving() async throws {
        try await stateMachine.transition(to: .removing)
        XCTAssertEqual(stateMachine.currentState, .removing)
    }

    func testTransitionFromStartingToRunning() async throws {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)
        XCTAssertEqual(stateMachine.currentState, .running)
    }

    func testTransitionFromStartingToStopped() async throws {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .stopped)
        XCTAssertEqual(stateMachine.currentState, .stopped)
    }

    func testTransitionFromRunningToStopping() async throws {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)
        try await stateMachine.transition(to: .stopping)
        XCTAssertEqual(stateMachine.currentState, .stopping)
    }

    func testTransitionFromStoppingToStopped() async throws {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)
        try await stateMachine.transition(to: .stopping)
        try await stateMachine.transition(to: .stopped)
        XCTAssertEqual(stateMachine.currentState, .stopped)
    }

    func testTransitionFromStoppingToRunning() async throws {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)
        try await stateMachine.transition(to: .stopping)
        try await stateMachine.transition(to: .running)
        XCTAssertEqual(stateMachine.currentState, .running)
    }

    func testTransitionFromStoppedToStarting() async throws {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .stopped)
        try await stateMachine.transition(to: .starting)
        XCTAssertEqual(stateMachine.currentState, .starting)
    }

    func testTransitionFromStoppedToRemoving() async throws {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .stopped)
        try await stateMachine.transition(to: .removing)
        XCTAssertEqual(stateMachine.currentState, .removing)
    }

    func testTransitionFromRemovingToRemoved() async throws {
        try await stateMachine.transition(to: .removing)
        try await stateMachine.transition(to: .removed)
        XCTAssertEqual(stateMachine.currentState, .removed)
    }

    // MARK: - Invalid State Transitions

    func testTransitionFromRemovedToAnyStateThrows() async {
        try await stateMachine.transition(to: .removing)
        try await stateMachine.transition(to: .removed)

        // Removed is a terminal state - no transitions allowed
        await assertAsyncThrows(
            try await stateMachine.transition(to: .created)
        )
        await assertAsyncThrows(
            try await stateMachine.transition(to: .starting)
        )
        await assertAsyncThrows(
            try await stateMachine.transition(to: .running)
        )
    }

    func testTransitionFromCreatedToRunningThrows() async {
        // Must go through starting first
        await assertAsyncThrows(
            try await stateMachine.transition(to: .running)
        )
        XCTAssertEqual(stateMachine.currentState, .created) // State unchanged
    }

    func testTransitionFromRunningToStartingThrows() async {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)

        // Cannot go back to starting from running
        await assertAsyncThrows(
            try await stateMachine.transition(to: .starting)
        )
    }

    func testTransitionFromStoppingToStartingThrows() async {
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)
        try await stateMachine.transition(to: .stopping)

        // Cannot skip stopped
        await assertAsyncThrows(
            try await stateMachine.transition(to: .starting)
        )
    }

    // MARK: - Can Transition Check

    func testCanTransitionReturnsTrueForValidTransitions() async {
        XCTAssertTrue(await stateMachine.canTransition(to: .starting))
        XCTAssertTrue(await stateMachine.canTransition(to: .removing))
        XCTAssertFalse(await stateMachine.canTransition(to: .running))
    }

    func testCanTransitionDoesNotMutateState() async {
        XCTAssertTrue(await stateMachine.canTransition(to: .starting))
        XCTAssertEqual(stateMachine.currentState, .created) // Unchanged
    }

    // MARK: - Force Set

    func testForceSetAllowsInvalidTransitions() async {
        try? await stateMachine.transition(to: .removing)
        try? await stateMachine.transition(to: .removed)

        // Force set ignores transition rules
        await stateMachine.forceSet(to: .running)
        XCTAssertEqual(stateMachine.currentState, .running)
    }

    // MARK: - State Change Callback

    func testStateChangeCallbackInvoked() async throws {
        var callbackInvocations: [(ContainerSummary.Status, ContainerSummary.Status)] = []

        stateMachine.onStateChange = { from, to in
            callbackInvocations.append((from, to))
        }

        try await stateMachine.transition(to: .starting)

        XCTAssertEqual(callbackInvocations.count, 1)
        XCTAssertEqual(callbackInvocations[0].0, .created)
        XCTAssertEqual(callbackInvocations[0].1, .starting)
    }

    func testStateChangeCallbackInvokedForForceSet() async {
        var callbackInvocations: [(ContainerSummary.Status, ContainerSummary.Status)] = []

        stateMachine.onStateChange = { from, to in
            callbackInvocations.append((from, to))
        }

        await stateMachine.forceSet(to: .running)

        XCTAssertEqual(callbackInvocations.count, 1)
        XCTAssertEqual(callbackInvocations[0].0, .created)
        XCTAssertEqual(callbackInvocations[0].1, .running)
    }

    func testStateChangeCallbackNotInvokedForInvalidTransition() async {
        var callbackInvoked = false

        stateMachine.onStateChange = { _, _ in
            callbackInvoked = true
        }

        // Invalid transition - callback should not be called
        _ = try? await stateMachine.transition(to: .running)

        XCTAssertFalse(callbackInvoked)
    }

    // MARK: - Full Lifecycle

    func testFullContainerLifecycle() async throws {
        var stateChanges: [ContainerSummary.Status] = []

        stateMachine.onStateChange = { from, to in
            stateChanges.append(to)
        }

        // Full lifecycle: created -> starting -> running -> stopping -> stopped -> removing -> removed
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)
        try await stateMachine.transition(to: .stopping)
        try await stateMachine.transition(to: .stopped)
        try await stateMachine.transition(to: .removing)
        try await stateMachine.transition(to: .removed)

        XCTAssertEqual(stateChanges, [.starting, .running, .stopping, .stopped, .removing, .removed])
    }

    func testRestartCycle() async throws {
        // Simulate a container restart
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)
        try await stateMachine.transition(to: .stopping)
        try await stateMachine.transition(to: .stopped)
        try await stateMachine.transition(to: .starting)
        try await stateMachine.transition(to: .running)

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
