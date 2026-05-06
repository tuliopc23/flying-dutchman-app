import ArgumentParser
import FlyingDutchmanNetworking
import Foundation
import Shared

struct Kubernetes: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "k8s",
        abstract: "Manage Kubernetes clusters",
        subcommands: [
            Create.self,
            List.self,
            Start.self,
            Stop.self,
            Delete.self,
            Kubeconfig.self,
        ],
        defaultSubcommand: List.self
    )

    struct Create: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Create a new k3s cluster")

        @Argument(help: "Cluster name")
        var name: String

        @Option(name: .shortAndLong, help: "CPU count")
        var cpu: Int = 2

        @Option(name: .shortAndLong, help: "Memory in GB")
        var memory: Int = 2

        @Flag(name: .long, help: "Create as a Virtual Machine (recommended for isolation)")
        var vm: Bool = false

        func run() async throws {
            CLIOutput.section("Create Kubernetes Cluster")
            CLIOutput.line("Name", name)
            CLIOutput.line("Type", vm ? "Virtual Machine" : "Container")
            CLIOutput.line("Resources", "\(cpu) CPU, \(memory)GB RAM")

            if vm {
                let config = MachineConfig(
                    distro: "ubuntu",
                    version: "24.04",
                    cpuCount: cpu,
                    memoryGB: memory,
                    diskGB: 20,
                    installK3s: true
                )

                let machine = try await EngineClient.createMachine(name: name, config: config)

                CLIOutput.line("Status", "✓ Cluster machine created")
                CLIOutput.line("Machine ID", machine.id)
                CLIOutput.hint("Start the cluster with: fd machines start \(name)")
                CLIOutput.hint("Or standard start: fd k8s start \(name)")
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

                let container = try await EngineClient.createContainer(
                    name: name,
                    image: "rancher/k3s:latest",
                    config: config
                )

                CLIOutput.line("Status", "✓ Cluster container created")
                CLIOutput.line("Container ID", container.id.uuidString)
                CLIOutput.hint("Start the cluster with: fd k8s start \(name)")
            }
        }
    }

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List Kubernetes clusters")

        func run() async throws {
            // List containers with k3s image
            let containers = try await EngineClient.listContainers()
            let containerClusters = containers.filter { $0.image.contains("k3s") }

            // List machines with k3s installed
            let machines = try await EngineClient.listMachines()
            let machineClusters = machines.filter(\.isKubernetesCluster)

            if containerClusters.isEmpty, machineClusters.isEmpty {
                print("No Kubernetes clusters found")
                CLIOutput.hint("Create a cluster with: fd k8s create <name> [--vm]")
                return
            }

            CLIOutput.section("Kubernetes Clusters")
            for cluster in containerClusters {
                let statusIcon = cluster.status == .running ? "●" : "○"
                CLIOutput.line("\(statusIcon) \(cluster.name) [Container]", cluster.status.rawValue)
            }
            for cluster in machineClusters {
                let statusIcon = cluster.status == .running ? "●" : "○"
                CLIOutput.line("\(statusIcon) \(cluster.name) [VM]", cluster.status.rawValue)
            }
        }
    }

    struct Start: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Start a cluster")

        @Argument(help: "Cluster name")
        var name: String

        func run() async throws {
            CLIOutput.section("Start Cluster")
            CLIOutput.line("Cluster", name)

            // Check machines first
            let machines = try await EngineClient.listMachines()
            if let cluster = machines.first(where: { ($0.name == name || $0.id == name) && $0.isKubernetesCluster }) {
                _ = try await EngineClient.startMachine(nameOrID: cluster.id)
                CLIOutput.line("Status", "✓ Cluster machine started")
                CLIOutput.hint("Get kubeconfig with: fd k8s kubeconfig \(name)")
                return
            }

            // Check containers
            let containers = try await EngineClient.listContainers()
            if let cluster = containers.first(where: { $0.name == name && $0.image.contains("k3s") }) {
                _ = try await EngineClient.startContainer(id: cluster.id)
                CLIOutput.line("Status", "✓ Cluster container started")
                CLIOutput.line("API", "https://localhost:6443")
                CLIOutput.hint("Get kubeconfig with: fd k8s kubeconfig \(name)")
                return
            }

            CLIOutput.warn("Error", "Cluster not found: \(name)")
            throw ExitCode.failure
        }
    }

    struct Stop: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Stop a cluster")

        @Argument(help: "Cluster name")
        var name: String

        func run() async throws {
            CLIOutput.section("Stop Cluster")
            CLIOutput.line("Cluster", name)

            // Check machines
            let machines = try await EngineClient.listMachines()
            if let cluster = machines.first(where: { ($0.name == name || $0.id == name) && $0.isKubernetesCluster }) {
                _ = try await EngineClient.stopMachine(nameOrID: cluster.id)
                CLIOutput.line("Status", "✓ Cluster machine stopped")
                return
            }

            // Check containers
            let containers = try await EngineClient.listContainers()
            if let cluster = containers.first(where: { $0.name == name && $0.image.contains("k3s") }) {
                _ = try await EngineClient.stopContainer(id: cluster.id)
                CLIOutput.line("Status", "✓ Cluster container stopped")
                return
            }

            CLIOutput.warn("Error", "Cluster not found: \(name)")
            throw ExitCode.failure
        }
    }

    struct Delete: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Delete a cluster")

        @Argument(help: "Cluster name")
        var name: String

        @Flag(name: .shortAndLong, help: "Force deletion without confirmation")
        var force: Bool = false

        func run() async throws {
            if !force {
                CLIOutput.warn("Warning", "This will permanently delete the cluster and all its data")
                print("Continue? (y/N): ", terminator: "")
                guard let response = readLine(), response.lowercased() == "y" else {
                    CLIOutput.line("Cancelled", "Cluster not deleted")
                    return
                }
            }

            CLIOutput.section("Delete Cluster")
            CLIOutput.line("Cluster", name)

            // Check machines
            let machines = try await EngineClient.listMachines()
            if let cluster = machines.first(where: { ($0.name == name || $0.id == name) && $0.isKubernetesCluster }) {
                try await EngineClient.deleteMachine(nameOrID: cluster.id)
                CLIOutput.line("Status", "✓ Cluster machine deleted")
                return
            }

            // Check containers
            let containers = try await EngineClient.listContainers()
            if let cluster = containers.first(where: { $0.name == name && $0.image.contains("k3s") }) {
                // TODO: Add removeContainer to EngineClient
                CLIOutput.warn("Note", "Use 'fd containers rm \(name)' to delete the cluster container")
                return
            }

            CLIOutput.warn("Error", "Cluster not found: \(name)")
            throw ExitCode.failure
        }
    }

    struct Kubeconfig: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Get kubeconfig for a cluster")

        @Argument(help: "Cluster name")
        var name: String

        @Flag(name: .long, help: "Save to ~/.kube/config-<name>")
        var save: Bool = false

        func run() async throws {
            let kubeconfig = try await resolveKubeconfig()

            if save {
                let homeDir = FileManager.default.homeDirectoryForCurrentUser
                let kubeDir = homeDir.appendingPathComponent(".kube")
                try? FileManager.default.createDirectory(at: kubeDir, withIntermediateDirectories: true)
                let configPath = kubeDir.appendingPathComponent("config-\(name)")
                try kubeconfig.write(to: configPath, atomically: true, encoding: .utf8)
                CLIOutput.line("Saved", configPath.path)
                CLIOutput.hint("Use: export KUBECONFIG=\(configPath.path)")
            } else {
                print(kubeconfig)
            }
        }

        private func resolveKubeconfig() async throws -> String {
            let machines = try await EngineClient.listMachines()
            if let cluster = machines.first(where: { ($0.name == name || $0.id == name) && $0.isKubernetesCluster }) {
                return try await kubeconfigFromMachine(cluster: cluster)
            }
            let containers = try await EngineClient.listContainers()
            if containers.contains(where: { $0.name == name && $0.image.contains("k3s") }) {
                return kubeconfigFromContainer()
            }
            CLIOutput.warn("Error", "Cluster not found: \(name)")
            throw ExitCode.failure
        }

        private func kubeconfigFromMachine(cluster: Machine) async throws -> String {
            guard cluster.status == .running else {
                CLIOutput.warn("Error", "Cluster is not running")
                CLIOutput.hint("Start it with: fd k8s start \(name)")
                throw ExitCode.failure
            }
            guard let ip = cluster.ipAddress else {
                CLIOutput.warn("Error", "Cluster has no IP address")
                throw ExitCode.failure
            }
            let remoteConfig = try await EngineClient.executeMachineCommand(
                nameOrID: cluster.id,
                command: "sudo cat /etc/rancher/k3s/k3s.yaml"
            )
            return remoteConfig
                .replacingOccurrences(of: "https://127.0.0.1:6443", with: "https://\(ip):6443")
                .replacingOccurrences(of: "default", with: name)
        }

        private func kubeconfigFromContainer() -> String {
            """
            apiVersion: v1
            kind: Config
            clusters:
            - cluster:
                server: https://localhost:6443
                insecure-skip-tls-verify: true
              name: \(name)
            contexts:
            - context:
                cluster: \(name)
                user: \(name)
              name: \(name)
            current-context: \(name)
            users:
            - name: \(name)
              user:
                token: flying-dutchman-token
            """
        }
    }
}
