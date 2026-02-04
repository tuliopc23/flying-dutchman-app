import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "KubeKit",
    targets: [
        .domain(
            name: "KubeKit",
            dependencies: [
                .project(target: "Shared", path: "../../Core/Shared"),
                .external(name: "SwiftkubeClient")
            ]
        )
    ]
)
