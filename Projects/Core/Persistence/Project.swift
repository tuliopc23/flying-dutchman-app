import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Persistence",
    targets: [
        .core(
            name: "FlyingDutchmanPersistence",
            dependencies: [
                .project(target: "Shared", path: "../Shared"),
                .external(name: "GRDB"),
            ]
        ),
    ]
)
