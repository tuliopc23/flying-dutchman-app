import Foundation
import GRDB
import Shared

/// Provides seed data for development and testing
public enum SeedData {

    /// Seeds all stores with sample data if they are empty
    public static func seedAllIfEmpty() async {
        let containerStore = ContainerStore()
        await containerStore.seedIfEmpty(with: sampleContainers)

        let imageStore = ImageStore()
        await imageStore.seedIfEmpty(with: sampleImages)

        let stackStore = StackStore()
        await stackStore.seedIfEmpty(with: sampleStacks)

        let volumeStore = VolumeStore()
        await volumeStore.seedIfEmpty(with: sampleVolumes)

        let networkStore = NetworkStore()
        await networkStore.seedIfEmpty(with: sampleNetworks)

        let logStore = ContainerLogStore()
        seedContainerLogs(store: logStore)
    }

    /// Seeds sample container logs for testing
    public static func seedContainerLogs(store: ContainerLogStore) {
        // Only seed logs for the first container (api)
        guard let apiContainer = sampleContainers.first else { return }

        let logs = [
            "2024-01-15 10:00:00 [INFO] Starting API server on port 8080",
            "2024-01-15 10:00:01 [INFO] Connected to database",
            "2024-01-15 10:00:02 [INFO] Loaded 42 routes",
            "2024-01-15 10:00:03 [INFO] Server ready to accept connections",
            "2024-01-15 10:01:23 [INFO] GET /api/health 200 OK (12ms)",
            "2024-01-15 10:02:45 [INFO] POST /api/containers 201 Created (89ms)",
            "2024-01-15 10:03:12 [WARN] Rate limit approaching for client 192.168.1.42",
            "2024-01-15 10:05:33 [INFO] GET /api/containers 200 OK (156ms)",
        ]

        for log in logs {
            store.append(containerID: apiContainer.id, line: log)
        }
    }

    // MARK: - Sample Data

    public static let sampleContainers: [ContainerSummary] = [
        ContainerSummary(
            name: "api",
            image: "ghcr.io/flyingdutchman/api:dev",
            status: .running,
            ports: ["8080:8080", "9090:9090"],
            createdAt: Date().addingTimeInterval(-86400 * 5) // 5 days ago
        ),
        ContainerSummary(
            name: "worker",
            image: "ghcr.io/flyingdutchman/worker:dev",
            status: .running,
            ports: ["5672:5672"],
            createdAt: Date().addingTimeInterval(-86400 * 3) // 3 days ago
        ),
        ContainerSummary(
            name: "db",
            image: "postgres:16-alpine",
            status: .stopped,
            ports: ["5432:5432"],
            createdAt: Date().addingTimeInterval(-86400 * 10) // 10 days ago
        ),
        ContainerSummary(
            name: "redis",
            image: "redis:7-alpine",
            status: .running,
            ports: ["6379:6379"],
            createdAt: Date().addingTimeInterval(-86400 * 2) // 2 days ago
        ),
        ContainerSummary(
            name: "nginx",
            image: "nginx:alpine",
            status: .stopped,
            ports: ["80:80", "443:443"],
            createdAt: Date().addingTimeInterval(-86400 * 7) // 7 days ago
        ),
    ]

