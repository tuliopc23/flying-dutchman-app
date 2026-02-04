import Foundation

#if canImport(Hummingbird)
import Hummingbird
#endif

public struct Machine: Codable, Sendable, Identifiable {
    public let id: String
    public var name: String
    public var distro: String
    public var version: String
    public var status: MachineStatus
    public var cpuCount: Int
    public var memoryGB: Int
    public var diskGB: Int
    public var macAddress: String?
    public var ipAddress: String?
    public var sshPort: Int?
    public var isKubernetesCluster: Bool
    public var kubernetesVersion: String?
    public var createdAt: Date
    public var updatedAt: Date
    
    public init(
        id: String = UUID().uuidString,
        name: String,
        distro: String,
        version: String,
        status: MachineStatus = .stopped,
        cpuCount: Int = 2,
        memoryGB: Int = 2,
        diskGB: Int = 20,
        macAddress: String? = nil,
        ipAddress: String? = nil,
        sshPort: Int? = nil,
        isKubernetesCluster: Bool = false,
        kubernetesVersion: String? = nil,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.distro = distro
        self.version = version
        self.status = status
        self.cpuCount = cpuCount
        self.memoryGB = memoryGB
        self.diskGB = diskGB
        self.macAddress = macAddress
        self.ipAddress = ipAddress
        self.sshPort = sshPort
        self.isKubernetesCluster = isKubernetesCluster
        self.kubernetesVersion = kubernetesVersion
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

public enum MachineStatus: String, Codable, Sendable {
    case creating
    case starting
    case running
    case stopping
    case stopped
    case error
}

public struct MachineConfig: Codable, Sendable {
    public var distro: String
    public var version: String
    public var cpuCount: Int
    public var memoryGB: Int
    public var diskGB: Int
    public var cloudInitData: String?
    public var sshPublicKey: String?
    public var installK3s: Bool
    
    public init(
        distro: String,
        version: String,
        cpuCount: Int = 2,
        memoryGB: Int = 2,
        diskGB: Int = 20,
        cloudInitData: String? = nil,
        sshPublicKey: String? = nil,
        installK3s: Bool = false
    ) {
        self.distro = distro
        self.version = version
        self.cpuCount = cpuCount
        self.memoryGB = memoryGB
        self.diskGB = diskGB
        self.cloudInitData = cloudInitData
        self.sshPublicKey = sshPublicKey
        self.installK3s = installK3s
    }
}

public enum MachineDistro: String, Codable, Sendable, CaseIterable {
    case ubuntu
    case debian
    case fedora
    case alpine
    case arch
    
    public var displayName: String {
        switch self {
        case .ubuntu: return "Ubuntu"
        case .debian: return "Debian"
        case .fedora: return "Fedora"
        case .alpine: return "Alpine Linux"
        case .arch: return "Arch Linux"
        }
    }
    
    public var defaultVersions: [String] {
        switch self {
        case .ubuntu: return ["24.04", "22.04", "20.04"]
        case .debian: return ["12", "11", "10"]
        case .fedora: return ["39", "38", "37"]
        case .alpine: return ["3.19", "3.18", "3.17"]
        case .arch: return ["latest"]
        }
    }
}

#if canImport(Hummingbird)
import NIOCore

extension Machine: ResponseGenerator {
    public func response(from request: Request, context: some RequestContext) throws -> Response {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(self)
        return Response(
            status: .ok,
            headers: [.contentType: "application/json"],
            body: .init(contentLength: data.count) { writer in
                try await writer.write(ByteBuffer(data: data))
            }
        )
    }
}

extension MachineConfig: ResponseGenerator {
    public func response(from request: Request, context: some RequestContext) throws -> Response {
        let data = try JSONEncoder().encode(self)
        return Response(
            status: .ok,
            headers: [.contentType: "application/json"],
            body: .init(contentLength: data.count) { writer in
                try await writer.write(ByteBuffer(data: data))
            }
        )
    }
}
#endif
