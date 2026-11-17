// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "FlyingDutchman",
    platforms: [
        .macOS("26.0"), // Tahoe
    ],
    products: [
        .executable(name: "FlyingDutchmanApp", targets: ["FlyingDutchmanApp"]),
        .executable(name: "FlyingDutchmanEngine", targets: ["FlyingDutchmanEngine"]),
        .executable(name: "FlyingDutchmanCLI", targets: ["FlyingDutchmanCLI"]),
        .library(name: "FlyingDutchmanNetworking", targets: ["FlyingDutchmanNetworking"]),
        .library(name: "FlyingDutchmanPersistence", targets: ["FlyingDutchmanPersistence"]),
        .library(name: "FlyingDutchmanContainers", targets: ["FlyingDutchmanContainers"]),
        .library(name: "Shared", targets: ["Shared"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "UIComponents", targets: ["UIComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.20.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.0"),
        .package(url: "https://github.com/swift-server/swift-service-lifecycle.git", from: "2.0.0"),
        .package(url: "https://github.com/groue/GRDB.swift.git", from: "7.8.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.60.0"),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.21.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
        .package(url: "https://github.com/apple/containerization.git", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-system.git", from: "1.3.0"),
        .package(url: "https://github.com/pointfreeco/swift-navigation.git", from: "2.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.0.0"),
        .package(url: "https://github.com/ChimeHQ/ProcessEnv.git", from: "1.0.0"),
        .package(url: "https://github.com/orlandos-nl/DNSClient.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-certificates.git", from: "1.0.0"),
        .package(url: "https://github.com/orlandos-nl/Citadel.git", from: "0.7.0"),
        .package(url: "https://github.com/sparkle-project/Sparkle", from: "2.7.0"),
    ],
    targets: [
        // Core
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Core/Shared/Sources"
        ),
        .target(
            name: "DesignSystem",
            dependencies: [
                "Shared",
            ],
            path: "Projects/Core/DesignSystem/Sources"
        ),
        .target(
            name: "UIComponents",
            dependencies: [
                "DesignSystem",
            ],
            path: "Projects/Core/UIComponents/Sources"
        ),
        .target(
            name: "FlyingDutchmanPersistence",
            dependencies: [
                "Shared",
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "GRDBSQLite", package: "GRDB.swift"),
            ],
            path: "Projects/Core/Persistence/Sources"
        ),

        // Domain
        .target(
            name: "FlyingDutchmanContainers",
            dependencies: [
                "Shared",
                "FlyingDutchmanPersistence",
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOHTTP1", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio"),
                .product(name: "NIOTransportServices", package: "swift-nio-transport-services"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Containerization", package: "containerization"),
                .product(name: "ContainerizationOCI", package: "containerization"),
                .product(name: "SystemPackage", package: "swift-system"),
                .product(name: "ProcessEnv", package: "ProcessEnv"),
                .product(name: "Yams", package: "Yams"),
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "Citadel", package: "Citadel"),
            ],
            path: "Projects/Domain/ContainerKit/Sources"
        ),
        .target(
            name: "FlyingDutchmanNetworking",
            dependencies: [
                "Shared",
                "FlyingDutchmanContainers",
                "FlyingDutchmanPersistence",
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "HummingbirdHTTP2", package: "hummingbird"),
                .product(name: "HummingbirdTLS", package: "hummingbird"),
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "GRDBSQLite", package: "GRDB.swift"),
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "DNSClient", package: "DNSClient"),
                .product(name: "X509", package: "swift-certificates"),
            ],
            path: "Projects/Domain/NetworkKit/Sources"
        ),
        // Feature Implementations
        .target(
            name: "Dashboard",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/Dashboard/Sources/Dashboard"
        ),
        .target(
            name: "Settings",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanPersistence",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/Settings/Sources/Settings"
        ),
        .target(
            name: "Containers",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanContainers",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/Containers/Sources/Containers"
        ),
        .target(
            name: "Images",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
            ],
            path: "Projects/Features/Images/Sources/Images"
        ),
        .target(
            name: "Volumes",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
            ],
            path: "Projects/Features/Volumes/Sources/Volumes"
        ),
        .target(
            name: "Networks",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
            ],
            path: "Projects/Features/Networks/Sources/Networks"
        ),
        .target(
            name: "Diagnostics",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanContainers",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/Diagnostics/Sources/Diagnostics"
        ),
        .target(
            name: "Stacks",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanContainers",
            ],
            path: "Projects/Features/Stacks/Sources/Stacks"
        ),
        .target(
            name: "Machines",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/Machines/Sources/Machines"
        ),
        .target(
            name: "Kubernetes",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
            ],
            path: "Projects/Features/Kubernetes/Sources/Kubernetes"
        ),
        .target(
            name: "Terminal",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanNetworking",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/Terminal/Sources/Terminal"
        ),
        .target(
            name: "AppShell",
            dependencies: [
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanNetworking",
                "Dashboard",
                "Containers",
                "Images",
                "Volumes",
                "Networks",
                "Diagnostics",
                "Stacks",
                "Machines",
                "Kubernetes",
                "Terminal",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/AppShell/Sources/AppShell"
        ),

        // Product
        .executableTarget(
            name: "FlyingDutchmanEngine",
            dependencies: [
                "Shared",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanContainers",
                "FlyingDutchmanNetworking",
                .product(name: "ServiceLifecycle", package: "swift-service-lifecycle"),
            ],
            path: "Projects/Product/Engine/Sources"
        ),
        .executableTarget(
            name: "FlyingDutchmanCLI",
            dependencies: [
                "Shared",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanContainers",
                "FlyingDutchmanNetworking",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            path: "Projects/Product/CLI/Sources"
        ),
        .executableTarget(
            name: "FlyingDutchmanApp",
            dependencies: [
                "AppShell",
                "Settings",
                .product(name: "SwiftNavigation", package: "swift-navigation"),
                .product(name: "SwiftUINavigation", package: "swift-navigation"),
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "Sparkle", package: "Sparkle"),
            ],
            path: "Projects/Product/App/Sources"
        ),

        // Tests
        .testTarget(
            name: "FlyingDutchmanAppTests",
            dependencies: [
                "FlyingDutchmanApp",
                "AppShell",
                "Shared",
                "Diagnostics",
            ],
            path: "Tests/FlyingDutchmanAppTests"
        ),
        .testTarget(
            name: "FlyingDutchmanEngineTests",
            dependencies: [
                "FlyingDutchmanEngine",
                "Shared",
                "FlyingDutchmanContainers",
            ],
            path: "Tests/FlyingDutchmanEngineTests"
        ),
        .testTarget(
            name: "FlyingDutchmanCLITests",
            dependencies: ["FlyingDutchmanCLI"],
            path: "Tests/FlyingDutchmanCLITests"
        ),
        .testTarget(
            name: "IntegrationTests",
            dependencies: ["FlyingDutchmanNetworking", "FlyingDutchmanPersistence", "Shared"],
            path: "Tests/IntegrationTests"
        ),
        .testTarget(
            name: "MachinesTests",
            dependencies: ["Machines", "Shared"],
            path: "Projects/Features/Machines/Tests/MachinesTests"
        ),
        .testTarget(
            name: "KubernetesTests",
            dependencies: ["Kubernetes", "Shared"],
            path: "Projects/Features/Kubernetes/Tests/KubernetesTests"
        ),
        .testTarget(
            name: "SettingsTests",
            dependencies: ["Settings"],
            path: "Projects/Features/Settings/Tests/SettingsTests"
        ),
        .testTarget(
            name: "FlyingDutchmanPersistenceTests",
            dependencies: [
                "FlyingDutchmanPersistence",
                "Shared",
                .product(name: "GRDB", package: "GRDB.swift"),
            ],
            path: "Tests/FlyingDutchmanPersistenceTests"
        ),
        .testTarget(
            name: "FlyingDutchmanContainersTests",
            dependencies: [
                "FlyingDutchmanContainers",
                "Shared",
                "FlyingDutchmanPersistence",
            ],
            path: "Tests/FlyingDutchmanContainersTests"
        ),
    ]
)
