import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Shell",
    targets: makeFeature(
        name: "Shell",
        dependencies: [
            .project(target: "Shared", path: "../../Core/Shared"),
            .project(target: "DesignSystem", path: "../../Core/DesignSystem"),
            .project(target: "UIComponents", path: "../../Core/UIComponents"),
            .project(target: "FlyingDutchmanNetworking", path: "../../Domain/NetworkKit"),
            .project(target: "ContainersInterface", path: "../Containers"),
            .project(target: "ImagesInterface", path: "../Images"),
            .project(target: "VolumesInterface", path: "../Volumes"),
            .project(target: "NetworksInterface", path: "../Networks"),
            .project(target: "DiagnosticsInterface", path: "../Diagnostics"),
            .project(target: "StacksInterface", path: "../Stacks"),
            .project(target: "MachinesInterface", path: "../Machines"),
            .project(target: "KubernetesInterface", path: "../Kubernetes"),
            .project(target: "DebugShellInterface", path: "../DebugShell"),
            .project(target: "Dashboard", path: "../Dashboard"),
            .external(name: "Dependencies"),
        ]
    )
)
