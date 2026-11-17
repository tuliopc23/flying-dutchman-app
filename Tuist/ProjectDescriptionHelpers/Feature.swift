import Foundation
import ProjectDescription

/// Creates a cohesive feature module with optional unit test target.
///
/// - Parameters:
///   - name: The feature name (e.g., "Containers")
///   - dependencies: Target dependencies for the feature module
///   - resources: Optional resource file elements
///
/// - Returns: Array containing the feature framework target, and an optional tests target if `Tests/{name}Tests` exists.
public func makeFeature(
    name: String,
    dependencies: [TargetDependency] = [],
    interfaceDependencies: [TargetDependency] = [],
    resources: ResourceFileElements? = nil
) -> [Target] {
    let bundlePrefix = "com.flyingdutchman.feature"

    let swiftSettings: [String: SettingValue] = [
        "SWIFT_VERSION": "6.2",
        "SWIFT_STRICT_CONCURRENCY": "complete",
    ]

    var targets: [Target] = []

    let implementationTarget = Target.target(
        name: name,
        destinations: .macOS,
        product: .framework,
        bundleId: "\(bundlePrefix).\(name.lowercased())",
        deploymentTargets: .macOS("26.0"),
        infoPlist: .default,
        sources: ["Sources/**"],
        resources: resources,
        dependencies: dependencies,
        settings: .settings(base: swiftSettings)
    )
    targets.append(implementationTarget)

    let fileManager = FileManager.default
    let hasTests = fileManager.fileExists(atPath: "Tests/\(name)Tests")

    if hasTests {
        let testsTarget = Target.target(
            name: "\(name)Tests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "\(bundlePrefix).\(name.lowercased()).tests",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Tests/\(name)Tests/**"],
            dependencies: [.target(name: name)],
            settings: .settings(base: swiftSettings)
        )
        targets.append(testsTarget)
    }

    return targets
}
