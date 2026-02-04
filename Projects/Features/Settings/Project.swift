import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Settings",
    targets: makeFeature(
        name: "Settings",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
        ]
    )
)
