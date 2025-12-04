import Foundation
import GRDB
import Shared

public final class DatabaseContainer {
    public static let shared = DatabaseContainer()
    public let dbQueue: DatabaseQueue

    private init() {
        let logger = Loggers.make(category: "flyingdutchman.persistence")
        let url = DatabaseContainer.databaseURL()
        do {
            dbQueue = try DatabaseQueue(path: url.path)
            logger.info("Initialized SQLite at \(url.path)")
        } catch {
            logger.error("Failed to open SQLite at \(url.path): \(error.localizedDescription). Using in-memory fallback.")
            dbQueue = try! DatabaseQueue()
        }
    }

    private static func databaseURL() -> URL {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let dir = base.appendingPathComponent(AppConfig.appName.lowercased(), isDirectory: true)
        try? fm.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appendingPathComponent("flyingdutchman.sqlite")
    }
}