    public static let sampleImages: [ImageSummary] = [
        ImageSummary(
            name: "ghcr.io/flyingdutchman/api",
            tag: "dev",
            digest: "sha256:a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6",
            sizeBytes: 230_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 2)
        ),
        ImageSummary(
            name: "ghcr.io/flyingdutchman/worker",
            tag: "dev",
            digest: "sha256:b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7",
            sizeBytes: 180_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 2)
        ),
        ImageSummary(
            name: "postgres",
            tag: "16-alpine",
            digest: "sha256:c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8",
            sizeBytes: 120_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 30)
        ),
        ImageSummary(
            name: "redis",
            tag: "7-alpine",
            digest: "sha256:d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9",
            sizeBytes: 45_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 20)
        ),
        ImageSummary(
            name: "nginx",
            tag: "alpine",
            digest: "sha256:e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0",
            sizeBytes: 25_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 15)
        ),
        ImageSummary(
            name: "mongo",
            tag: "7",
            digest: "sha256:f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1",
            sizeBytes: 450_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 45)
        ),
    ]

    public static let sampleStacks: [StackSummary] = [
        StackSummary(
            name: "Core Services",
            description: "Main application stack with API, worker, and database",
            createdAt: Date().addingTimeInterval(-86400 * 10),
            containerNames: ["api", "worker", "db"]
        ),
        StackSummary(
            name: "Cache Layer",
            description: "Redis caching infrastructure",
            createdAt: Date().addingTimeInterval(-86400 * 5),
            containerNames: ["redis"]
        ),
        StackSummary(
            name: "Web Frontend",
            description: "Nginx reverse proxy and static files",
            createdAt: Date().addingTimeInterval(-86400 * 7),
            containerNames: ["nginx"]
        ),
        StackSummary(
            name: "Development",
            description: "Local development environment",
            createdAt: Date().addingTimeInterval(-86400 * 1),
            containerNames: []
        ),
    ]

    public static let sampleVolumes: [VolumeSummary] = [
        VolumeSummary(
            name: "postgres-data",
            mountPath: "/var/lib/postgresql/data",
            sizeBytes: 5_000_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 10)
        ),
        VolumeSummary(
            name: "redis-cache",
            mountPath: "/data",
            sizeBytes: 500_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 5)
        ),
        VolumeSummary(
            name: "nginx-config",
            mountPath: "/etc/nginx",
            sizeBytes: 10_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 7)
        ),
        VolumeSummary(
            name: "app-uploads",
            mountPath: "/var/www/uploads",
            sizeBytes: 2_500_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 30)
        ),
        VolumeSummary(
            name: "logs",
            mountPath: "/var/log/app",
            sizeBytes: 750_000_000,
            createdAt: Date().addingTimeInterval(-86400 * 60)
        ),
    ]

    public static let sampleNetworks: [NetworkSummary] = [
        NetworkSummary(
            name: "flyingdutchman_default",
            subnet: "172.20.0.0/16",
            connectedContainerIDs: [], // Will be populated with actual container IDs
            createdAt: Date().addingTimeInterval(-86400 * 10)
        ),
        NetworkSummary(
            name: "public",
            subnet: "192.168.64.0/24",
            connectedContainerIDs: [],
            createdAt: Date().addingTimeInterval(-86400 * 10)
        ),
        NetworkSummary(
            name: "backend",
            subnet: "172.21.0.0/16",
            connectedContainerIDs: [],
            createdAt: Date().addingTimeInterval(-86400 * 8)
        ),
        NetworkSummary(
            name: "monitoring",
            subnet: "172.22.0.0/16",
            connectedContainerIDs: [],
            createdAt: Date().addingTimeInterval(-86400 * 5)
        ),
    ]

    // MARK: - Test Data Generators

    /// Generates a test container with random values
    public static func randomContainer() -> ContainerSummary {
        let names = ["web", "api", "worker", "db", "cache", "queue", "proxy", "auth"]
        let images = ["nginx", "redis", "postgres", "mongo", "rabbitmq", "mysql"]
        let statuses: [ContainerSummary.Status] = [.running, .stopped, .created]

        return ContainerSummary(
            name: names.randomElement()! + "-" + UUID().uuidString.prefix(8),
            image: images.randomElement()! + ":latest",
            status: statuses.randomElement()!,
            ports: generateRandomPorts(),
            createdAt: Date().addingTimeInterval(-Double.random(in: 0...864000))
        )
    }

    /// Generates a test image with random values
    public static func randomImage() -> ImageSummary {
        let names = ["nginx", "redis", "postgres", "mongo", "rabbitmq", "mysql", "node", "python"]
        let tags = ["latest", "alpine", "slim", "16", "7", "8", "20"]

        return ImageSummary(
            name: names.randomElement()!,
            tag: tags.randomElement()!,
            digest: "sha256:" + UUID().uuidString.replacingOccurrences(of: "-", with: ""),
            sizeBytes: Int.random(in: 10_000_000...500_000_000),
            createdAt: Date().addingTimeInterval(-Double.random(in: 0...2592000))
        )
    }

    private static func generateRandomPorts() -> [String] {
        let count = Int.random(in: 0...3)
        var ports: [String] = []
        for _ in 0..<count {
            let port = Int.random(in: 3000...9000)
            ports.append("\(port):\(port)")
        }
        return ports
    }

    // MARK: - Bulk Test Data

    /// Generates multiple random containers for load testing
    public static func generateContainers(count: Int) -> [ContainerSummary] {
        (0..<count).map { _ in randomContainer() }
    }

    /// Generates multiple random images for load testing
    public static func generateImages(count: Int) -> [ImageSummary] {
        (0..<count).map { _ in randomImage() }
    }
}
