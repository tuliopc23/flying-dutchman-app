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

    // MARK: - FlyingDutchmanError

    public var userMessage: String {
        switch self {
        case let .connectionFailed(host, port, _):
            return "Unable to connect to \(host):\(port)"

        case let .timeout(operation):
            return "The \(operation) operation timed out"

        case let .dnsResolutionFailed(domain):
            return "Could not resolve '\(domain)'"

        case .certificateError:
            return "Security certificate error"
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
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .connectionFailed:
            return true // Can retry when network is available
        case .timeout:
            return true // Can retry
        case .dnsResolutionFailed:
            return true // DNS may become available
        case .certificateError:
            return false // Usually requires config change
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .connectionFailed:
            return "Check your network connection and try again"
        case .timeout:
            return "Check network connectivity or try again later"
        case .dnsResolutionFailed:
            return "Check the hostname and your DNS settings"
        case .certificateError:
            return "Verify the server's SSL certificate is valid and trusted"
        }
    }
}

// MARK: - Sendable Conformance

extension NetworkingError: @unchecked Sendable {
    // The underlying error in connectionFailed may not be Sendable,
    // but we treat it as unchecked since we only read from it
}
