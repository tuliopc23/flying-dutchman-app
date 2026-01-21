import Foundation

/// Manages IP address allocation for a subnet
public struct IPAllocator: Sendable {
    public let subnet: String
    private let baseIP: UInt32
    private let mask: UInt32
    private let maxHosts: UInt32
    
    // Track allocated IPs (relative to base)
    private var allocated: Set<UInt32> = []
    
    public init(subnet: String) throws {
        self.subnet = subnet
        
        // Parse CIDR (e.g., "172.20.0.0/16")
        let parts = subnet.split(separator: "/")
        guard parts.count == 2,
              let prefixLen = Int(parts[1]),
              prefixLen >= 0 && prefixLen <= 32 else {
            throw NetworkError.invalidSubnet(subnet)
        }
        
        guard let ip = IPAllocator.ipToUInt32(String(parts[0])) else {
            throw NetworkError.invalidSubnet(subnet)
        }
        
        self.baseIP = ip
        self.mask = UInt32.max << (32 - prefixLen)
        self.maxHosts = UInt32.max >> prefixLen
        
        // Reserve network address (0) and broadcast address (max)
        // Also reserve gateway (1) usually
        allocated.insert(0)
        allocated.insert(maxHosts)
        allocated.insert(1) // Reserve .1 for gateway
    }
    
    /// Allocate next available IP
    /// - Returns: Allocated IP string (e.g., "172.20.0.2")
    public mutating func allocateNext() throws -> String {
        for i in 2..<maxHosts {
            if !allocated.contains(i) {
                allocated.insert(i)
                return IPAllocator.uint32ToIP(baseIP | i)
            }
        }
        throw NetworkError.subnetExhausted(subnet)
    }
    
    /// Mark an IP as allocated manually
    public mutating func markAsAllocated(_ ip: String) {
        guard let ipNum = IPAllocator.ipToUInt32(ip) else { return }
        if (ipNum & mask) == (baseIP & mask) {
            let hostPart = ipNum & ~mask
            allocated.insert(hostPart)
        }
    }
    
    /// Release an IP
    public mutating func release(ip: String) {
        guard let ipNum = IPAllocator.ipToUInt32(ip) else { return }
        
        // Verify IP belongs to this subnet
        if (ipNum & mask) != (baseIP & mask) {
            return
        }
        
        let hostPart = ipNum & ~mask
        // Don't release reserved addresses
        if hostPart > 1 && hostPart < maxHosts {
            allocated.remove(hostPart)
        }
    }
    
    // MARK: - Helpers
    
    private static func ipToUInt32(_ ip: String) -> UInt32? {
        let parts = ip.split(separator: ".")
        guard parts.count == 4 else { return nil }
        
        var result: UInt32 = 0
        for part in parts {
            guard let octet = UInt8(part) else { return nil }
            result = (result << 8) | UInt32(octet)
        }
        return result
    }
    
    private static func uint32ToIP(_ ip: UInt32) -> String {
        return "\(ip >> 24).\( (ip >> 16) & 0xFF ).\( (ip >> 8) & 0xFF ).\(ip & 0xFF)"
    }
}

public enum NetworkError: Error, LocalizedError {
    case invalidSubnet(String)
    case subnetExhausted(String)
    case networkNotFound(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidSubnet(let s): return "Invalid subnet format: \(s)"
        case .subnetExhausted(let s): return "No more IPs available in subnet \(s)"
        case .networkNotFound(let n): return "Network not found: \(n)"
        }
    }
}
