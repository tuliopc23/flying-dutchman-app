import Foundation

public enum EngineRuntime {
    private static var startedAt: Date = Date()

    public static func markStarted() {
        startedAt = Date()
    }

    public static var uptimeSeconds: Int {
        Int(Date().timeIntervalSince(startedAt))
    }
}
