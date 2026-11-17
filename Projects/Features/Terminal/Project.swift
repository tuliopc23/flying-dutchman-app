import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Terminal",
    targets: makeFeature(
        name: "Terminal",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
            .external(name: "Dependencies"),
        ]
    )
)
