import Foundation
import Shared

/// Adapter that will call Apple Containerization when present, while falling back to an in-memory stub otherwise.
public final class ContainerizationClient: @unchecked Sendable {
    public enum Availability: String {
        case native
        case missingFramework
    }

    public static let shared = ContainerizationClient()

    public let availability: Availability

    private init() {
        #if canImport(Containerization)
        availability = .native
        #else
        availability = .missingFramework
        #endif
    }

    /// Whether Containerization.framework is available on this host.
    public var isNativeAvailable: Bool {
        availability == .native
    }

    /// Human-readable worker status string for diagnostics.
    public var workerStatus: String {
        switch availability {
        case .native: return "ready"
        case .missingFramework: return "stub"
        }
    }
}
