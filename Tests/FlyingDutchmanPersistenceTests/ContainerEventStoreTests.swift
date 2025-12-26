import XCTest
@testable import FlyingDutchmanPersistence
@testable import Shared

final class ContainerEventStoreTests: XCTestCase {
    var eventStore: ContainerEventStore!
    var dbQueue: DatabaseQueue!

    override func setUp() async throws {
        try await super.setUp()

        // Create isolated database
        dbQueue = try DatabaseQueue()
        try DatabaseContainer.migrator.migrate(dbQueue)

        eventStore = ContainerEventStore(dbQueue: dbQueue)
    }

    // MARK: - Record Event

    func testRecordStateChangeEvent() async {
        let event = ContainerEvent(
            containerID: UUID(),
            type: .stateChanged(from: .created, to: .starting)
        )

        await eventStore.record(event)

        let retrieved = eventStore.events(for: event.containerID)
        XCTAssertEqual(retrieved.count, 1)
        XCTAssertEqual(retrieved[0].id, event.id)
        XCTAssertEqual(retrieved[0].containerID, event.containerID)
    }

    func testRecordLogOutputEvent() async {
        let event = ContainerEvent(
            containerID: UUID(),
            type: .logOutput("Test log message")
        )

        await eventStore.record(event)

        let retrieved = eventStore.events(for: event.containerID)
        XCTAssertEqual(retrieved.count, 1)

        if case .logOutput(let message) = retrieved[0].type {
            XCTAssertEqual(message, "Test log message")
        } else {
            XCTFail("Expected logOutput event type")
        }
    }

    func testRecordResourceUpdateEvent() async {
        let event = ContainerEvent(
            containerID: UUID(),
            type: .resourceUpdate(
                ContainerEvent.ResourceInfo(
                    cpuPercent: 50.0,
                    memoryBytes: 512 * 1024 * 1024,
                    memoryPercent: 25.0
                )
            )
        )

        await eventStore.record(event)

        let retrieved = eventStore.events(for: event.containerID)
        XCTAssertEqual(retrieved.count, 1)

        if case .resourceUpdate(let info) = retrieved[0].type {
            XCTAssertEqual(info.cpuPercent, 50.0)
            XCTAssertEqual(info.memoryBytes, 512 * 1024 * 1024)
            XCTAssertEqual(info.memoryPercent, 25.0)
        } else {
            XCTFail("Expected resourceUpdate event type")
        }
    }

    func testRecordMultipleEvents() async {
        let containerID = UUID()

        for i in 0..<5 {
            let event = ContainerEvent(
                containerID: containerID,
                type: .stateChanged(from: .stopped, to: .running)
            )
            await eventStore.record(event)
        }

        let retrieved = eventStore.events(for: containerID, limit: 10)
        XCTAssertEqual(retrieved.count, 5)
    }

    // MARK: - Fetch Events

    func testFetchEventsForContainer() async {
        let containerID = UUID()

        let event1 = ContainerEvent(
            containerID: containerID,
            type: .logOutput("Log 1")
        )
        let event2 = ContainerEvent(
            containerID: UUID(),  // Different container
            type: .logOutput("Log 2")
        )

        await eventStore.record(event1)
        await eventStore.record(event2)

        let retrieved = eventStore.events(for: containerID)
        XCTAssertEqual(retrieved.count, 1)
        XCTAssertEqual(retrieved[0].containerID, containerID)
    }

    func testFetchEventsWithLimit() async {
        let containerID = UUID()

        for i in 0..<10 {
            let event = ContainerEvent(
                containerID: containerID,
                type: .logOutput("Log \(i)")
            )
            await eventStore.record(event)
        }

        let retrieved = eventStore.events(for: containerID, limit: 5)
        XCTAssertEqual(retrieved.count, 5)
    }

    func testFetchEventsEmptyInitially() {
        let events = eventStore.events(for: UUID())
        XCTAssertTrue(events.isEmpty)
    }

    func testRecentEventsReturnsChronological() async throws {
        let events = (0..<3).map { i -> ContainerEvent in
            ContainerEvent(
                containerID: UUID(),
                type: .logOutput("Log \(i)")
            )
        }

        for event in events {
            await eventStore.record(event)
        }

        let retrieved = eventStore.recent(limit: 10)

        // Should be in chronological order (oldest first)
        XCTAssertEqual(retrieved.count, 3)
        XCTAssertEqual(retrieved[0].id, events[0].id)
        XCTAssertEqual(retrieved[1].id, events[1].id)
        XCTAssertEqual(retrieved[2].id, events[2].id)
    }

    // MARK: - Delete Events

