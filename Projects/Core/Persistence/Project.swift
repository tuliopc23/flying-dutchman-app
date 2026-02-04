import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Persistence",
    targets: [
        .core(
            name: "Persistence",
            dependencies: [
                .project(target: "Shared", path: "../Shared"),
                .external(name: "GRDB")
            ]
        )
    ]
)
