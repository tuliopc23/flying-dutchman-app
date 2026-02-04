import Foundation

/// Base error protocol for all Flying Dutchman errors
///
/// This protocol provides a unified interface for error handling across the application,
/// with support for both user-facing messages and technical debugging information.
public protocol FlyingDutchmanError: LocalizedError, Sendable {
    /// A user-friendly message suitable for display in the UI
    var userMessage: String { get }

    /// A technical message with details for debugging and logging
    var technicalMessage: String { get }

    /// Indicates whether the error can be recovered from (e.g., retry, user action)
    var isRecoverable: Bool { get }

    /// An optional suggested action the user can take to resolve the error
    var suggestedAction: String? { get }
}

// MARK: - Default Implementations

extension FlyingDutchmanError {
    /// Default implementation uses userMessage as the error description
    public var errorDescription: String? {
        userMessage
    }

    /// Default implementation returns nil (no specific suggested action)
    public var suggestedAction: String? {
        nil
    }
}
