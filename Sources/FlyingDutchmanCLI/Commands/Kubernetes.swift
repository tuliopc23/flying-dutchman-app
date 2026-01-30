import Foundation
import ArgumentParser
import Shared
import FlyingDutchmanNetworking

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
            Kubeconfig.self
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
        
        func run() async throws {
            CLIOutput.section("Create Kubernetes Cluster")
            CLIOutput.line("Name", name)
            CLIOutput.line("Resources", "\(cpu) CPU, \(memory)GB RAM")
            
            let config = ContainerConfig(
                portMappings: [
                    PortMapping(hostPort: 6443, containerPort: 6443),
                    PortMapping(hostPort: 30080, containerPort: 80),
                    PortMapping(hostPort: 30443, containerPort: 443)
                ],
                env: ["K3S_TOKEN": "flying-dutchman-token"],
                command: ["server", "--disable=traefik"]
            )
            
            let container = try await EngineClient.createContainer(
                name: name,
                image: "rancher/k3s:latest",
                config: config
            )
            
            CLIOutput.line("Status", "✓ Cluster created")
            CLIOutput.line("Container ID", container.id.uuidString)
            CLIOutput.hint("Start the cluster with: fd k8s start \(name)")
        }
    }
    
    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List Kubernetes clusters")
        
        func run() async throws {
            // List containers with k3s image
            let containers = try await EngineClient.listContainers()
            let k8sClusters = containers.filter { $0.image.contains("k3s") }
            
            if k8sClusters.isEmpty {
                print("No Kubernetes clusters found")
                CLIOutput.hint("Create a cluster with: fd k8s create <name>")
                return
            }
            
            CLIOutput.section("Kubernetes Clusters")
            for cluster in k8sClusters {
                let statusIcon = cluster.status == .running ? "●" : "○"
                CLIOutput.line("\(statusIcon) \(cluster.name)", cluster.status.rawValue)
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
            
            // Find the k3s container
            let containers = try await EngineClient.listContainers()
            guard let cluster = containers.first(where: { $0.name == name && $0.image.contains("k3s") }) else {
                CLIOutput.warn("Error", "Cluster not found: \(name)")
                throw ExitCode.failure
            }
            
            _ = try await EngineClient.startContainer(id: cluster.id)
            
            CLIOutput.line("Status", "✓ Cluster started")
            CLIOutput.line("API", "https://localhost:6443")
            CLIOutput.hint("Get kubeconfig with: fd k8s kubeconfig \(name)")
        }
    }
    
    struct Stop: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Stop a cluster")
        
        @Argument(help: "Cluster name")
        var name: String
        
        func run() async throws {
            CLIOutput.section("Stop Cluster")
            CLIOutput.line("Cluster", name)
            
            let containers = try await EngineClient.listContainers()
            guard let cluster = containers.first(where: { $0.name == name && $0.image.contains("k3s") }) else {
                CLIOutput.warn("Error", "Cluster not found: \(name)")
                throw ExitCode.failure
            }
            
            _ = try await EngineClient.stopContainer(id: cluster.id)
            
            CLIOutput.line("Status", "✓ Cluster stopped")
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
            
            let containers = try await EngineClient.listContainers()
            guard let cluster = containers.first(where: { $0.name == name && $0.image.contains("k3s") }) else {
                CLIOutput.warn("Error", "Cluster not found: \(name)")
                throw ExitCode.failure
            }
            
            // TODO: Add removeContainer to EngineClient
            CLIOutput.warn("Note", "Use 'fd containers rm \(name)' to delete the cluster container")
            CLIOutput.line("Status", "Cluster marked for deletion")
        }
    }
    
    struct Kubeconfig: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Get kubeconfig for a cluster")
        
        @Argument(help: "Cluster name")
        var name: String
        
        @Flag(name: .long, help: "Save to ~/.kube/config-<name>")
        var save: Bool = false
        
        func run() async throws {
            let containers = try await EngineClient.listContainers()
            guard let cluster = containers.first(where: { $0.name == name && $0.image.contains("k3s") }) else {
                CLIOutput.warn("Error", "Cluster not found: \(name)")
                throw ExitCode.failure
            }
            
            guard cluster.status == .running else {
                CLIOutput.warn("Error", "Cluster is not running")
                CLIOutput.hint("Start it with: fd k8s start \(name)")
                throw ExitCode.failure
            }
            
            // Generate template kubeconfig
            // TODO: Extract actual kubeconfig from container when executeCommand is available
            let kubeconfig = """
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
            
            if save {
                let homeDir = FileManager.default.homeDirectoryForCurrentUser
                let kubeDir = homeDir.appendingPathComponent(".kube")
                try? FileManager.default.createDirectory(at: kubeDir, withIntermediateDirectories: true)
                
                let configPath = kubeDir.appendingPathComponent("config-\(name)")
                try kubeconfig.write(to: configPath, atomically: true, encoding: String.Encoding.utf8)
                
                CLIOutput.line("Saved", configPath.path)
                CLIOutput.hint("Use: export KUBECONFIG=\(configPath.path)")
            } else {
                print(kubeconfig)
            }
        }
    }
}
