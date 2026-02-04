import Foundation

public enum ContainerNetworkError: Error, LocalizedError, Sendable {
    case invalidSubnet(String)
    case subnetExhausted(String)
    case networkNotFound(String)
    
    case portAlreadyBound(port: Int)
    case vsockConnectionFailed(port: Int, underlying: Error)
    case portForwardFailed(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidSubnet(let s): return "Invalid subnet format: \(s)"
        case .subnetExhausted(let s): return "No more IPs available in subnet \(s)"
        case .networkNotFound(let n): return "Network not found: \(n)"
        case .portAlreadyBound(let port):
            return "Port \(port) is already bound"
        case .vsockConnectionFailed(let port, let underlying):
            return "Failed to connect to container port \(port): \(underlying.localizedDescription)"
        case .portForwardFailed(let message):
            return "Port forward failed: \(message)"
        }
    }
}
