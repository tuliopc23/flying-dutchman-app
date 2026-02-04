import Foundation
import Containerization
import Shared
import Logging

/// Manages k3s Kubernetes clusters using Apple's Containerization framework
public actor K3sClusterManager {
    private let logger = Loggers.make(category: "flyingdutchman.kubernetes")
    private let containerRuntime: ContainerRuntimeProtocol
    
    public init(containerRuntime: ContainerRuntimeProtocol) {
        self.containerRuntime = containerRuntime
    }
    
    /// Create a k3s cluster as a container
    public func createCluster(
        name: String,
        cpuCount: Int = 2,
        memoryGB: Int = 2
    ) async throws -> KubernetesCluster {
        logger.info("Creating k3s cluster: \(name)")
        
        // k3s container configuration
        let config = ContainerConfig(
            portMappings: [
                PortMapping(hostPort: 6443, containerPort: 6443, protocol: .tcp),
                PortMapping(hostPort: 30080, containerPort: 80, protocol: .tcp),
                PortMapping(hostPort: 30443, containerPort: 443, protocol: .tcp)
            ],
            env: [
                "K3S_TOKEN": "flying-dutchman-token",
                "K3S_KUBECONFIG_OUTPUT": "/output/kubeconfig.yaml",
                "K3S_KUBECONFIG_MODE": "666"
            ],
            volumes: [
                "\(name)-data:/var/lib/rancher/k3s",
                "\(name)-config:/output"
            ],
            command: ["server", "--disable=traefik"]
        )
        
        // Create the k3s container
        let container = try await containerRuntime.createContainer(
            name: name,
            image: "rancher/k3s:latest",
            config: config
        )
        
        // Start the container
        try await containerRuntime.startContainer(id: container.id)
        
        // Wait for k3s to be ready
        try await waitForK3sReady(containerID: container.id)
        
        // Extract kubeconfig
        let kubeconfig = try await extractKubeconfig(containerID: container.id)
        
        let cluster = KubernetesCluster(
            id: container.id.uuidString,
            name: name,
            containerID: container.id,
            status: .running,
            kubeconfig: kubeconfig,
            apiEndpoint: "https://localhost:6443",
            version: "k3s-latest"
        )
        
        logger.info("k3s cluster \(name) created successfully")
        return cluster
    }
    
    /// Wait for k3s to be ready
    private func waitForK3sReady(containerID: UUID, timeout: TimeInterval = 120) async throws {
        let startTime = Date()
        
        while Date().timeIntervalSince(startTime) < timeout {
            do {
                // Check if container is running
                let containers = try await containerRuntime.listContainers()
                if let container = containers.first(where: { $0.id == containerID }),
                   container.status == .running {
                    logger.info("k3s cluster container is running")
                    // Give k3s a bit more time to fully initialize
                    try await Task.sleep(nanoseconds: 10_000_000_000) // 10 seconds
                    return
                }
            } catch {
                // k3s not ready yet, continue waiting
            }
            
            try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
        }
        
        throw K3sError.clusterNotReady
    }
    
    /// Extract kubeconfig from k3s container
    private func extractKubeconfig(containerID: UUID) async throws -> String {
        // For now, return a template kubeconfig
        // In production, this would be extracted from the container's volume
        let kubeconfig = """
        apiVersion: v1
        kind: Config
        clusters:
        - cluster:
            server: https://localhost:6443
            insecure-skip-tls-verify: true
          name: k3s
        contexts:
        - context:
            cluster: k3s
            user: k3s
          name: k3s
        current-context: k3s
        users:
        - name: k3s
          user:
            token: flying-dutchman-token
        """
        
        return kubeconfig
    }
    
    /// Stop a k3s cluster
    public func stopCluster(containerID: UUID) async throws {
        _ = try await containerRuntime.stopContainer(id: containerID)
        logger.info("k3s cluster stopped")
    }
    
    /// Delete a k3s cluster
    public func deleteCluster(containerID: UUID) async throws {
        try await containerRuntime.removeContainer(id: containerID)
        logger.info("k3s cluster deleted")
    }
    
    /// Get cluster status
    public func getClusterStatus(containerID: UUID) async throws -> KubernetesClusterStatus {
        let containers = try await containerRuntime.listContainers()
        guard let container = containers.first(where: { $0.id == containerID }) else {
            return .notFound
        }
        
        switch container.status {
        case .running:
            return .running
        case .stopped:
            return .stopped
        default:
            return .unknown
        }
    }
    
    /// Save kubeconfig to host
    public func saveKubeconfigToHost(cluster: KubernetesCluster) throws {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        let kubeDir = homeDir.appendingPathComponent(".kube")
        
        try? FileManager.default.createDirectory(at: kubeDir, withIntermediateDirectories: true)
        
        let configPath = kubeDir.appendingPathComponent("config-\(cluster.name)")
        try cluster.kubeconfig.write(to: configPath, atomically: true, encoding: .utf8)
        
        logger.info("Saved kubeconfig to \(configPath.path)")
        logger.info("Use: export KUBECONFIG=\(configPath.path)")
    }
}

public struct KubernetesCluster: Codable, Sendable {
    public let id: String
    public let name: String
    public let containerID: UUID
    public var status: KubernetesClusterStatus
    public let kubeconfig: String
    public let apiEndpoint: String
    public let version: String
    
    public init(id: String, name: String, containerID: UUID, status: KubernetesClusterStatus, kubeconfig: String, apiEndpoint: String, version: String) {
        self.id = id
        self.name = name
        self.containerID = containerID
        self.status = status
        self.kubeconfig = kubeconfig
        self.apiEndpoint = apiEndpoint
        self.version = version
    }
}

public enum KubernetesClusterStatus: String, Codable, Sendable {
    case creating
    case starting
    case running
    case stopped
    case notFound
    case unknown
}

public enum K3sError: Error {
    case clusterNotReady
    case kubeconfigNotFound
    case containerNotFound
}
