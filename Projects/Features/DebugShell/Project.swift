import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "DebugShell",
    targets: makeFeature(
        name: "DebugShell",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .external(name: "Dependencies"),
        ],
        interfaceDependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
        ]
    )
)
