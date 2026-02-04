import Foundation
import Logging

/// A log handler that writes log messages to dated files with rotation and retention support.
public struct FileLogHandler: LogHandler, Sendable {
    public var logLevel: Logger.Level = .info
    public var metadata: Logger.Metadata = [:]

    private let logDirectory: URL
    private let maxFileSize: UInt64
    private let retentionDays: Int
    private let label: String

    /// Creates a new file log handler.
    /// - Parameters:
    ///   - label: The logger label
    ///   - logDirectory: Directory where log files are stored
    ///   - maxFileSize: Maximum size per log file before rotation (default: 10MB)
    ///   - retentionDays: Number of days to retain log files (default: 7)
    public init(
        label: String,
        logDirectory: URL,
        maxFileSize: UInt64 = 10 * 1024 * 1024,
        retentionDays: Int = 7
    ) {
        self.label = label
        self.logDirectory = logDirectory
        self.maxFileSize = maxFileSize
        self.retentionDays = retentionDays
    }

    public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
        get { metadata[key] }
        set { metadata[key] = newValue }
    }

    public func log(
        level: Logger.Level,
        message: Logger.Message,
        metadata: Logger.Metadata?,
        source: String,
        file: String,
        function: String,
        line: UInt
    ) {
        let effectiveMetadata = mergedMetadata(metadata)
        let formattedMessage = formatMessage(
            level: level,
            message: message,
            metadata: effectiveMetadata,
            source: source,
            file: file,
            function: function,
            line: line
        )

        writeToFile(formattedMessage)
    }

    // MARK: - Private Helpers

    private func mergedMetadata(_ additionalMetadata: Logger.Metadata?) -> Logger.Metadata {
        guard let additionalMetadata else { return metadata }
        return metadata.merging(additionalMetadata) { _, new in new }
    }

    private func formatMessage(
        level: Logger.Level,
        message: Logger.Message,
        metadata: Logger.Metadata,
        source: String,
        file: String,
        function: String,
        line: UInt
    ) -> String {
        let timestamp = ISO8601DateFormatter().string(from: Date())
        let levelString = level.rawValue.uppercased().padding(toLength: 8, withPad: " ", startingAt: 0)
        let sourceLabel = source.isEmpty ? label : source

        var output = "[\(timestamp)] [\(levelString)] [\(sourceLabel)] \(message)"

        if !metadata.isEmpty {
            let metadataString = metadata
                .sorted { $0.key < $1.key }
                .map { "\($0.key)=\($0.value)" }
                .joined(separator: " ")
            output += " {\(metadataString)}"
        }

        return output
    }

    private func writeToFile(_ message: String) {
        let fileManager = FileManager.default
        let logFileURL = currentLogFileURL()

        do {
            try ensureLogDirectoryExists(fileManager: fileManager)
            rotateIfNeeded(logFileURL, fileManager: fileManager)

            let messageWithNewline = message + "\n"
            if let data = messageWithNewline.data(using: .utf8) {
                if fileManager.fileExists(atPath: logFileURL.path) {
                    let handle = try FileHandle(forWritingTo: logFileURL)
                    try handle.seekToEnd()
                    try handle.write(contentsOf: data)
                    try handle.close()
                } else {
                    try data.write(to: logFileURL, options: .atomic)
                }
            }
        } catch {
            // Fallback to stderr if file logging fails
            fputs("FileLogHandler error: \(error)\n", stderr)
            fputs(message + "\n", stderr)
        }
    }

    private func currentLogFileURL() -> URL {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: Date())
        return logDirectory.appendingPathComponent("flyingdutchman-\(dateString).log")
    }

    private func ensureLogDirectoryExists(fileManager: FileManager) throws {
        if !fileManager.fileExists(atPath: logDirectory.path) {
            try fileManager.createDirectory(at: logDirectory, withIntermediateDirectories: true)
        }
    }

    private func rotateIfNeeded(_ logFileURL: URL, fileManager: FileManager) {
        guard fileManager.fileExists(atPath: logFileURL.path) else { return }

        do {
            let attributes = try fileManager.attributesOfItem(atPath: logFileURL.path)
            if let fileSize = attributes[.size] as? UInt64, fileSize >= maxFileSize {
                let rotatedURL = rotatedLogFileURL(for: logFileURL)
                try fileManager.moveItem(at: logFileURL, to: rotatedURL)
            }
        } catch {
            fputs("FileLogHandler rotation error: \(error)\n", stderr)
        }
    }

    private func rotatedLogFileURL(for originalURL: URL) -> URL {
        let timestamp = ISO8601DateFormatter().string(from: Date())
            .replacingOccurrences(of: ":", with: "-")
        let baseName = originalURL.deletingPathExtension().lastPathComponent
        return logDirectory.appendingPathComponent("\(baseName)-\(timestamp).log")
    }

    // MARK: - Retention

    /// Cleans up log files older than the retention period.
    /// Call this at application startup.
    public func performRetentionCleanup() {
        let fileManager = FileManager.default
        let calendar = Calendar.current
        guard let cutoffDate = calendar.date(byAdding: .day, value: -retentionDays, to: Date()) else {
            return
        }

        do {
            let logFiles = try fileManager.contentsOfDirectory(
                at: logDirectory,
                includingPropertiesForKeys: [.creationDateKey],
                options: [.skipsHiddenFiles]
            )

            for fileURL in logFiles where fileURL.pathExtension == "log" {
                let attributes = try fileURL.resourceValues(forKeys: [.creationDateKey])
                if let creationDate = attributes.creationDate, creationDate < cutoffDate {
                    try fileManager.removeItem(at: fileURL)
                }
            }
        } catch {
            fputs("FileLogHandler retention cleanup error: \(error)\n", stderr)
        }
    }
}
