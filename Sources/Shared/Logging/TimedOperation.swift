import Foundation
import Logging

/// Extension for timing and logging operations.
extension Loggers {
    /// Executes an async operation and logs its duration.
    ///
    /// Logs the start of the operation, then logs either success or failure with the elapsed time.
    ///
    /// - Parameters:
    ///   - category: The log category for this operation
    ///   - operation: A description of the operation being timed
    ///   - level: The log level for start/success messages (default: .debug)
    ///   - work: The async throwing closure to execute
    /// - Returns: The result of the work closure
    /// - Throws: Rethrows any error from the work closure
    public static func timed<T: Sendable>(
        category: LogCategory,
        operation: String,
        level: Logger.Level = .debug,
        _ work: @Sendable () async throws -> T
    ) async rethrows -> T {
        let logger = make(category: category)
        let startTime = ContinuousClock.now

        logger.log(level: level, "Starting: \(operation)")

        do {
            let result = try await work()
            let duration = startTime.duration(to: .now)
            logger.log(level: level, "Completed: \(operation)", metadata: [
                "duration_ms": "\(duration.components.seconds * 1000 + duration.components.attoseconds / 1_000_000_000_000_000)"
            ])
            return result
        } catch {
            let duration = startTime.duration(to: .now)
            logger.error("Failed: \(operation)", metadata: [
                "duration_ms": "\(duration.components.seconds * 1000 + duration.components.attoseconds / 1_000_000_000_000_000)",
                "error": "\(error)"
            ])
            throw error
        }
    }

    /// Executes a synchronous operation and logs its duration.
    ///
    /// - Parameters:
    ///   - category: The log category for this operation
    ///   - operation: A description of the operation being timed
    ///   - level: The log level for start/success messages (default: .debug)
    ///   - work: The throwing closure to execute
    /// - Returns: The result of the work closure
    /// - Throws: Rethrows any error from the work closure
    public static func timed<T>(
        category: LogCategory,
        operation: String,
        level: Logger.Level = .debug,
        _ work: () throws -> T
    ) rethrows -> T {
        let logger = make(category: category)
        let startTime = ContinuousClock.now

        logger.log(level: level, "Starting: \(operation)")

        do {
            let result = try work()
            let duration = startTime.duration(to: .now)
            logger.log(level: level, "Completed: \(operation)", metadata: [
                "duration_ms": "\(duration.components.seconds * 1000 + duration.components.attoseconds / 1_000_000_000_000_000)"
            ])
            return result
        } catch {
            let duration = startTime.duration(to: .now)
            logger.error("Failed: \(operation)", metadata: [
                "duration_ms": "\(duration.components.seconds * 1000 + duration.components.attoseconds / 1_000_000_000_000_000)",
                "error": "\(error)"
            ])
            throw error
        }
    }
}
