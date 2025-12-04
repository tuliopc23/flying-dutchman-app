import Foundation

@objc public protocol EngineXPCProtocol {
    func fetchStatus(reply: @escaping (EngineXPCStatus) -> Void)
}

public struct EngineXPCStatus: Codable {
    public let engine: String
    public let uptimeSeconds: Int
    public let workers: [String: String]
}
