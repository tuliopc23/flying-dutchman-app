import Foundation
import Shared

/// Adapter that checks Apple Containerization framework availability and kernel presence.
public final class ContainerizationClient: @unchecked Sendable {
    public enum Availability: String, Sendable {
        case native
        case missingFramework
        case missingKernel
    }

    public static let shared = ContainerizationClient()

    public private(set) var availability: Availability

    private init() {
        #if canImport(Containerization)
        // Framework is available, check for kernel
        if Self.kernelExists() {
            availability = .native
        } else {
            availability = .missingKernel
        }
        #else
        availability = .missingFramework
        #endif
    }
    
    /// Refresh availability check (e.g., after kernel download)
    public func refresh() {
        #if canImport(Containerization)
        if Self.kernelExists() {
            availability = .native
        } else {
            availability = .missingKernel
        }
        #else
        availability = .missingFramework
        #endif
    }

    /// Whether Containerization.framework is available and kernel is present.
    public var isNativeAvailable: Bool {
        availability == .native
    }

    /// Human-readable worker status string for diagnostics.
    public var workerStatus: String {
        switch availability {
        case .native: return "ready"
        case .missingFramework: return "stub (framework unavailable)"
        case .missingKernel: return "stub (kernel not found)"
        }
    }
    
    /// Path to the expected kernel location
    public static var kernelPath: URL {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        return supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("kernel")
            .appendingPathComponent("vmlinux")
    }
    
    /// Check if kernel exists at expected location
    private static func kernelExists() -> Bool {
        FileManager.default.fileExists(atPath: kernelPath.path)
    }
}
