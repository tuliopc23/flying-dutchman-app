import Logging
import NIO
import Testing
@testable import FlyingDutchmanNetworking

@Suite("Port Forward Lifecycle Tests")
struct PortForwardLifecycleTests {
    @Test("Stopping a port forward closes the listener")
    func stoppingForwardClosesListener() async throws {
        try await withForwardingHarness { group, forwarder in
            let backendBootstrap = ServerBootstrap(group: group)
                .childChannelInitializer { channel in
                    channel.pipeline.addHandler(EchoHandler())
                }
                .serverChannelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)

            let backend = try await backendBootstrap.bind(host: "127.0.0.1", port: 0).get()
            defer { try? backend.close().wait() }

            let backendPort = try #require(backend.localAddress?.port)
            let forwardPort = try await forwarder.startForwarding(
                hostPort: 0,
                containerIP: "127.0.0.1",
                containerPort: backendPort
            )

            await forwarder.stopForwarding(hostPort: forwardPort)
            try await Task.sleep(nanoseconds: 100_000_000)

            let clientBootstrap = ClientBootstrap(group: group)
            let failedToConnect: Bool

            do {
                let client = try await clientBootstrap.connect(host: "127.0.0.1", port: forwardPort).get()
                try await client.close()
                failedToConnect = false
            } catch {
                failedToConnect = true
            }

            #expect(failedToConnect)
        }
    }

    private func withForwardingHarness(
        _ body: (_ group: MultiThreadedEventLoopGroup, _ forwarder: PortForwardManager) async throws -> Void
    ) async throws {
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        let forwarder = PortForwardManager(group: group, logger: Logger(label: "test.portforward.lifecycle"))

        do {
            try await body(group, forwarder)
            await forwarder.stopAll()
            try await group.shutdownGracefully()
        } catch {
            await forwarder.stopAll()
            try? await group.shutdownGracefully()
            throw error
        }
    }
}