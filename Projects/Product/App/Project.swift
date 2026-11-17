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
                .project(target: "AppShell", path: "../../Features/AppShell"),
                .project(target: "Settings", path: "../../Features/Settings"),
                .external(name: "Sparkle"),
            ]
        ),
    ]
)
