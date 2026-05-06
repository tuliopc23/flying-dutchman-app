import Foundation
@testable import Kubernetes
import Shared
import Testing

@MainActor
@Suite("Kubernetes List ViewModel Tests")
struct KubernetesListViewModelTests {
    @Test("load merges VM and container-backed clusters")
    func loadMergesClusterSources() async throws {
        let vmCluster = Machine(
            id: "vm-cluster",
            name: "vm-cluster",
            distro: "ubuntu",
            version: "24.04",
            status: .running,
            ipAddress: "10.0.0.5",
            isKubernetesCluster: true,
            kubernetesVersion: "v1.30.0"
        )
        let plainMachine = Machine(name: "plain", distro: "ubuntu", version: "24.04", status: .running)
        let containerCluster = try ContainerSummary(
            id: #require(UUID(uuidString: "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa")),
            name: "container-cluster",
            image: "rancher/k3s:latest",
            status: .starting,
            ports: ["6443:6443"]
        )
        let plainContainer = ContainerSummary(name: "nginx", image: "nginx:latest", status: .running, ports: ["80:80"])

        let viewModel = KubernetesListViewModel(client: .stub(
            listMachines: { [vmCluster, plainMachine] },
            listContainers: { [containerCluster, plainContainer] }
        ))

        await viewModel.load()

        #expect(viewModel.clusters.map(\.name) == ["container-cluster", "vm-cluster"])
        #expect(viewModel.clusters.map(\.kind) == [.container, .vm])
        #expect(viewModel.clusters.map(\.status) == [.starting, .running])
        #expect(viewModel.error == nil)
        #expect(!viewModel.isLoading)
    }

    @Test("createCluster with VM mode reloads created cluster state")
    func createClusterReloadsCreatedVMCluster() async {
        let state = ClusterState()
        let viewModel = KubernetesListViewModel(client: .stub(
            listMachines: { await state.machines },
            createMachine: { name, config in
                let created = Machine(
                    id: "created-vm",
                    name: name,
                    distro: config.distro,
                    version: config.version,
                    status: .creating,
                    isKubernetesCluster: true
                )
                await state.setMachines([created])
                return created
            }
        ))

        await viewModel.createCluster(name: "dev", cpu: 4, memory: 8, useVM: true)

        #expect(viewModel.clusters.map(\.name) == ["dev"])
        #expect(viewModel.clusters.first?.kind == .vm)
        #expect(viewModel.error == nil)
        #expect(!viewModel.isLoading)
    }

    @Test("kubeconfig replaces localhost with machine IP for VM clusters")
    func kubeconfigUsesMachineIPAddress() async {
        let viewModel = KubernetesListViewModel(client: .stub(
            executeMachineCommand: { _, _ in
                "server: https://127.0.0.1:6443"
            }
        ))
        let cluster = KubernetesCluster(
            id: "vm-cluster",
            name: "dev",
            kind: .vm,
            status: .running,
            ipAddress: "10.0.0.42",
            kubernetesVersion: nil
        )

        let kubeconfig = await viewModel.kubeconfig(cluster)

        #expect(kubeconfig?.contains("https://10.0.0.42:6443") == true)
        #expect(viewModel.error == nil)
    }

    @Test("createCluster surfaces failures without leaving loading state")
    func createClusterSurfacesFailures() async {
        let viewModel = KubernetesListViewModel(client: .stub(
            createContainer: { _, _, _ in throw TestFailure.createFailed }
        ))

        await viewModel.createCluster(name: "broken", cpu: 2, memory: 4, useVM: false)

        #expect(viewModel.clusters.isEmpty)
        #expect(viewModel.error == "Create failed: create failed")
        #expect(!viewModel.isLoading)
    }
}

private actor ClusterState {
    private(set) var machines: [Machine] = []

    func setMachines(_ machines: [Machine]) {
        self.machines = machines
    }
}

private extension KubernetesEngineClient {
    static func stub(
        listMachines: @Sendable @escaping () async throws -> [Machine] = { [] },
        listContainers: @Sendable @escaping () async throws -> [ContainerSummary] = { [] },
        createMachine: @Sendable @escaping (_ name: String, _ config: MachineConfig) async throws
            -> Machine = { name, config in
                Machine(
                    name: name,
                    distro: config.distro,
                    version: config.version,
                    status: .creating,
                    isKubernetesCluster: true
                )
            },
        createContainer: @Sendable @escaping (_ name: String, _ image: String, _ config: ContainerConfig) async throws
            -> ContainerSummary = { name, image, _ in
                ContainerSummary(name: name, image: image, status: .created, ports: ["6443:6443"])
            },
        startMachine: @Sendable @escaping (_ id: String) async throws -> Machine = { id in
            Machine(id: id, name: id, distro: "ubuntu", version: "24.04", status: .running, isKubernetesCluster: true)
        },
        startContainer: @Sendable @escaping (_ id: UUID) async throws -> ContainerSummary = { id in
            ContainerSummary(
                id: id,
                name: id.uuidString,
                image: "rancher/k3s:latest",
                status: .running,
                ports: ["6443:6443"]
            )
        },
        stopMachine: @Sendable @escaping (_ id: String) async throws -> Machine = { id in
            Machine(id: id, name: id, distro: "ubuntu", version: "24.04", status: .stopped, isKubernetesCluster: true)
        },
        stopContainer: @Sendable @escaping (_ id: UUID) async throws -> ContainerSummary = { id in
            ContainerSummary(
                id: id,
                name: id.uuidString,
                image: "rancher/k3s:latest",
                status: .stopped,
                ports: ["6443:6443"]
            )
        },
        deleteMachine: @Sendable @escaping (_ id: String) async throws -> Void = { _ in },
        removeContainer: @Sendable @escaping (_ id: UUID) async throws -> Void = { _ in },
        executeMachineCommand: @Sendable @escaping (_ id: String, _ command: String) async throws -> String = { _, _ in
            "apiVersion: v1"
        }
    ) -> Self {
        Self(
            listMachines: listMachines,
            listContainers: listContainers,
            createMachine: createMachine,
            createContainer: createContainer,
            startMachine: startMachine,
            startContainer: startContainer,
            stopMachine: stopMachine,
            stopContainer: stopContainer,
            deleteMachine: deleteMachine,
            removeContainer: removeContainer,
            executeMachineCommand: executeMachineCommand
        )
    }
}

private enum TestFailure: LocalizedError {
    case createFailed

    var errorDescription: String? {
        switch self {
        case .createFailed:
            "create failed"
        }
    }
}
