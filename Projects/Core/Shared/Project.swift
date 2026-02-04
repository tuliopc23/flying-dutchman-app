import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Shared",
    targets: [
        .core(
            name: "Shared",
            dependencies: [
                .external(name: "Logging"),
                .external(name: "Dependencies")
            ]
        )
    ]
)
