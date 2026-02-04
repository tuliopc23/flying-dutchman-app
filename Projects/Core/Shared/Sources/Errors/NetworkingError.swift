import Foundation

/// Errors related to network operations
public enum NetworkingError: FlyingDutchmanError {
    /// Failed to establish a connection to the specified host and port
    case connectionFailed(host: String, port: Int, underlying: (any Error)?)

    /// A network operation timed out
    case timeout(operation: String)

    /// DNS resolution failed for the specified domain
    case dnsResolutionFailed(domain: String)

    /// A certificate validation error occurred
    case certificateError(String)

    /// Failed to bind to a local port
    case portBindingFailed(port: Int)

    // MARK: - FlyingDutchmanError

    public var userMessage: String {
        switch self {
        case let .connectionFailed(host, port, _):
            "Unable to connect to \(host):\(port)"

        case let .timeout(operation):
            "The \(operation) operation timed out"

        case let .dnsResolutionFailed(domain):
            "Could not resolve '\(domain)'"

        case .certificateError:
            "Security certificate error"

        case let .portBindingFailed(port):
            "Failed to bind to local port \(port)"
        }
    }

    public var technicalMessage: String {
        switch self {
        case let .connectionFailed(host, port, underlying):
            var message = "TCP connection failed to \(host):\(port)"
            if let error = underlying {
                message += " - \(error)"
            }
            return message

        case let .timeout(operation):
            return "Network operation '\(operation)' exceeded timeout threshold"

        case let .dnsResolutionFailed(domain):
            return "DNS lookup failed for domain '\(domain)'"

        case let .certificateError(details):
            return "TLS certificate validation failed: \(details)"

        case let .portBindingFailed(port):
            return "Failed to bind listener to port \(port). The port may be in use or requires privileges."
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .connectionFailed:
            true // Can retry when network is available
        case .timeout:
            true // Can retry
        case .dnsResolutionFailed:
            true // DNS may become available
        case .certificateError:
            false // Usually requires config change
        case .portBindingFailed:
            false // Usually requires picking a different port or killing the process using it
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .connectionFailed:
            "Check your network connection and try again"
        case .timeout:
            "Check network connectivity or try again later"
        case .dnsResolutionFailed:
            "Check the hostname and your DNS settings"
        case .certificateError:
            "Verify the server's SSL certificate is valid and trusted"
        case .portBindingFailed:
            "Try using a different port or check if another application is using it"
        }
    }
}

// MARK: - Sendable Conformance

extension NetworkingError: @unchecked Sendable {
    // The underlying error in connectionFailed may not be Sendable,
    // but we treat it as unchecked since we only read from it
}
