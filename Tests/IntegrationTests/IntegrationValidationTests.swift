import Testing
import Shared
import FlyingDutchmanNetworking

@Suite("Integration Validation Tests")
struct IntegrationValidationTests {
    @Test("Domain routing registers container and compose hostnames")
    func domainRoutingRegistersExpectedHostnames() async {
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

        for suffix in AppConfig.Networking.containerDomainSuffixes {
            let hostname = AppConfig.Networking.hostname(for: container.name, suffix: suffix)
            #expect(await routingTable.resolveIPv4(hostname: hostname) == "127.0.0.1")
            #expect(await routingTable.resolveUpstream(hostname: hostname)?.port == 8080)
        }

        let composeHostname = "frontend.demo.\(AppConfig.Networking.primaryDomainSuffix)"
        let shortHostname = "frontend.demo.fd.local"
        #expect(await routingTable.resolveUpstream(hostname: composeHostname)?.port == 8080)
        #expect(await routingTable.resolveUpstream(hostname: shortHostname)?.port == 8080)
    }

    @Test("Resolver instructions cover configured domains and port")
    func resolverInstructionsReflectCurrentConfiguration() {
        let port = 1053
        let fileContent = ResolverInstaller.resolverFileContent(port: port)
        let instructions = ResolverInstaller.installInstruction(port: port)

        #expect(fileContent.contains("nameserver 127.0.0.1"))
        #expect(fileContent.contains("port \(port)"))

        for suffix in AppConfig.Networking.resolverDomainSuffixes {
            #expect(instructions.contains("/etc/resolver/\(suffix)"))
        }
    }
}