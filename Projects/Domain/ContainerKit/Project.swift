import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ContainerKit",
    targets: [
        .domain(
            name: "FlyingDutchmanContainers",
            dependencies: [
                .project(target: "Shared", path: "../../Core/Shared"),
                .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
                .external(name: "NIOConcurrencyHelpers"),
                .external(name: "Logging"),
                .external(name: "Citadel"),
                .external(name: "Yams"),
                .external(name: "Containerization"),
                .external(name: "ContainerizationOCI"),
                .external(name: "ContainerizationExtras"),
                .external(name: "SystemPackage"),
            ]
        ),
    ]
)
