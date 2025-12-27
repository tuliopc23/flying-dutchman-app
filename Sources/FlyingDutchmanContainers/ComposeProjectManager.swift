import Foundation
import Logging
import Shared
import Yams

/// Manager for Docker Compose projects with multi-container orchestration
public actor ComposeProjectManager {
    private let logger = Loggers.make(category: .containers)
    private let runtime: ContainerRuntimeProtocol

    /// Active projects by path
    private var activeProjects: [String: ComposeProject] = [:]

    /// Container IDs mapped to service names
    private var containerMapping: [UUID: String] = [:]

    public init(runtime: ContainerRuntimeProtocol) {
        self.runtime = runtime
    }

    /// Parse a docker-compose.yml file
    /// - Parameter path: Path to the docker-compose.yml file
    /// - Returns: Parsed ComposeProject
    /// - Throws: ComposeError if parsing fails
    public func parseComposeFile(at path: String) throws -> ComposeProject {
        logger.info("Parsing docker-compose.yml at \(path)")

        guard FileManager.default.fileExists(atPath: path) else {
            throw ComposeError.fileNotFound(path)
        }

        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        // Decode using Yams
        let yaml = try ComposeYAMLDecoder.decode(data)

        let project = try buildProject(from: yaml, path: path)

        logger.info("Parsed compose project '\(project.name)' with \(project.services.count) services")
        return project
    }

    /// Start all services in a compose project
    /// - Parameters:
    ///   - project: The compose project to start
    ///   - recreate: Whether to recreate containers if they exist
    /// - Throws: ComposeError if starting fails
    public func up(project: ComposeProject, recreate: Bool = false) async throws {
        logger.info("Starting compose project '\(project.name)'")

        // Create dependency graph
        let orderedServices = try resolveDependencies(services: project.services)

        // Create and start services in dependency order
        var startedContainers: [String: UUID] = [:]

        for service in orderedServices {
            logger.info("Starting service '\(service.name)'")

            // Create or recreate container
            let containerID: UUID
            if recreate {
                // Remove existing container if it exists
                if let existingID = findContainerID(for: service.name, in: project) {
                    try await runtime.removeContainer(id: existingID)
                }
                containerID = try await createContainer(from: service, project: project)
            } else {
                // Try to find existing container
                if let existingID = findContainerID(for: service.name, in: project),
                   try await isContainerRunning(id: existingID) {
                    containerID = existingID
                    logger.info("Using existing container for service '\(service.name)'")
                } else {
                    containerID = try await createContainer(from: service, project: project)
                }
            }

            // Start the container
            try await runtime.startContainer(id: containerID)
            startedContainers[service.name] = containerID

            // Wait a moment for dependent services to be ready
            // In a real implementation, this would use health checks
            try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second

            logger.info("Service '\(service.name)' started (container: \(containerID))")
        }

        // Store mapping
        for (serviceName, containerID) in startedContainers {
            containerMapping[containerID] = serviceName
        }

        activeProjects[project.path] = project

        logger.info("Compose project '\(project.name)' started successfully")
    }

    /// Stop all services in a compose project
    /// - Parameters:
    ///   - project: The compose project to stop
    ///   - removeVolumes: Whether to remove volumes
    /// - Throws: ComposeError if stopping fails
    public func down(project: ComposeProject, removeVolumes: Bool = false) async throws {
        logger.info("Stopping compose project '\(project.name)'")

        // Get all containers for this project
        let containers = await runtime.listContainers()
        let projectContainers = containers.filter { container in
            containerMapping[container.id] != nil
        }

        // Stop in reverse dependency order (last started, first stopped)
        for container in projectContainers.reversed() {
            logger.info("Stopping container '\(container.name)' (\(container.id))")

            do {
                _ = try await runtime.stopContainer(id: container.id)
                logger.info("Container '\(container.name)' stopped")
            } catch {
                logger.error("Failed to stop container '\(container.name)': \(error)")
            }
        }

        // Remove containers if requested (compose down always removes)
        for container in projectContainers.reversed() {
            logger.info("Removing container '\(container.name)' (\(container.id))")

            do {
                try await runtime.removeContainer(id: container.id)
                containerMapping.removeValue(forKey: container.id)
            } catch {
                logger.error("Failed to remove container '\(container.name)': \(error)")
            }
        }

        // Remove volumes if requested
        if removeVolumes {
            for volume in project.volumes {
                logger.info("Removing volume '\(volume.name)'")
                // TODO: Implement volume removal
            }
        }

        activeProjects.removeValue(forKey: project.path)

        logger.info("Compose project '\(project.name)' stopped successfully")
    }

    /// Restart all services in a compose project
    /// - Parameter project: The compose project to restart
    /// - Throws: ComposeError if restart fails
    public func restart(project: ComposeProject) async throws {
        logger.info("Restarting compose project '\(project.name)'")

        // Down then up
        try await down(project: project, removeVolumes: false)
        try await up(project: project, recreate: false)

        logger.info("Compose project '\(project.name)' restarted successfully")
    }

    // MARK: - Private Helpers

    private func buildProject(from yaml: ComposeYAML, path: String) throws -> ComposeProject {
        let projectName = yaml.name ?? URL(fileURLWithPath: path).deletingLastPathComponent().lastPathComponent

        let services = yaml.services.map { serviceYAML -> ComposeService in
            ComposeService(
                name: serviceYAML.name,
                image: serviceYAML.image,
                command: serviceYAML.command,
                environment: serviceYAML.environment ?? [:],
                ports: serviceYAML.ports ?? [],
                volumes: serviceYAML.volumes ?? [],
                dependsOn: serviceYAML.depends_on ?? [],
                restartPolicy: RestartPolicy(rawValue: serviceYAML.restart ?? "no") ?? .no,
                networks: serviceYAML.networks ?? []
            )
        }

        let networks = (yaml.networks ?? [:]).map { (name, config) -> ComposeNetwork in
            ComposeNetwork(name: name, driver: config.driver ?? "bridge")
        }

        let volumes = (yaml.volumes ?? [:]).map { (name, config) -> ComposeVolume in
            ComposeVolume(name: name, driver: config.driver ?? "local")
        }

        return ComposeProject(
            name: projectName,
            path: path,
            services: services,
            networks: networks,
            volumes: volumes
        )
    }

    /// Resolve service dependencies to determine startup order
    /// - Parameter services: All services in the project
    /// - Returns: Services ordered by dependency
    /// - Throws: ComposeError if circular dependencies detected
    private func resolveDependencies(services: [ComposeService]) throws -> [ComposeService] {
        var ordered: [ComposeService] = []
        var visited = Set<String>()
        var visiting = Set<String>()

        let serviceMap = Dictionary(uniqueKeysWithValues: services.map { ($0.name, $0) })

        func visit(_ serviceName: String) throws {
            guard let service = serviceMap[serviceName] else {
                throw ComposeError.invalidDependency("Service '\(serviceName)' not found")
            }

            if visiting.contains(serviceName) {
                throw ComposeError.circularDependency("Circular dependency detected involving '\(serviceName)'")
            }

            if visited.contains(serviceName) {
                return
            }

            visiting.insert(serviceName)

            // Visit dependencies first
            for depName in service.dependsOn {
                try visit(depName)
            }

            visiting.remove(serviceName)
            visited.insert(serviceName)
            ordered.append(service)
        }

        // Visit all services
        for service in services {
            try visit(service.name)
        }

        return ordered
    }

    private func createContainer(from service: ComposeService, project: ComposeProject) async throws -> UUID {
        let config = ContainerConfig(
            ports: service.ports.isEmpty ? nil : service.ports,
            env: service.environment.isEmpty ? nil : service.environment,
            volumes: service.volumes.isEmpty ? nil : service.volumes,
            command: service.command
        )

        let container = try await runtime.createContainer(
            name: "\(project.name)_\(service.name)",
            image: service.image,
            config: config
        )

        return container.id
    }

    private func findContainerID(for serviceName: String, in project: ComposeProject) -> UUID? {
        // Find container by name pattern: project_service_N
        let containers = Task { await runtime.listContainers() }
        let result = (try? await container.value) ?? []

        let namePattern = "\(project.name)_\(serviceName)"
        return result.first { $0.name.hasPrefix(namePattern) }?.id
    }

    private func isContainerRunning(id: UUID) async throws -> Bool {
        let containers = try await runtime.listContainers()
        return containers.contains { $0.id == id && $0.status == .running }
    }
}

