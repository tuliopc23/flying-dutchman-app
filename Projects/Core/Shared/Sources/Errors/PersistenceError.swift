import Foundation

/// Errors related to data persistence operations
public enum PersistenceError: FlyingDutchmanError {
    /// The database is unavailable
    case databaseUnavailable

    /// A database migration failed
    case migrationFailed(version: String, reason: String)

    /// A record was not found in the database
    case recordNotFound(type: String, id: String)

    /// Failed to save a record to the database
    case saveFailed(type: String, reason: String)

    // MARK: - FlyingDutchmanError

    public var userMessage: String {
        switch self {
        case .databaseUnavailable:
            "Database is not available"

        case .migrationFailed:
            "Failed to update the database"

        case let .recordNotFound(type, _):
            "\(type) not found"

        case let .saveFailed(type, _):
            "Could not save \(type.lowercased())"
        }
    }

    public var technicalMessage: String {
        switch self {
        case .databaseUnavailable:
            "SQLite database connection unavailable or failed to open"

        case let .migrationFailed(version, reason):
            "Database migration to version '\(version)' failed: \(reason)"

        case let .recordNotFound(type, id):
            "Record of type '\(type)' with id '\(id)' not found in database"

        case let .saveFailed(type, reason):
            "Failed to save '\(type)' to database: \(reason)"
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .databaseUnavailable:
            true // May become available
        case .migrationFailed:
            false // Usually requires intervention
        case .recordNotFound:
            false // Record doesn't exist
        case .saveFailed:
            true // Can retry
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .databaseUnavailable:
            "Check disk space and restart the application"
        case .migrationFailed:
            "Try reinstalling the application or contact support"
        case .recordNotFound:
            nil
        case .saveFailed:
            "Check available disk space and try again"
        }
    }
}
