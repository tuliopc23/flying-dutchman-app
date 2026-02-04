import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "AIKit",
    targets: [
        .domain(
            name: "AIKit",
            dependencies: [
                .project(target: "Shared", path: "../../Core/Shared")
            ]
        )
    ]
)
