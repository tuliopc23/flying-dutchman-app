import XCTest
import GRDB
@testable import FlyingDutchmanPersistence
@testable import Shared

final class ContainerStoreTests: XCTestCase {
    var dbQueue: DatabaseQueue!
    var store: ContainerStore!

    override func setUp() async throws {
        try await super.setUp()
        dbQueue = try DatabaseQueue()
        try DatabaseContainer.migrator.migrate(dbQueue)
        store = ContainerStore(dbQueue: dbQueue)
    }

    func testFetchAllReturnsEmptyInitially() {
        let containers = store.fetchAll()
        XCTAssertTrue(containers.isEmpty)
    }

    func testInsertAndFetchContainer() async throws {
        let container = ContainerSummary(
            name: "test-container",
            image: "nginx:latest",
            status: .running,
            ports: ["80:80"]
        )

        try await store.insert(container)
        let fetched = try await store.fetch(id: container.id)

        XCTAssertNotNil(fetched)
        XCTAssertEqual(fetched?.id, container.id)
        XCTAssertEqual(fetched?.name, "test-container")
        XCTAssertEqual(fetched?.status, .running)
    }

    func testUpdateContainer() async throws {
        var container = ContainerSummary(
            name: "test-container",
            image: "nginx:latest",
            status: .running,
            ports: ["80:80"]
        )

        try await store.insert(container)

        container.status = .stopped
        try await store.update(container)

        let fetched = try await store.fetch(id: container.id)
        XCTAssertEqual(fetched?.status, .stopped)
    }

    func testDeleteContainer() async throws {
        let container = ContainerSummary(
            name: "test-container",
            image: "nginx:latest",
            status: .running,
            ports: ["80:80"]
        )

        try await store.insert(container)
        try await store.delete(id: container.id)

        let fetched = try await store.fetch(id: container.id)
        XCTAssertNil(fetched)
    }

    func testFetchRunning() async throws {
        let running = ContainerSummary(name: "running", image: "nginx", status: .running, ports: [])
        let stopped = ContainerSummary(name: "stopped", image: "nginx", status: .stopped, ports: [])

        try await store.insert(running)
        try await store.insert(stopped)

        let result = try await store.fetchRunning()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "running")
    }

    func testSearchContainers() async throws {
        let nginx = ContainerSummary(name: "web-nginx", image: "nginx", status: .running, ports: [])
        let postgres = ContainerSummary(name: "db-postgres", image: "postgres", status: .running, ports: [])

        try await store.insert(nginx)
        try await store.insert(postgres)

        let result = try await store.search(query: "nginx")
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "web-nginx")
    }

    func testUpsertInsertsNewContainer() async throws {
        let container = ContainerSummary(name: "test", image: "nginx", status: .running, ports: [])

        try await store.upsert(container)
        let count = try await store.count()
        XCTAssertEqual(count, 1)
    }

    func testUpsertUpdatesExistingContainer() async throws {
        var container = ContainerSummary(name: "test", image: "nginx", status: .running, ports: [])

        try await store.insert(container)
        container.status = .stopped
        try await store.upsert(container)

        let fetched = try await store.fetch(id: container.id)
        XCTAssertEqual(fetched?.status, .stopped)

        let count = try await store.count()
        XCTAssertEqual(count, 1)
    }

    func testReplaceAll() async {
        let containers = [
            ContainerSummary(name: "c1", image: "nginx", status: .running, ports: []),
            ContainerSummary(name: "c2", image: "redis", status: .stopped, ports: [])
        ]

        store.replaceAll(with: containers)
        let result = store.fetchAll()
        XCTAssertEqual(result.count, 2)
    }

    func testSeedIfEmptyOnlyWorksOnce() async {
        let containers = [
            ContainerSummary(name: "seed1", image: "nginx", status: .running, ports: [])
        ]

        await store.seedIfEmpty(with: containers)
        await store.seedIfEmpty(with: containers)

        let result = store.fetchAll()
        XCTAssertEqual(result.count, 1)
    }

    func testCount() async throws {
        let initialCount = try await store.count()
        XCTAssertEqual(initialCount, 0)

        let container = ContainerSummary(name: "test", image: "nginx", status: .running, ports: [])
        try await store.insert(container)

        let finalCount = try await store.count()
        XCTAssertEqual(finalCount, 1)
    }

    func testPortsArePreserved() async throws {
        let container = ContainerSummary(
            name: "multi-port",
            image: "nginx",
            status: .running,
            ports: ["80:80", "443:443", "8080:8080"]
        )

        try await store.insert(container)
        let fetched = try await store.fetch(id: container.id)

        XCTAssertEqual(fetched?.ports.count, 3)
        XCTAssertTrue(fetched?.ports.contains("80:80") ?? false)
        XCTAssertTrue(fetched?.ports.contains("443:443") ?? false)
        XCTAssertTrue(fetched?.ports.contains("8080:8080") ?? false)
    }
}