// MARK: - YAML Parser

private struct ComposeYAML: Codable {
    let version: String?
    let name: String?
    let services: [ComposeServiceYAML]
    let networks: [String: ComposeNetworkConfig]?
    let volumes: [String: ComposeVolumeConfig]?
}

private struct ComposeServiceYAML: Codable {
    let name: String
    let image: String
    let command: [String]?
    let environment: [String: String]?
    let ports: [String]?
    let volumes: [String]?
    let depends_on: [String]?
    let restart: String?
    let networks: [String]?
}

private struct ComposeNetworkConfig: Codable {
    let driver: String?
}

private struct ComposeVolumeConfig: Codable {
    let driver: String?
}

private enum ComposeYAMLDecoder {
    static func decode(_ data: Data) throws -> ComposeYAML {
        let string = String(decoding: data, as: UTF8.self)
        let decoder = YAMLDecoder()
        return try decoder.decode(ComposeYAML.self, from: string)
    }
}

// MARK: - Errors

public enum ComposeError: LocalizedError {
    case fileNotFound(String)
    case invalidYAML(String)
    case circularDependency(String)
    case invalidDependency(String)
    case notImplemented(String)

    public var errorDescription: String? {
        switch self {
        case let .fileNotFound(path):
            return "Compose file not found: \(path)"
        case let .invalidYAML(reason):
            return "Invalid YAML: \(reason)"
        case let .circularDependency(reason):
            return reason
        case let .invalidDependency(reason):
            return reason
        case let .notImplemented(feature):
            return "\(feature) - this feature is not yet implemented"
        }
    }
}
