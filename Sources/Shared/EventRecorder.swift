import Foundation

public protocol EventRecorder {
    func record(status: String, containerId: UUID?, image: String?, kind: String, timestamp: Date)
    func recent(limit: Int) -> [[String: Any]]
}

public extension EventRecorder {
    func record(status: String, containerId: UUID?, image: String?, kind: String) {
        record(status: status, containerId: containerId, image: image, kind: kind, timestamp: Date())
    }
}

public protocol ContainerLogStoring {
    func append(containerID: UUID, line: String, date: Date)
    func fetch(containerID: UUID, limit: Int) -> [String]
}

public extension ContainerLogStoring {
    func append(containerID: UUID, line: String) {
        append(containerID: containerID, line: line, date: Date())
    }

    func fetch(containerID: UUID) -> [String] {
        fetch(containerID: containerID, limit: 200)
    }
}
