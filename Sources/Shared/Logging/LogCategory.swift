import Foundation

/// Categories for organizing log output across the Flying Dutchman application.
public enum LogCategory: String, Sendable, CaseIterable {
    case containers
    case networking
    case persistence
    case engine
    case app
    case cli
    case kubernetes

    /// The label used for creating Logger instances.
    public var label: String {
        "flyingdutchman.\(rawValue)"
    }
}
