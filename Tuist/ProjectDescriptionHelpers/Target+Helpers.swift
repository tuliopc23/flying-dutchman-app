import ProjectDescription

public extension Target {
    static func feature(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ResourceFileElements? = nil
    ) -> Target {
        return Target.target(
            name: name,
            destinations: .macOS,
            product: .framework,
            bundleId: "com.flyingdutchman.feature.\(name.lowercased())",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: resources,
            dependencies: dependencies
        )
    }
    
    static func domain(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: name,
            destinations: .macOS,
            product: .framework,
            bundleId: "com.flyingdutchman.domain.\(name.lowercased())",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: dependencies
        )
    }
    
    static func core(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: name,
            destinations: .macOS,
            product: .framework,
            bundleId: "com.flyingdutchman.core.\(name.lowercased())",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: dependencies
        )
    }
}
