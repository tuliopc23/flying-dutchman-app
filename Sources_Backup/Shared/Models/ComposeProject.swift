import Foundation

/// Represents a Docker Compose project
public struct ComposeProject: Identifiable, Codable, Sendable {
    public let id: UUID
    public var name: String
    public var path: String  // Directory containing docker-compose.yml
    public var services: [ComposeService]
    public var networks: [ComposeNetwork]
    public var volumes: [ComposeVolume]
    public var createdAt: Date

    public init(
        id: UUID = UUID(),
        name: String,
        path: String,
        services: [ComposeService] = [],
        networks: [ComposeNetwork] = [],
        volumes: [ComposeVolume] = [],
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.path = path
        self.services = services
        self.networks = networks
        self.volumes = volumes
        self.createdAt = createdAt
    }
}

/// Represents a service in a Docker Compose file
public struct ComposeService: Identifiable, Codable, Sendable {
    public let id: UUID
    public var name: String
    public var image: String
    public var command: [String]?
    public var environment: [String: String]
    public var ports: [String]  // Format: "host:container" or "container"
    public var volumes: [String]   // Format: "host:container[:mode]"
    public var dependsOn: [String]   // Service names this depends on
    public var restartPolicy: RestartPolicy
    public var networks: [String]     // Network names

    public init(
        id: UUID = UUID(),
        name: String,
        image: String,
        command: [String]? = nil,
        environment: [String: String] = [:],
        ports: [String] = [],
        volumes: [String] = [],
        dependsOn: [String] = [],
        restartPolicy: RestartPolicy = .no,
        networks: [String] = []
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.command = command
        self.environment = environment
        self.ports = ports
        self.volumes = volumes
        self.dependsOn = dependsOn
        self.restartPolicy = restartPolicy
        self.networks = networks
    }

    public enum RestartPolicy: String, Codable, Sendable {
        case no = "no"
        case always = "always"
        case onFailure = "on-failure"
        case unlessStopped = "unless-stopped"
    }
}

/// Represents a network in a Docker Compose file
public struct ComposeNetwork: Identifiable, Codable, Sendable {
    public let id: UUID
    public var name: String
    public var driver: String

    public init(
        id: UUID = UUID(),
        name: String,
        driver: String = "bridge"
    ) {
        self.id = id
        self.name = name
        self.driver = driver
    }
}

/// Represents a volume in a Docker Compose file
public struct ComposeVolume: Identifiable, Codable, Sendable {
    public let id: UUID
    public var name: String
    public var driver: String

    public init(
        id: UUID = UUID(),
        name: String,
        driver: String = "local"
    ) {
        self.id = id
        self.name = name
        self.driver = driver
    }
}
