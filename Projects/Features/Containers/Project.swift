import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Containers",
    targets: makeFeature(
        name: "Containers",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
            .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
            .project(target: "FlyingDutchmanContainers", path: "../../Domain/ContainerKit"),
        ],
        interfaceDependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
        ]
    )
)
