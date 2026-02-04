import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Diagnostics",
    targets: makeFeature(
        name: "Diagnostics",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
            .project(target: "FlyingDutchmanContainers", path: "../../Domain/ContainerKit"),
            .external(name: "Dependencies"),
        ],
        interfaceDependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
        ],
    )
)
