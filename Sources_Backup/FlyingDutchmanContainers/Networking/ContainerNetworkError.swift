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
        case let .invalidSubnet(s): "Invalid subnet format: \(s)"
        case let .subnetExhausted(s): "No more IPs available in subnet \(s)"
        case let .networkNotFound(n): "Network not found: \(n)"
        case let .portAlreadyBound(port):
            "Port \(port) is already bound"
        case let .vsockConnectionFailed(port, underlying):
            "Failed to connect to container port \(port): \(underlying.localizedDescription)"
        case let .portForwardFailed(message):
            "Port forward failed: \(message)"
        }
    }
}
