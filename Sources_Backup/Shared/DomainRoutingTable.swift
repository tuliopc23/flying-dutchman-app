import Foundation

public struct Upstream: Sendable {
    public let host: String
    public let port: Int
    public let scheme: String
    
    public init(host: String, port: Int, scheme: String = "http") {
        self.host = host
        self.port = port
        self.scheme = scheme
    }
}

public actor DomainRoutingTable {
    // Map hostname -> Upstream
    private var routes: [String: Upstream] = [:]
    // Map containerID -> [Hostname] (for cleanup)
    private var containerHostnames: [UUID: Set<String>] = [:]
    
    public init() {}
    
    public func register(container: ContainerSummary, config: ContainerConfig) {
        let hostname = container.name + ".fd.local"
        
        // Find upstream
        if let upstream = determineUpstream(from: config, legacyPorts: container.ports) {
            routes[hostname] = upstream
            
            var hosts = containerHostnames[container.id] ?? []
            hosts.insert(hostname)
            containerHostnames[container.id] = hosts
        }
    }
    
    public func unregister(containerID: UUID) {
        guard let hosts = containerHostnames[containerID] else { return }
        
        for host in hosts {
            routes.removeValue(forKey: host)
        }
        
        containerHostnames.removeValue(forKey: containerID)
    }
    
    public func resolveIPv4(hostname: String) -> String? {
        // Return loopback if we know the route, so client connects to us (Proxy/DNS)
        if routes[hostname] != nil {
            return "127.0.0.1"
        }
        return nil
    }
    
    public func resolveUpstream(hostname: String) -> Upstream? {
        return routes[hostname]
    }
    
    // MARK: - Helpers
    
    private func determineUpstream(from config: ContainerConfig, legacyPorts: [String]) -> Upstream? {
        // Try to get structured mappings first
        if let mappings = try? config.getAllPortMappings(), !mappings.isEmpty {
            // Prefer 80/8080/3000
            if let web = mappings.first(where: { [80, 8080, 3000].contains($0.containerPort) }) {
                return Upstream(host: "127.0.0.1", port: web.hostPort)
            }
            // Fallback to first
            if let first = mappings.first {
                return Upstream(host: "127.0.0.1", port: first.hostPort)
            }
        }
        
        // Fallback to legacy ports string parsing if config unavailable/empty but summary has ports
        for portSpec in legacyPorts {
            // "8080:80"
            let parts = portSpec.split(separator: ":")
            if parts.count == 2, let hostPort = Int(parts[0]) {
                 return Upstream(host: "127.0.0.1", port: hostPort)
            }
        }
        
        return nil
    }
}
