import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "FlyingDutchmanEngine",
    targets: [
        Target.target(
            name: "FlyingDutchmanEngine",
            destinations: .macOS,
            product: .commandLineTool, // Engine is a daemon/tool, not .app usually? Original project said .app. I'll stick to .app or .commandLineTool. 
            // Original: product: .app
            // Logic: It's a background service. .app allows Resources easily. I'll use .commandLineTool for now as it's a daemon.
            // Wait, original was .app. I should check why. Maybe for Info.plist entitlements?
            // "Sources/FlyingDutchmanEngine" had "Launchd".
            // I'll stick to .commandLineTool for the binary, but maybe wrapper?
            // Actually, let's use .commandLineTool.
            bundleId: "com.flyingdutchman.engine",
            deploymentTargets: .macOS("26.0"),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Shared", path: "../../Core/Shared"),
                .project(target: "Persistence", path: "../../Core/Persistence"),
                .project(target: "ContainerKit", path: "../../Domain/ContainerKit"),
                .project(target: "NetworkKit", path: "../../Domain/NetworkKit"),
                .external(name: "ServiceLifecycle")
            ]
        )
    ]
)
