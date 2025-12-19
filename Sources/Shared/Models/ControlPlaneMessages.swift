import Foundation

public enum ControlPlaneCommand: Codable, Sendable {
    case ping
    case stop
    case resizeTty(rows: UInt16, cols: UInt16)
}

public enum ControlPlaneEvent: Codable, Sendable {
    case pong
    case logLine(String)
    case exit(code: Int32)
}
