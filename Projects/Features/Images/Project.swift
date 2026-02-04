import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Images",
    targets: makeFeature(
        name: "Images",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
            .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
        ],
    )
)
