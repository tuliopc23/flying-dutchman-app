import DNSClient
@testable import FlyingDutchmanNetworking
import NIO
import Shared
import XCTest

final class DNSServerTests: XCTestCase {
    var group: MultiThreadedEventLoopGroup!
    var routingTable: DomainRoutingTable!
    var server: DNSServer!

    override func setUp() async throws {
        group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        routingTable = DomainRoutingTable()
    }

    override func tearDown() async throws {
        await server?.shutdown()
        try await group.shutdownGracefully()
    }

    func testDNSResolution() async throws {
        // 1. Setup
        let container = ContainerSummary(
            name: "test-container",
            image: "test-image",
            status: .running,
            ports: ["8080:80"]
        )

        // Use legacy ports configuration or empty config since determineUpstream falls back to legacyPorts
        // if config.portMappings is empty.
        let config = ContainerConfig(ports: ["8080:80"])

        await routingTable.register(container: container, config: config)

        server = DNSServer(host: "127.0.0.1", port: 0, routingTable: routingTable, group: group)
        try await server.start()

        guard let port = await server.boundPort else {
            XCTFail("Server did not bind to a port")
            return
        }

        // 2. Create Client
        // We use DNSClient library to query our server
        let client = try await DNSClient.connect(
            on: group,
            config: [SocketAddress(ipAddress: "127.0.0.1", port: port)]
        ).get()

        // 3. Query
        // We expect 127.0.0.1 because routingTable.resolveIPv4 returns "127.0.0.1" for known routes.
        let primaryHost = "test-container.\(AppConfig.Networking.primaryDomainSuffix)"
        let results = try await client.sendQuery(forHost: primaryHost, type: .a).get()

        // 4. Verify
        XCTAssertEqual(results.answers.count, 1)
        if let record = results.answers.first, case let .a(resourceRecord) = record {
            // 127.0.0.1 -> 2130706433
            XCTAssertEqual(resourceRecord.resource.address, 2_130_706_433, "Address should be 127.0.0.1")
        } else {
            XCTFail("Expected A record answer, got \(results.answers)")
        }

        // Legacy alias should resolve too
        let legacyHost = "test-container.\(AppConfig.Networking.legacyDomainSuffix)"
        let legacyResults = try await client.sendQuery(forHost: legacyHost, type: .a).get()
        XCTAssertEqual(legacyResults.answers.count, 1)

        // Test NXDOMAIN
        let nxResults = try await client.sendQuery(
            forHost: "unknown.\(AppConfig.Networking.primaryDomainSuffix)",
            type: .a
        ).get()
        XCTAssertEqual(nxResults.answers.count, 0)
        XCTAssertTrue(nxResults.header.options.contains(.resultCodeNameError))
    }
}
