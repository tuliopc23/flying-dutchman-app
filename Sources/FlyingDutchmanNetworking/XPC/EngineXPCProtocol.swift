import Foundation

@objc public protocol EngineXPCProtocol {
    /// Returns JSON-encoded `EngineXPCStatus` data.
    func fetchStatus(reply: @escaping (NSData) -> Void)
}

public struct EngineXPCStatus: Codable, Sendable {
    public let engine: String
    public let uptimeSeconds: Int
    public let workers: [String: String]
}
