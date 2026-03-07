import Shared
import Testing

@Suite("Domain Routing Tests")
struct DomainRoutingTableTests {
    @Test("Unregister removes container and compose aliases")
    func unregisterRemovesContainerRoutes() async {
        let routingTable = DomainRoutingTable()
        let container = ContainerSummary(
            name: "web",
            image: "nginx:latest",
            status: .running,
            ports: ["8080:80"]
        )
        let config = ContainerConfig(
            ports: ["8080:80"],
            labels: [
                "com.docker.compose.project": "demo",
                "com.docker.compose.service": "frontend"
            ]
        )

        await routingTable.register(container: container, config: config)
        await routingTable.unregister(containerID: container.id)

        for suffix in AppConfig.Networking.containerDomainSuffixes {
            let hostname = AppConfig.Networking.hostname(for: container.name, suffix: suffix)
            #expect(await routingTable.resolveIPv4(hostname: hostname) == nil)
            #expect(await routingTable.resolveUpstream(hostname: hostname) == nil)
        }

        let composeHostname = "frontend.demo.\(AppConfig.Networking.primaryDomainSuffix)"
        let shortHostname = "frontend.demo.fd.local"
        #expect(await routingTable.resolveUpstream(hostname: composeHostname) == nil)
        #expect(await routingTable.resolveUpstream(hostname: shortHostname) == nil)
    }

    @Test("Kubernetes routes register and unregister all configured aliases")
    func kubernetesRoutesLifecycle() async {
        let routingTable = DomainRoutingTable()
        let upstream = Upstream(host: "127.0.0.1", port: 6443, scheme: "https")

        await routingTable.registerKubernetesCluster(id: "cluster-1", name: "dev", upstream: upstream)

        for suffix in AppConfig.Networking.kubernetesDomainSuffixes {
            let hostname = AppConfig.Networking.kubernetesHostname(for: "dev", suffix: suffix)
            #expect(await routingTable.resolveIPv4(hostname: hostname) == "127.0.0.1")
            #expect(await routingTable.resolveUpstream(hostname: hostname)?.host == upstream.host)
            #expect(await routingTable.resolveUpstream(hostname: hostname)?.port == upstream.port)
            #expect(await routingTable.resolveUpstream(hostname: hostname)?.scheme == upstream.scheme)
        }

        await routingTable.unregisterKubernetesCluster(id: "cluster-1")

        for suffix in AppConfig.Networking.kubernetesDomainSuffixes {
            let hostname = AppConfig.Networking.kubernetesHostname(for: "dev", suffix: suffix)
            #expect(await routingTable.resolveIPv4(hostname: hostname) == nil)
            #expect(await routingTable.resolveUpstream(hostname: hostname) == nil)
        }
    }
}