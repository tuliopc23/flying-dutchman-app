import FlyingDutchmanNetworking
import Foundation
import Observation
import Shared

@MainActor
@Observable
public final class KubernetesListViewModel {
    public var clusters: [KubernetesCluster] = []
    public var error: String?
    public var isLoading: Bool = false
    public var showCreateSheet: Bool = false

    private let client: KubernetesEngineClient

    public init() {
        client = .live
    }

    init(client: KubernetesEngineClient) {
        self.client = client
    }

    public func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            async let machines = client.listMachines()
            async let containers = client.listContainers()

            let machineClusters = try await machines
                .filter(\.isKubernetesCluster)
                .map { machine in
                    KubernetesCluster(
                        id: machine.id,
                        name: machine.name,
                        kind: .vm,
                        status: map(machine.status),
                        ipAddress: machine.ipAddress,
                        kubernetesVersion: machine.kubernetesVersion
                    )
                }

            let containerClusters = try await containers
                .filter { $0.image.localizedCaseInsensitiveContains("k3s") }
                .map { container in
                    KubernetesCluster(
                        id: container.id.uuidString,
                        name: container.name,
                        kind: .container,
                        status: map(container.status),
                        ipAddress: nil,
                        kubernetesVersion: nil
                    )
                }

            clusters = (machineClusters + containerClusters).sorted { $0.name < $1.name }
        } catch {
            clusters = []
            self.error = "Failed to load clusters: \(error.localizedDescription)"
        }
    }

    public func createCluster(name: String, cpu: Int, memory: Int, useVM: Bool) async {
        isLoading = true
        defer { isLoading = false }
        do {
            if useVM {
                let config = MachineConfig(
                    distro: "ubuntu",
                    version: "24.04",
                    cpuCount: cpu,
                    memoryGB: memory,
                    diskGB: 20,
                    installK3s: true
                )
                _ = try await client.createMachine(name, config)
            } else {
                let config = ContainerConfig(
                    portMappings: [
                        PortMapping(hostPort: 6443, containerPort: 6443),
                        PortMapping(hostPort: 30080, containerPort: 80),
                        PortMapping(hostPort: 30443, containerPort: 443),
                    ],
                    env: ["K3S_TOKEN": "flying-dutchman-token"],
                    command: ["server", "--disable=traefik"]
                )
                _ = try await client.createContainer(name, "rancher/k3s:latest", config)
            }
            await load()
        } catch {
            self.error = "Create failed: \(error.localizedDescription)"
        }
    }

    public func start(_ cluster: KubernetesCluster) async {
        await mutate(cluster) { cluster in
            switch cluster.kind {
            case .vm:
                _ = try await self.client.startMachine(cluster.id)
            case .container:
                if let id = UUID(uuidString: cluster.id) {
                    _ = try await self.client.startContainer(id)
                }
            }
        }
    }

    public func stop(_ cluster: KubernetesCluster) async {
        await mutate(cluster) { cluster in
            switch cluster.kind {
            case .vm:
                _ = try await self.client.stopMachine(cluster.id)
            case .container:
                if let id = UUID(uuidString: cluster.id) {
                    _ = try await self.client.stopContainer(id)
                }
            }
        }
    }

    public func delete(_ cluster: KubernetesCluster) async {
        await mutate(cluster) { cluster in
            switch cluster.kind {
            case .vm:
                try await self.client.deleteMachine(cluster.id)
            case .container:
                if let id = UUID(uuidString: cluster.id) {
                    try await self.client.removeContainer(id)
                }
            }
        }
    }

    public func kubeconfig(_ cluster: KubernetesCluster) async -> String? {
        do {
            switch cluster.kind {
            case .vm:
                let config = try await client.executeMachineCommand(
                    cluster.id,
                    "sudo cat /etc/rancher/k3s/k3s.yaml"
                )
                if let ip = cluster.ipAddress {
                    return config.replacingOccurrences(
                        of: "https://127.0.0.1:6443",
                        with: "https://\(ip):6443"
                    )
                }
                return config
            case .container:
                return """
                apiVersion: v1
                kind: Config
                clusters:
                - cluster:
                    server: https://localhost:6443
                    insecure-skip-tls-verify: true
                  name: \(cluster.name)
                contexts:
                - context:
                    cluster: \(cluster.name)
                    user: \(cluster.name)
                  name: \(cluster.name)
                current-context: \(cluster.name)
                users:
                - name: \(cluster.name)
                  user:
                    token: flying-dutchman-token
                """
            }
        } catch {
            self.error = "Failed to load kubeconfig: \(error.localizedDescription)"
            return nil
        }
    }

    private func mutate(
        _ cluster: KubernetesCluster,
        action: @escaping (KubernetesCluster) async throws -> Void
    ) async {
        isLoading = true
        defer { isLoading = false }
        do {
            try await action(cluster)
            await load()
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }

    private func map(_ status: MachineStatus) -> KubernetesCluster.ClusterStatus {
        switch status {
        case .running: .running
        case .stopped: .stopped
        case .starting: .starting
        case .stopping: .stopping
        case .creating: .starting
        case .error: .error
        }
    }

    private func map(_ status: ContainerSummary.Status) -> KubernetesCluster.ClusterStatus {
        switch status {
        case .running: .running
        case .stopped: .stopped
        case .starting: .starting
        case .stopping: .stopping
        case .created: .stopped
        case .removing, .removed: .stopped
        }
    }
}
