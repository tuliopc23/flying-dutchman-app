import Foundation

public protocol EventRecorder {
    func record(status: String, containerId: UUID?, image: String?, kind: String, timestamp: Date)
    func recent(limit: Int) -> [[String: Any]]
}
