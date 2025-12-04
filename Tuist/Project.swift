import ProjectDescription

let project = Project(
    name: "FlyingDutchman",
    options: .options(automaticSchemesOptions: .disabled),
    packages: [
        .remote(url: "https://github.com/swift-server/hummingbird.git", requirement: .upToNextMajor(from: "2.0.0")),
        .remote(url: "https://github.com/swift-server/async-http-client.git", requirement: .upToNextMajor(from: "1.20.0")),
        .remote(url: "https://github.com/apple/swift-argument-parser.git", requirement: .upToNextMajor(from: "1.3.0")),
        .remote(url: "https://github.com/apple/swift-log.git", requirement: .upToNextMajor(from: "1.6.0")),
        .remote(url: "https://github.com/swift-server/swift-service-lifecycle.git", requirement: .upToNextMajor(from: "2.0.0")),
        .remote(url: "https://github.com/groue/GRDB.swift.git", requirement: .upToNextMajor(from: "7.8.0"))
    ],
    targets: [
        Target(
            name: "Shared",
            platform: .macOS,
            product: .framework,
            bundleId: "com.flyingdutchman.shared",
            sources: ["Sources/Shared/**"],
            dependencies: [
                .package(product: "Logging")
            ]
        ),
        Target(
            name: "FlyingDutchmanPersistence",
            platform: .macOS,
            product: .framework,
            bundleId: "com.flyingdutchman.persistence",
            sources: ["Sources/FlyingDutchmanPersistence/**"],
            dependencies: [
                .target(name: "Shared"),
                .package(product: "GRDB")
            ]
        ),
        Target(
            name: "FlyingDutchmanNetworking",
            platform: .macOS,
            product: .framework,
            bundleId: "com.flyingdutchman.networking",
            sources: ["Sources/FlyingDutchmanNetworking/**"],
            dependencies: [
                .target(name: "Shared"),
                .package(product: "Hummingbird"),
                .package(product: "AsyncHTTPClient")
            ]
        ),
        Target(
            name: "FlyingDutchmanEngine",
            platform: .macOS,
            product: .app,
            bundleId: "com.flyingdutchman.engine",
            sources: ["Sources/FlyingDutchmanEngine/**"],
            dependencies: [
                .target(name: "Shared"),
                .target(name: "FlyingDutchmanNetworking"),
                .target(name: "FlyingDutchmanPersistence"),
                .package(product: "ServiceLifecycle")
            ]
        ),
        Target(
            name: "FlyingDutchmanCLI",
            platform: .macOS,
            product: .commandLineTool,
            bundleId: "com.flyingdutchman.cli",
            sources: ["Sources/FlyingDutchmanCLI/**"],
            dependencies: [
                .target(name: "Shared"),
                .target(name: "FlyingDutchmanNetworking"),
                .package(product: "ArgumentParser")
            ]
        ),
        Target(
            name: "FlyingDutchmanApp",
            platform: .macOS,
            product: .app,
            bundleId: "com.flyingdutchman.app",
            sources: ["Sources/FlyingDutchmanApp/**"],
            resources: [],
            dependencies: [
                .target(name: "Shared"),
                .target(name: "FlyingDutchmanNetworking"),
                .target(name: "FlyingDutchmanPersistence")
            ]
        )
    ]
)
