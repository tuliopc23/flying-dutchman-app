import ProjectDescription

/// Creates a micro-feature module with 5 targets following Tuist Modular Architecture (TMA).
///
/// - Parameters:
///   - name: The feature name (e.g., "Settings")
///   - dependencies: External dependencies for the main implementation target
///   - resources: Optional resources for the main implementation target
///
/// - Returns: Array of 5 targets:
///   - `{name}Interface` - Public protocols and types
///   - `{name}` - Implementation (depends on Interface)
///   - `{name}Testing` - Test helpers and mocks (depends on Interface)
///   - `{name}Tests` - Unit tests (depends on Implementation + Testing)
///   - `{name}Example` - Demo app for isolated development (depends on Implementation)
public func makeFeature(
    name: String,
    dependencies: [TargetDependency] = [],
    resources: ResourceFileElements? = nil
) -> [Target] {
    let bundlePrefix = "com.flyingdutchman.feature"
    
    let swiftSettings: [String: SettingValue] = [
        "SWIFT_VERSION": "6.2",
        "SWIFT_STRICT_CONCURRENCY": "complete"
    ]
    
    // 1. Interface target - Public protocols and types
    let interfaceTarget = Target.target(
        name: "\(name)Interface",
        destinations: .macOS,
        product: .framework,
        bundleId: "\(bundlePrefix).\(name.lowercased()).interface",
        deploymentTargets: .macOS("26.0"),
        infoPlist: .default,
        sources: ["Sources/\(name)Interface/**"],
        dependencies: [],
        settings: .settings(base: swiftSettings)
    )
    
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
            .target(name: "\(name)Interface")
        ] + dependencies,
        settings: .settings(base: swiftSettings)
    )
    
    // 3. Testing target - Test helpers and mocks
    let testingTarget = Target.target(
        name: "\(name)Testing",
        destinations: .macOS,
        product: .framework,
        bundleId: "\(bundlePrefix).\(name.lowercased()).testing",
        deploymentTargets: .macOS("26.0"),
        infoPlist: .default,
        sources: ["Sources/\(name)Testing/**"],
        dependencies: [
            .target(name: "\(name)Interface")
        ],
        settings: .settings(base: swiftSettings)
    )
    
    // 4. Tests target - Unit tests
    let testsTarget = Target.target(
        name: "\(name)Tests",
        destinations: .macOS,
        product: .unitTests,
        bundleId: "\(bundlePrefix).\(name.lowercased()).tests",
        deploymentTargets: .macOS("26.0"),
        infoPlist: .default,
        sources: ["Tests/\(name)Tests/**"],
        dependencies: [
            .target(name: name),
            .target(name: "\(name)Testing")
        ],
        settings: .settings(base: swiftSettings)
    )
    
    // 5. Example target - Demo app for isolated development
    let exampleTarget = Target.target(
        name: "\(name)Example",
        destinations: .macOS,
        product: .app,
        bundleId: "\(bundlePrefix).\(name.lowercased()).example",
        deploymentTargets: .macOS("26.0"),
        infoPlist: .default,
        sources: ["Examples/\(name)Example/**"],
        dependencies: [
            .target(name: name)
        ],
        settings: .settings(base: swiftSettings)
    )
    
    return [
        interfaceTarget,
        implementationTarget,
        testingTarget,
        testsTarget,
        exampleTarget
    ]
}
