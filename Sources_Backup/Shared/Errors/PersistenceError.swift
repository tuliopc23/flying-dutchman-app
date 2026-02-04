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
            return "Database is not available"

        case .migrationFailed:
            return "Failed to update the database"

        case let .recordNotFound(type, _):
            return "\(type) not found"

        case let .saveFailed(type, _):
            return "Could not save \(type.lowercased())"
        }
    }

    public var technicalMessage: String {
        switch self {
        case .databaseUnavailable:
            return "SQLite database connection unavailable or failed to open"

        case let .migrationFailed(version, reason):
            return "Database migration to version '\(version)' failed: \(reason)"

        case let .recordNotFound(type, id):
            return "Record of type '\(type)' with id '\(id)' not found in database"

        case let .saveFailed(type, reason):
            return "Failed to save '\(type)' to database: \(reason)"
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .databaseUnavailable:
            return true // May become available
        case .migrationFailed:
            return false // Usually requires intervention
        case .recordNotFound:
            return false // Record doesn't exist
        case .saveFailed:
            return true // Can retry
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .databaseUnavailable:
            return "Check disk space and restart the application"
        case .migrationFailed:
            return "Try reinstalling the application or contact support"
        case .recordNotFound:
            return nil
        case .saveFailed:
            return "Check available disk space and try again"
        }
    }
}
