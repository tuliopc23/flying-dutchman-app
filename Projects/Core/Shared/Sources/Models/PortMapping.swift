import Foundation

/// Represents a port mapping from host to container
///
/// Port mappings follow Docker CLI format: `hostPort:containerPort[/protocol]`
///
/// ## Examples
///
/// ```swift
/// // Basic TCP mapping
/// let mapping = try PortMapping.parse("8080:80")
/// // Result: hostPort=8080, containerPort=80, protocol=.tcp
///
/// // Explicit TCP
/// let mapping = try PortMapping.parse("3000:3000/tcp")
///
/// // UDP mapping
/// let mapping = try PortMapping.parse("53:53/udp")
/// ```
public struct PortMapping: Codable, Sendable, Hashable {
    /// Port on the host machine
    public let hostPort: Int

    /// Port inside the container
    public let containerPort: Int

    /// Network protocol (TCP or UDP)
    public let `protocol`: NetworkProtocol

    /// Network protocol type
    public enum NetworkProtocol: String, Codable, Sendable {
        case tcp
        case udp
    }

    /// Create a port mapping
    ///
    /// - Parameters:
    ///   - hostPort: Port to bind on host
    ///   - containerPort: Port inside container
    ///   - protocol: Network protocol (default: TCP)
    public init(hostPort: Int, containerPort: Int, protocol: NetworkProtocol = .tcp) {
        self.hostPort = hostPort
        self.containerPort = containerPort
        self.protocol = `protocol`
    }

    /// Parse port mapping from Docker CLI format
    ///
    /// Supports formats:
    /// - `8080:80` - TCP (default)
    /// - `3000:3000/tcp` - Explicit TCP
    /// - `53:53/udp` - UDP
    ///
    /// - Parameter spec: Port mapping specification string
    /// - Returns: Parsed `PortMapping`
    /// - Throws: `PortMappingError` if format is invalid
    public static func parse(_ spec: String) throws -> PortMapping {
        // Split by protocol
        let parts = spec.split(separator: "/")
        let portPart = String(parts[0])
        let protocolString = parts.count > 1 ? String(parts[1]) : "tcp"

        // Parse protocol
        guard let proto = NetworkProtocol(rawValue: protocolString.lowercased()) else {
            throw PortMappingError.invalidProtocol(protocolString)
        }

        // Split by port separator
        let ports = portPart.split(separator: ":")
        guard ports.count == 2 else {
            throw PortMappingError.invalidFormat(spec, reason: "Expected format: hostPort:containerPort")
        }

        // Parse port numbers
        guard let hostPort = Int(ports[0]) else {
            throw PortMappingError.invalidPort(String(ports[0]), field: "hostPort")
        }

        guard let containerPort = Int(ports[1]) else {
            throw PortMappingError.invalidPort(String(ports[1]), field: "containerPort")
        }

        // Validate port ranges
        try validatePortRange(hostPort, field: "hostPort")
        try validatePortRange(containerPort, field: "containerPort")

        return PortMapping(hostPort: hostPort, containerPort: containerPort, protocol: proto)
    }

    /// Validate port is in valid range (1-65535)
    private static func validatePortRange(_ port: Int, field: String) throws {
        guard port >= 1, port <= 65535 else {
            throw PortMappingError.portOutOfRange(port, field: field)
        }
    }

    /// Convert to Docker CLI format string
    ///
    /// - Returns: String like "8080:80/tcp"
    public func toSpec() -> String {
        if `protocol` == .tcp {
            "\(hostPort):\(containerPort)" // TCP is default, omit protocol
        } else {
            "\(hostPort):\(containerPort)/\(self.protocol.rawValue)"
        }
    }
}

// MARK: - CustomStringConvertible

extension PortMapping: CustomStringConvertible {
    public var description: String {
        toSpec()
    }
}

// MARK: - Errors

/// Port mapping parsing errors
public enum PortMappingError: Error, LocalizedError {
    case invalidFormat(String, reason: String)
    case invalidProtocol(String)
    case invalidPort(String, field: String)
    case portOutOfRange(Int, field: String)

    public var errorDescription: String? {
        switch self {
        case let .invalidFormat(spec, reason):
            "Invalid port mapping format '\(spec)': \(reason)"
        case let .invalidProtocol(proto):
            "Invalid protocol '\(proto)'. Expected 'tcp' or 'udp'"
        case let .invalidPort(value, field):
            "Invalid \(field) '\(value)'. Expected a number between 1-65535"
        case let .portOutOfRange(port, field):
            "\(field) \(port) is out of range. Must be between 1-65535"
        }
    }
}
