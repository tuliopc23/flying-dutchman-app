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
    func registerKubernetesDomainsIfNeeded(
        container: ContainerSummary,
        config: ContainerConfig,
        routingTable: DomainRoutingTable
    ) async {
        guard container.image.localizedCaseInsensitiveContains("k3s") else { return }
        guard let upstream = determineKubernetesUpstream(from: config, legacyPorts: container.ports) else { return }

        await routingTable.registerKubernetesCluster(
            id: container.id.uuidString,
            name: container.name,
            upstream: upstream
        )
        logger.info("Registered Kubernetes routing for \(container.name)")
    }

    func unregisterKubernetesDomainsIfNeeded(
        containerID: UUID,
        routingTable: DomainRoutingTable
    ) async {
        await routingTable.unregisterKubernetesCluster(id: containerID.uuidString)
    }

    private func determineKubernetesUpstream(
        from config: ContainerConfig,
        legacyPorts: [String]
    ) -> Upstream? {
        let mappings = (try? config.getAllPortMappings()) ?? []
        if let https = mappings.first(where: { $0.containerPort == 443 }) {
            return Upstream(host: "127.0.0.1", port: https.hostPort, scheme: "https")
        }
        if let http = mappings.first(where: { $0.containerPort == 80 }) {
            return Upstream(host: "127.0.0.1", port: http.hostPort)
        }

        for portSpec in legacyPorts {
            let parts = portSpec.split(separator: ":")
            if parts.count == 2, let hostPort = Int(parts[0]), let containerPort = Int(parts[1]) {
                if containerPort == 443 {
                    return Upstream(host: "127.0.0.1", port: hostPort, scheme: "https")
                }
                if containerPort == 80 {
                    return Upstream(host: "127.0.0.1", port: hostPort)
                }
            }
        }

        // Fallback to API server if nothing else is available
        if let api = mappings.first(where: { $0.containerPort == 6443 }) {
            return Upstream(host: "127.0.0.1", port: api.hostPort, scheme: "https")
        }

        return nil
    }
}
