import Foundation

@objc public protocol EngineXPCProtocol {
    /// Returns JSON-encoded `EngineXPCStatus` data.
    func fetchStatus(reply: @escaping (NSData) -> Void)

    /// Returns JSON-encoded array of containers.
    func listContainers(reply: @escaping (NSData?, NSError?) -> Void)

    /// Starts a container by ID. Returns JSON-encoded updated container or error.
    func startContainer(id: String, reply: @escaping (NSData?, NSError?) -> Void)

    /// Stops a container by ID. Returns JSON-encoded updated container or error.
    func stopContainer(id: String, reply: @escaping (NSData?, NSError?) -> Void)
}

public struct EngineXPCStatus: Codable, Sendable {
    public let engine: String
    public let uptimeSeconds: Int
    public let workers: [String: String]
    public let runtimeMode: String?

    public init(engine: String, uptimeSeconds: Int, workers: [String: String], runtimeMode: String? = nil) {
        self.engine = engine
        self.uptimeSeconds = uptimeSeconds
        self.workers = workers
        self.runtimeMode = runtimeMode
    }
}