    func testDeleteEventsForContainer() async {
        let containerID = UUID()
        let otherContainerID = UUID()

        await eventStore.record(ContainerEvent(containerID: containerID, type: .logOutput("Log 1")))
        await eventStore.record(ContainerEvent(containerID: otherContainerID, type: .logOutput("Log 2")))

        await eventStore.deleteEvents(for: containerID)

        let retrieved = eventStore.events(for: containerID)
        XCTAssertTrue(retrieved.isEmpty)

        let otherRetrieved = eventStore.events(for: otherContainerID)
        XCTAssertEqual(otherRetrieved.count, 1)
    }

    func testDeleteEventsForNonExistentContainerSucceeds() async {
        // Should not throw
        await eventStore.deleteEvents(for: UUID())
    }

    // MARK: - Event Persistence

    func testEventTypeIsPersisted() async {
        let event = ContainerEvent(
            containerID: UUID(),
            type: .stateChanged(from: .created, to: .starting)
        )

        await eventStore.record(event)

        let retrieved = eventStore.events(for: event.containerID).first
        XCTAssertNotNil(retrieved)

        // Verify event type round-trips correctly
        switch retrieved?.type {
        case .stateChanged(let from, let to):
            XCTAssertEqual(from, .created)
            XCTAssertEqual(to, .starting)
        default:
            XCTFail("Expected stateChanged event type")
        }
    }

    func testComplexEventTypeRoundTrips() async {
        let containerID = UUID()

        // Test all event types
        let stateChangeEvent = ContainerEvent(
            containerID: containerID,
            type: .stateChanged(from: .stopped, to: .running)
        )
        let logEvent = ContainerEvent(
            containerID: containerID,
            type: .logOutput("Complex log message with special chars: !@#$%")
        )
        let resourceEvent = ContainerEvent(
            containerID: containerID,
            type: .resourceUpdate(
                ContainerEvent.ResourceInfo(
                    cpuPercent: 75.5,
                    memoryBytes: 1024 * 1024 * 1024,
                    memoryPercent: 50.0
                )
            )
        )

        await eventStore.record(stateChangeEvent)
        await eventStore.record(logEvent)
        await eventStore.record(resourceEvent)

        let retrieved = eventStore.events(for: containerID)
        XCTAssertEqual(retrieved.count, 3)

        // Verify log output with special characters
        if case .logOutput(let message) = retrieved[1].type {
            XCTAssertEqual(message, "Complex log message with special chars: !@#$%")
        } else {
            XCTFail("Expected logOutput with special characters")
        }

        // Verify resource info
        if case .resourceUpdate(let info) = retrieved[2].type {
            XCTAssertEqual(info.cpuPercent, 75.5, accuracy: 0.01)
            XCTAssertEqual(info.memoryBytes, 1024 * 1024 * 1024)
            XCTAssertEqual(info.memoryPercent, 50.0, accuracy: 0.01)
        } else {
            XCTFail("Expected resourceUpdate")
        }
    }

    func testEventTimestampIsPreserved() async {
        let timestamp = Date().addingTimeInterval(-3600)  // 1 hour ago

        let event = ContainerEvent(
            containerID: UUID(),
            type: .logOutput("Timestamped log"),
            timestamp: timestamp
        )

        await eventStore.record(event)

        let retrieved = eventStore.events(for: event.containerID).first
        XCTAssertNotNil(retrieved)

        // Timestamps should match within a reasonable tolerance
        let timeDifference = abs(retrieved!.timestamp.timeIntervalSince(timestamp))
        XCTAssertLessThan(timeDifference, 1.0)  // Within 1 second
    }

    // MARK: - Multiple Containers

    func testEventsForMultipleContainers() async {
        let container1 = UUID()
        let container2 = UUID()
        let container3 = UUID()

        for i in 0..<5 {
            await eventStore.record(ContainerEvent(containerID: container1, type: .logOutput("C1: \(i)")))
            await eventStore.record(ContainerEvent(containerID: container2, type: .logOutput("C2: \(i)")))
            await eventStore.record(ContainerEvent(containerID: container3, type: .logOutput("C3: \(i)")))
        }

        XCTAssertEqual(eventStore.events(for: container1).count, 5)
        XCTAssertEqual(eventStore.events(for: container2).count, 5)
        XCTAssertEqual(eventStore.events(for: container3).count, 5)
    }

    // MARK: - High Volume

    func testRecordingManyEvents() async {
        let containerID = UUID()
        let eventCount = 100

        for i in 0..<eventCount {
            let event = ContainerEvent(
                containerID: containerID,
                type: .logOutput("Log line \(i)")
            )
            await eventStore.record(event)
        }

        let retrieved = eventStore.events(for: containerID, limit: 200)
        XCTAssertEqual(retrieved.count, eventCount)
    }
}
