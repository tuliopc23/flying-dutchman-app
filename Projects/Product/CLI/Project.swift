import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "FlyingDutchmanCLI",
    targets: [
        Target.target(
            name: "FlyingDutchmanCLI",
            destinations: .macOS,
            product: .commandLineTool,
            bundleId: "com.flyingdutchman.cli",
            deploymentTargets: .macOS("26.0"),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Shared", path: "../../Core/Shared"),
                .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
                .project(target: "FlyingDutchmanContainers", path: "../../Domain/ContainerKit"),
                .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
                .external(name: "ArgumentParser")
            ]
        )
    ]
)
