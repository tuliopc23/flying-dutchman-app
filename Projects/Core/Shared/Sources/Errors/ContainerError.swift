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
            "Container not found"

        case .invalidState:
            "Container is not in the correct state for this operation"

        case let .imageNotFound(image):
            "Image '\(image)' not found"

        case .extractionFailed:
            "Failed to prepare the container filesystem"

        case .runtimeUnavailable:
            "Container runtime is not available"

        case .configurationInvalid:
            "Container configuration is invalid"

        case let .lifecycleFailed(operation, _):
            "Failed to \(operation) container"

        case .vsockConnectionFailed:
            "Failed to communicate with container"
        }
    }

    public var technicalMessage: String {
        switch self {
        case let .notFound(id):
            "Container with ID \(id) not found in store"

        case let .invalidState(message):
            "Invalid container state: \(message)"

        case let .imageNotFound(image):
            "Image reference '\(image)' not found in local store or remote registry"

        case let .extractionFailed(details):
            "Container rootfs extraction failed: \(details)"

        case let .runtimeUnavailable(reason):
            "Container runtime unavailable: \(reason)"

        case let .configurationInvalid(reason):
            "Invalid container configuration: \(reason)"

        case let .lifecycleFailed(operation, reason):
            "Container lifecycle operation '\(operation)' failed: \(reason)"

        case let .vsockConnectionFailed(reason):
            "VSOCK connection failed: \(reason)"
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .notFound:
            false
        case .invalidState:
            true // User can wait for correct state
        case .imageNotFound:
            true // User can pull the image
        case .extractionFailed:
            true // Can retry after cleanup
        case .runtimeUnavailable:
            true // Runtime may become available
        case .configurationInvalid:
            true // User can fix configuration
        case .lifecycleFailed:
            true // Can retry the operation
        case .vsockConnectionFailed:
            true // Container may recover
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .notFound:
            "Verify the container ID and try again"
        case .invalidState:
            "Wait for the container to reach the correct state"
        case let .imageNotFound(image):
            "Pull the image with: dutchman pull \(image)"
        case .extractionFailed:
            "Try removing and recreating the container"
        case .runtimeUnavailable:
            "Check that the Flying Dutchman engine is running"
        case .configurationInvalid:
            "Review the container configuration and correct any errors"
        case .lifecycleFailed:
            "Check container logs and try the operation again"
        case .vsockConnectionFailed:
            "Container may not be ready, try again in a moment"
        }
    }
}
