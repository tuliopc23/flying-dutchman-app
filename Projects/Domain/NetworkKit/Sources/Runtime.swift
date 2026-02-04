import Foundation

public enum EngineRuntime {
    private static let startedAt: Date = Date()

    public static var uptimeSeconds: Int {
        Int(Date().timeIntervalSince(startedAt))
    }
}
