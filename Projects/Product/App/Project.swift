import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "FlyingDutchmanApp",
    targets: [
        Target.target(
            name: "FlyingDutchmanApp",
            destinations: .macOS,
            product: .app,
            bundleId: "com.flyingdutchman.app",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .extendingDefault(with: [
                "SUEnableAutomaticChecks": .boolean(true),
                "SUFeedURL": .string("https://updates.flyingdutchman.app/appcast.xml"),
                "SUPublicEDKey": .string("REPLACE_AT_RELEASE_TIME"),
            ]),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Settings", path: "../../Features/Settings"),
                .project(target: "Shell", path: "../../Features/Shell"),
                .project(target: "Containers", path: "../../Features/Containers"),
                .project(target: "Images", path: "../../Features/Images"),
                .project(target: "Volumes", path: "../../Features/Volumes"),
                .project(target: "Networks", path: "../../Features/Networks"),
                .project(target: "Diagnostics", path: "../../Features/Diagnostics"),
                .project(target: "Stacks", path: "../../Features/Stacks"),
                .project(target: "Machines", path: "../../Features/Machines"),
                .project(target: "Kubernetes", path: "../../Features/Kubernetes"),
                .project(target: "DebugShell", path: "../../Features/DebugShell"),
                .project(target: "Dashboard", path: "../../Features/Dashboard"),
                .external(name: "Sparkle"),
            ]
        ),
    ]
)
