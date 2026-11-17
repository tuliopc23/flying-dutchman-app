import Foundation
import ProjectDescription

/// Creates a micro-feature module following Tuist Modular Architecture (TMA).
/// Only defines targets whose source directories actually exist on disk.
///
/// - Parameters:
///   - name: The feature name (e.g., "Settings")
///   - dependencies: External dependencies for the main implementation target
///   - resources: Optional resources for the main implementation target
///
/// - Returns: Array of targets:
///   - `{name}Interface` - Public protocols and types
///   - `{name}` - Implementation (depends on Interface)
///   - `{name}Testing` - Test helpers and mocks (if Sources/{name}Testing exists)
///   - `{name}Tests` - Unit tests (if Tests/{name}Tests exists)
///   - `{name}Example` - Demo app for isolated development (if Examples/{name}Example exists)
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

    // 1. Interface target - Public protocols and types
    let interfaceTarget = Target.target(
        name: "\(name)Interface",
        destinations: .macOS,
        product: .framework,
        bundleId: "\(bundlePrefix).\(name.lowercased()).interface",
        deploymentTargets: .macOS("26.0"),
        infoPlist: .default,
        sources: ["Sources/\(name)Interface/**"],
        dependencies: interfaceDependencies,
        settings: .settings(base: swiftSettings)
    )
    targets.append(interfaceTarget)

    // 2. Implementation target - Main feature logic
    let implementationTarget = Target.target(
        name: name,
        destinations: .macOS,
        product: .framework,
        bundleId: "\(bundlePrefix).\(name.lowercased())",
        deploymentTargets: .macOS("26.0"),
        infoPlist: .default,
        sources: ["Sources/\(name)/**"],
        resources: resources,
        dependencies: [
            .target(name: "\(name)Interface"),
        ] + dependencies,
        settings: .settings(base: swiftSettings)
    )
    targets.append(implementationTarget)

    let fileManager = FileManager.default
    let hasTesting = fileManager.fileExists(atPath: "Sources/\(name)Testing")
    let hasTests = fileManager.fileExists(atPath: "Tests/\(name)Tests")
    let hasExample = fileManager.fileExists(atPath: "Examples/\(name)Example")

    // 3. Testing target - Test helpers and mocks (if present)
    if hasTesting {
        let testingTarget = Target.target(
            name: "\(name)Testing",
            destinations: .macOS,
            product: .framework,
            bundleId: "\(bundlePrefix).\(name.lowercased()).testing",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Sources/\(name)Testing/**"],
            dependencies: [
                .target(name: "\(name)Interface"),
            ],
            settings: .settings(base: swiftSettings)
        )
        targets.append(testingTarget)
    }

    // 4. Tests target - Unit tests (if present)
    if hasTests {
        var testDependencies: [TargetDependency] = [.target(name: name)]
        if hasTesting {
            testDependencies.append(.target(name: "\(name)Testing"))
        }
        let testsTarget = Target.target(
            name: "\(name)Tests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "\(bundlePrefix).\(name.lowercased()).tests",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Tests/\(name)Tests/**"],
            dependencies: testDependencies,
            settings: .settings(base: swiftSettings)
        )
        targets.append(testsTarget)
    }

    // 5. Example target - Demo app for isolated development (if present)
    if hasExample {
        let exampleTarget = Target.target(
            name: "\(name)Example",
            destinations: .macOS,
            product: .app,
            bundleId: "\(bundlePrefix).\(name.lowercased()).example",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Examples/\(name)Example/**"],
            dependencies: [
                .target(name: name),
            ],
            settings: .settings(base: swiftSettings)
        )
        targets.append(exampleTarget)
    }

    return targets
}
