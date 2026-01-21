import Foundation
import Logging
import FlyingDutchmanPersistence
import Shared

/// Manages bridge networks and IP allocation
public actor NetworkManager {
    private let logger = Logger(label: "com.flyingdutchman.networking")
    private let store: NetworkStore
    
    // In-memory allocators for active networks
    private var allocators: [UUID: IPAllocator] = [:]
    
    public init(store: NetworkStore = NetworkStore()) {
        self.store = store
    }
    
    /// Initialize manager (restore state from DB)
    public func initialize() async throws {
        // Ensure default bridge network exists
        _ = try await ensureDefaultNetwork()
        
        let networks = await store.fetchAll()
        for network in networks {
            if let subnet = network.subnet {
                do {
                    // Restore allocator state
                    var allocator = try IPAllocator(subnet: subnet)
                    allocators[network.id] = allocator
                } catch {
                    logger.error("Failed to restore allocator for network \(network.name): \(error)")
                }
            }
        }
    }
    
    /// Create a new bridge network
    public func createNetwork(name: String, subnet: String = "172.20.0.0/16") async throws -> NetworkSummary {
        // TODO: Validate subnet overlap with existing networks
        
        var network = NetworkSummary(
            name: name,
            subnet: subnet
        )
        
        let allocator = try IPAllocator(subnet: subnet)
        allocators[network.id] = allocator
        
        try await store.insert(network)
        logger.info("Created network \(name) (\(subnet))")
        
        return network
    }
    
    /// Allocate IP for a container in a network
    public func allocateIP(networkID: UUID, containerID: UUID) async throws -> String {
        guard var allocator = allocators[networkID] else {
            throw NetworkError.networkNotFound(networkID.uuidString)
        }
        
        let ip = try allocator.allocateNext()
        allocators[networkID] = allocator // Update struct copy
        
        // Update network record
        if var network = try await store.fetch(id: networkID) {
            network.connectedContainerIDs.append(containerID)
            try await store.update(network)
        }
        
        logger.info("Allocated \(ip) for container \(containerID) in network \(networkID)")
        return ip
    }
    
    /// Mark an IP as allocated (e.g. during reconciliation)
    public func reserveIP(networkID: UUID, ip: String) async throws {
        guard var allocator = allocators[networkID] else { return }
        allocator.markAsAllocated(ip)
        allocators[networkID] = allocator
    }
    
    /// Release IP for a container
    public func releaseIP(networkID: UUID, containerID: UUID, ip: String) async throws {
        guard var allocator = allocators[networkID] else { return }
        
        allocator.release(ip: ip)
        allocators[networkID] = allocator
        
        if var network = try await store.fetch(id: networkID) {
            network.connectedContainerIDs.removeAll { $0 == containerID }
            try await store.update(network)
        }
        
        logger.info("Released \(ip) for container \(containerID)")
    }
    
    /// Get default bridge network (create if missing)
    public func ensureDefaultNetwork() async throws -> NetworkSummary {
        let networks = await store.fetchAll()
        if let existing = networks.first(where: { $0.name == "bridge" }) {
            // Restore allocator if missing
            if allocators[existing.id] == nil, let subnet = existing.subnet {
                allocators[existing.id] = try IPAllocator(subnet: subnet)
            }
            return existing
        }
        
        return try await createNetwork(name: "bridge", subnet: "172.17.0.0/16")
    }
}
