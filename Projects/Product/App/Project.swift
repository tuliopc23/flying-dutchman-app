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
                .project(target: "Shared", path: "../../Core/Shared"),
                .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
                .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
                .project(target: "UIComponents", path: "../../Core/UIComponents"),
                .project(target: "FlyingDutchmanContainers", path: "../../Domain/ContainerKit"),
                .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
                .project(target: "Settings", path: "../../Features/Settings"),
                .external(name: "SwiftNavigation"),
                .external(name: "SwiftUINavigation"),
                .external(name: "Dependencies")
            ]
        )
    ]
)
