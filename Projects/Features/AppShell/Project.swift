import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "AppShell",
    targets: makeFeature(
        name: "AppShell",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
            .project(target: "Containers", path: "../Containers"),
            .project(target: "Images", path: "../Images"),
            .project(target: "Volumes", path: "../Volumes"),
            .project(target: "Networks", path: "../Networks"),
            .project(target: "Diagnostics", path: "../Diagnostics"),
            .project(target: "Stacks", path: "../Stacks"),
            .project(target: "Machines", path: "../Machines"),
            .project(target: "Kubernetes", path: "../Kubernetes"),
            .project(target: "Terminal", path: "../Terminal"),
            .project(target: "Dashboard", path: "../Dashboard"),
            .external(name: "Dependencies"),
        ]
    )
)
