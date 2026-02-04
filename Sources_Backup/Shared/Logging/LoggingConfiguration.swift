import Foundation
import Logging

/// Configures the global logging system for Flying Dutchman.
public enum LoggingConfiguration: Sendable {
    /// The default log directory.
    public static var logDirectory: URL {
        FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent("Library/Logs/FlyingDutchman", isDirectory: true)
    }

    /// Bootstraps the logging system with console and file handlers.
    ///
    /// This should be called once at application startup before any loggers are created.
    ///
    /// Configuration:
    /// - Console output: StreamLogHandler to stdout
    /// - File output: FileLogHandler with rotation (10MB) and retention (7 days)
    /// - Log level: Configurable via FD_LOG_LEVEL environment variable
    ///
    /// Supported FD_LOG_LEVEL values: trace, debug, info, notice, warning, error, critical
    public static func bootstrap() {
        let logLevel = logLevelFromEnvironment()
        let logDir = logDirectory

        // Perform retention cleanup before starting
        let cleanupHandler = FileLogHandler(label: "bootstrap", logDirectory: logDir)
        cleanupHandler.performRetentionCleanup()

        LoggingSystem.bootstrap { label in
            var fileHandler = FileLogHandler(label: label, logDirectory: logDir)
            fileHandler.logLevel = logLevel

            var streamHandler = StreamLogHandler.standardOutput(label: label)
            streamHandler.logLevel = logLevel

            return MultiplexLogHandler([streamHandler, fileHandler])
        }
    }

    /// Parses the log level from the FD_LOG_LEVEL environment variable.
    /// - Returns: The configured log level, defaulting to `.info` if not set or invalid.
    public static func logLevelFromEnvironment() -> Logger.Level {
        guard let levelString = ProcessInfo.processInfo.environment["FD_LOG_LEVEL"]?.lowercased() else {
            return .info
        }

        switch levelString {
        case "trace":
            return .trace
        case "debug":
            return .debug
        case "info":
            return .info
        case "notice":
            return .notice
        case "warning":
            return .warning
        case "error":
            return .error
        case "critical":
            return .critical
        default:
            return .info
        }
    }
}
