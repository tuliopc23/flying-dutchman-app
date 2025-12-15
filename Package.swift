// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "FlyingDutchman",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "FlyingDutchmanApp", targets: ["FlyingDutchmanApp"]),
        .executable(name: "FlyingDutchmanEngine", targets: ["FlyingDutchmanEngine"]),
        .executable(name: "FlyingDutchmanCLI", targets: ["FlyingDutchmanCLI"]),
        .library(name: "FlyingDutchmanNetworking", targets: ["FlyingDutchmanNetworking"]),
        .library(name: "FlyingDutchmanPersistence", targets: ["FlyingDutchmanPersistence"]),
        .library(name: "FlyingDutchmanContainers", targets: ["FlyingDutchmanContainers"]),
        .library(name: "FlyingDutchmanKubernetes", targets: ["FlyingDutchmanKubernetes"]),
        .library(name: "FlyingDutchmanAI", targets: ["FlyingDutchmanAI"]),
        .library(name: "Shared", targets: ["Shared"])
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.20.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.0"),
        .package(url: "https://github.com/swift-server/swift-service-lifecycle.git", from: "2.0.0"),
        .package(url: "https://github.com/groue/GRDB.swift.git", from: "7.8.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.60.0"),
        .package(url: "https://github.com/swiftkube/client.git", from: "0.20.0")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "Logging", package: "swift-log")
            ],
            path: "Sources/Shared"
        ),
        .target(
            name: "FlyingDutchmanPersistence",
            dependencies: [
                "Shared",
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "GRDBSQLite", package: "GRDB.swift")
            ],
            path: "Sources/FlyingDutchmanPersistence"
        ),
        .target(
            name: "FlyingDutchmanContainers",
            dependencies: [
                "Shared",
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOHTTP1", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio"),
                .product(name: "NIOConcurrencyHelpers", package: "swift-nio"),
                .product(name: "Logging", package: "swift-log")
            ],
            path: "Sources/FlyingDutchmanContainers"
        ),
        .target(
            name: "FlyingDutchmanKubernetes",
            dependencies: [
                "Shared",
                .product(name: "SwiftkubeClient", package: "client")
            ],
            path: "Sources/FlyingDutchmanKubernetes"
        ),
        .target(
            name: "FlyingDutchmanAI",
            dependencies: [
                "Shared"
            ],
            path: "Sources/FlyingDutchmanAI"
        ),
        .target(
            name: "FlyingDutchmanNetworking",
            dependencies: [
                "Shared",
                "FlyingDutchmanContainers",
                "FlyingDutchmanPersistence",
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "GRDBSQLite", package: "GRDB.swift")
            ],
            path: "Sources/FlyingDutchmanNetworking"
        ),
        .executableTarget(
            name: "FlyingDutchmanEngine",
            dependencies: [
                "Shared",
                "FlyingDutchmanContainers",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanPersistence",
                .product(name: "ServiceLifecycle", package: "swift-service-lifecycle")
            ],
            path: "Sources/FlyingDutchmanEngine"
        ),
        .executableTarget(
            name: "FlyingDutchmanCLI",
            dependencies: [
                "Shared",
                "FlyingDutchmanContainers",
                "FlyingDutchmanNetworking",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Sources/FlyingDutchmanCLI"
        ),
        .executableTarget(
            name: "FlyingDutchmanApp",
            dependencies: [
                "Shared",
                "FlyingDutchmanNetworking",
                "FlyingDutchmanPersistence"
            ],
            path: "Sources/FlyingDutchmanApp"
        ),
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
        )
    ]
)
