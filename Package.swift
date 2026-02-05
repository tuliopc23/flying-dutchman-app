// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "FlyingDutchman",
    platforms: [
        .macOS("26.0") // Tahoe
    ],
    products: [
        .executable(name: "FlyingDutchmanApp", targets: ["FlyingDutchmanApp"]),
        .executable(name: "FlyingDutchmanEngine", targets: ["FlyingDutchmanEngine"]),
        .executable(name: "FlyingDutchmanCLI", targets: ["FlyingDutchmanCLI"]),
        .library(name: "FlyingDutchmanNetworking", targets: ["FlyingDutchmanNetworking"]),
        .library(name: "FlyingDutchmanPersistence", targets: ["FlyingDutchmanPersistence"]),
        .library(name: "FlyingDutchmanContainers", targets: ["FlyingDutchmanContainers"]),
        .library(name: "KubeKit", targets: ["KubeKit"]),
        .library(name: "AIKit", targets: ["AIKit"]),
        .library(name: "Shared", targets: ["Shared"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "UIComponents", targets: ["UIComponents"])
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
        .package(url: "https://github.com/swiftkube/client.git", from: "0.20.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
        .package(url: "https://github.com/apple/containerization.git", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-system.git", from: "1.3.0"),
        .package(url: "https://github.com/pointfreeco/swift-navigation.git", from: "2.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.0.0"),
        .package(url: "https://github.com/ChimeHQ/ProcessEnv.git", from: "1.0.0"),
        .package(url: "https://github.com/danielsaidi/SwiftPackageScripts.git", from: "1.0.0"),
        .package(url: "https://github.com/orlandos-nl/DNSClient.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-certificates.git", from: "1.0.0"),
        .package(url: "https://github.com/orlandos-nl/Citadel.git", from: "0.7.0")
    ],
    targets: [
        // Core
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "Hummingbird", package: "hummingbird")
            ],
            path: "Projects/Core/Shared/Sources"
        ),
        .target(
            name: "DesignSystem",
            dependencies: [
                "Shared"
            ],
            path: "Projects/Core/DesignSystem/Sources"
        ),
        .target(
            name: "UIComponents",
            dependencies: [
                "DesignSystem"
            ],
            path: "Projects/Core/UIComponents/Sources"
        ),
        .target(
            name: "FlyingDutchmanPersistence",
            dependencies: [
                "Shared",
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "GRDBSQLite", package: "GRDB.swift")
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
                .product(name: "Citadel", package: "Citadel")
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
                .product(name: "X509", package: "swift-certificates")
            ],
            path: "Projects/Domain/NetworkKit/Sources"
        ),
        .target(
            name: "KubeKit",
            dependencies: [
                "Shared",
                .product(name: "SwiftkubeClient", package: "client")
            ],
            path: "Projects/Domain/KubeKit/Sources"
        ),
        .target(
            name: "AIKit",
            dependencies: [
                "Shared"
            ],
            path: "Projects/Domain/AIKit/Sources"
        ),

        // Feature Interfaces
        .target(
            name: "SettingsInterface",
            path: "Projects/Features/Settings/Sources/SettingsInterface"
        ),
        .target(
            name: "ContainersInterface",
            dependencies: [
                "Shared"
            ],
            path: "Projects/Features/Containers/Sources/ContainersInterface"
        ),
        .target(
            name: "ImagesInterface",
            path: "Projects/Features/Images/Sources/ImagesInterface"
        ),
        .target(
            name: "VolumesInterface",
            path: "Projects/Features/Volumes/Sources/VolumesInterface"
        ),
        .target(
            name: "NetworksInterface",
            path: "Projects/Features/Networks/Sources/NetworksInterface"
        ),
        .target(
            name: "DiagnosticsInterface",
            dependencies: [
                "Shared"
            ],
            path: "Projects/Features/Diagnostics/Sources/DiagnosticsInterface"
        ),
        .target(
            name: "StacksInterface",
            dependencies: [
                "Shared"
            ],
            path: "Projects/Features/Stacks/Sources/StacksInterface"
        ),
        .target(
            name: "MachinesInterface",
            dependencies: [
                "Shared"
            ],
            path: "Projects/Features/Machines/Sources/MachinesInterface"
        ),
        .target(
            name: "KubernetesInterface",
            path: "Projects/Features/Kubernetes/Sources/KubernetesInterface"
        ),
        .target(
            name: "DebugShellInterface",
            path: "Projects/Features/DebugShell/Sources/DebugShellInterface"
        ),
        .target(
            name: "ShellInterface",
            path: "Projects/Features/Shell/Sources/ShellInterface"
        ),

        // Feature Implementations
        .target(
            name: "Settings",
            dependencies: [
                "SettingsInterface",
                "Shared",
                "DesignSystem",
                "FlyingDutchmanPersistence",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ],
            path: "Projects/Features/Settings/Sources/Settings"
        ),
        .target(
            name: "Containers",
            dependencies: [
                "ContainersInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanContainers",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Projects/Features/Containers/Sources/Containers"
        ),
        .target(
            name: "Images",
            dependencies: [
                "ImagesInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking"
            ],
            path: "Projects/Features/Images/Sources/Images"
        ),
        .target(
            name: "Volumes",
            dependencies: [
                "VolumesInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking"
            ],
            path: "Projects/Features/Volumes/Sources/Volumes"
        ),
        .target(
            name: "Networks",
            dependencies: [
                "NetworksInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking"
            ],
            path: "Projects/Features/Networks/Sources/Networks"
        ),
        .target(
            name: "Diagnostics",
            dependencies: [
                "DiagnosticsInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanContainers",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Projects/Features/Diagnostics/Sources/Diagnostics"
        ),
        .target(
            name: "Stacks",
            dependencies: [
                "StacksInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanContainers"
            ],
            path: "Projects/Features/Stacks/Sources/Stacks"
        ),
        .target(
            name: "Machines",
            dependencies: [
                "MachinesInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Projects/Features/Machines/Sources/Machines"
        ),
        .target(
            name: "Kubernetes",
            dependencies: [
                "KubernetesInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanNetworking"
            ],
            path: "Projects/Features/Kubernetes/Sources/Kubernetes"
        ),
        .target(
            name: "DebugShell",
            dependencies: [
                "DebugShellInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Projects/Features/DebugShell/Sources/DebugShell"
        ),
        .target(
            name: "Shell",
            dependencies: [
                "ShellInterface",
                "Shared",
                "DesignSystem",
                "UIComponents",
                "FlyingDutchmanNetworking",
                "ContainersInterface",
                "ImagesInterface",
                "VolumesInterface",
                "NetworksInterface",
                "DiagnosticsInterface",
                "StacksInterface",
                "MachinesInterface",
                "KubernetesInterface",
                "DebugShellInterface",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Projects/Features/Shell/Sources/Shell"
        ),

        // Product
        .executableTarget(
            name: "FlyingDutchmanEngine",
            dependencies: [
                "Shared",
                "FlyingDutchmanPersistence",
                "FlyingDutchmanContainers",
                "FlyingDutchmanNetworking",
                .product(name: "ServiceLifecycle", package: "swift-service-lifecycle")
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
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Projects/Product/CLI/Sources"
        ),
        .executableTarget(
            name: "FlyingDutchmanApp",
            dependencies: [
                "Settings",
                "Shell",
                "Containers",
                "Images",
                "Volumes",
                "Networks",
                "Diagnostics",
                "Stacks",
                "Machines",
                "Kubernetes",
                "DebugShell",
                .product(name: "SwiftNavigation", package: "swift-navigation"),
                .product(name: "SwiftUINavigation", package: "swift-navigation"),
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Projects/Product/App/Sources"
        ),

        // Tests
        .testTarget(
            name: "FlyingDutchmanAppTests",
            dependencies: ["FlyingDutchmanApp"],
            path: "Tests/FlyingDutchmanAppTests"
        ),
        .testTarget(
            name: "FlyingDutchmanEngineTests",
            dependencies: ["FlyingDutchmanEngine"],
            path: "Tests/FlyingDutchmanEngineTests"
        ),
        .testTarget(
            name: "FlyingDutchmanCLITests",
            dependencies: ["FlyingDutchmanCLI"],
            path: "Tests/FlyingDutchmanCLITests"
        ),
        .testTarget(
            name: "IntegrationTests",
            dependencies: ["FlyingDutchmanNetworking", "FlyingDutchmanPersistence"],
            path: "Tests/IntegrationTests"
        ),
        .testTarget(
            name: "FlyingDutchmanPersistenceTests",
            dependencies: [
                "FlyingDutchmanPersistence",
                "Shared",
                .product(name: "GRDB", package: "GRDB.swift")
            ],
            path: "Tests/FlyingDutchmanPersistenceTests"
        ),
        .testTarget(
            name: "FlyingDutchmanContainersTests",
            dependencies: [
                "FlyingDutchmanContainers",
                "Shared",
                "FlyingDutchmanPersistence"
            ],
            path: "Tests/FlyingDutchmanContainersTests"
        )
    ]
)
