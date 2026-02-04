import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "DesignSystem",
    targets: [
        .core(
            name: "DesignSystem",
            dependencies: [
                .project(target: "Shared", path: "../Shared"),
            ]
        ),
    ]
)
