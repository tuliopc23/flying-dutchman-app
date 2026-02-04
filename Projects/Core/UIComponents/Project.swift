import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "UIComponents",
    targets: [
        .core(
            name: "UIComponents",
            dependencies: [
                .project(target: "DesignSystem", path: "../DesignSystem"),
            ]
        ),
    ]
)
