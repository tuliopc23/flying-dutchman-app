import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "FlyingDutchmanApp",
    targets: [
        Target.target(
            name: "FlyingDutchmanApp",
            destinations: .macOS,
            product: .app,
            bundleId: "com.flyingdutchman.app",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Settings", path: "../../Features/Settings"),
                .project(target: "Shell", path: "../../Features/Shell"),
                .project(target: "Containers", path: "../../Features/Containers"),
                .project(target: "Images", path: "../../Features/Images"),
                .project(target: "Volumes", path: "../../Features/Volumes"),
                .project(target: "Networks", path: "../../Features/Networks"),
                .project(target: "Diagnostics", path: "../../Features/Diagnostics"),
                .project(target: "Stacks", path: "../../Features/Stacks")
            ]
        )
    ]
)
