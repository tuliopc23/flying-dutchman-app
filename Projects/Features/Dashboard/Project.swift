import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Dashboard",
    targets: makeFeature(
        name: "Dashboard",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
            .project(target: "FlyingDutchmanContainers", path: "../../Domain/ContainerKit"),
            .external(name: "Dependencies"),
            // Removed DGCharts as it's not configured in Package.swift/Dependencies.swift yet
            // We are using native Swift Charts (part of SwiftUI) anyway
        ]
    )
)
