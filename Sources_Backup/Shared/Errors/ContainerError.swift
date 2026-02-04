import Foundation

/// Errors related to container operations
public enum ContainerError: FlyingDutchmanError {
    /// Container with the specified ID was not found
    case notFound(UUID)

    /// Container is in an invalid state for the requested operation
    case invalidState(String)

    /// The specified container image was not found
    case imageNotFound(String)

    /// Failed to extract the container filesystem
    case extractionFailed(String)

    /// The container runtime is not available
    case runtimeUnavailable(String)

    /// The container configuration is invalid
    case configurationInvalid(String)

    /// A container lifecycle operation failed
    case lifecycleFailed(operation: String, reason: String)

    /// VSOCK connection failed
    case vsockConnectionFailed(String)

    // MARK: - FlyingDutchmanError

    public var userMessage: String {
        switch self {
        case let .notFound(id):
            return "Container not found"

        case .invalidState:
            return "Container is not in the correct state for this operation"

        case let .imageNotFound(image):
            return "Image '\(image)' not found"

        case .extractionFailed:
            return "Failed to prepare the container filesystem"

        case .runtimeUnavailable:
            return "Container runtime is not available"

        case .configurationInvalid:
            return "Container configuration is invalid"

        case let .lifecycleFailed(operation, _):
            return "Failed to \(operation) container"

        case .vsockConnectionFailed:
            return "Failed to communicate with container"
        }
    }

    public var technicalMessage: String {
        switch self {
        case let .notFound(id):
            return "Container with ID \(id) not found in store"

        case let .invalidState(message):
            return "Invalid container state: \(message)"

        case let .imageNotFound(image):
            return "Image reference '\(image)' not found in local store or remote registry"

        case let .extractionFailed(details):
            return "Container rootfs extraction failed: \(details)"

        case let .runtimeUnavailable(reason):
            return "Container runtime unavailable: \(reason)"

        case let .configurationInvalid(reason):
            return "Invalid container configuration: \(reason)"

        case let .lifecycleFailed(operation, reason):
            return "Container lifecycle operation '\(operation)' failed: \(reason)"

        case let .vsockConnectionFailed(reason):
            return "VSOCK connection failed: \(reason)"
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .notFound:
            return false
        case .invalidState:
            return true // User can wait for correct state
        case .imageNotFound:
            return true // User can pull the image
        case .extractionFailed:
            return true // Can retry after cleanup
        case .runtimeUnavailable:
            return true // Runtime may become available
        case .configurationInvalid:
            return true // User can fix configuration
        case .lifecycleFailed:
            return true // Can retry the operation
        case .vsockConnectionFailed:
            return true // Container may recover
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .notFound:
            return "Verify the container ID and try again"
        case .invalidState:
            return "Wait for the container to reach the correct state"
        case let .imageNotFound(image):
            return "Pull the image with: dutchman pull \(image)"
        case .extractionFailed:
            return "Try removing and recreating the container"
        case .runtimeUnavailable:
            return "Check that the Flying Dutchman engine is running"
        case .configurationInvalid:
            return "Review the container configuration and correct any errors"
        case .lifecycleFailed:
            return "Check container logs and try the operation again"
        case .vsockConnectionFailed:
            return "Container may not be ready, try again in a moment"
        }
    }
}
