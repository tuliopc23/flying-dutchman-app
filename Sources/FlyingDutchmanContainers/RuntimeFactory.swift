import Foundation
import Shared
import Logging

public enum RuntimeFactory {
    private static let logger = Loggers.make(category: .containers)
    
    public static func makeRuntime(
        store: AnyContainerStore? = nil,
        logStore: (any ContainerLogStoring)? = nil,
        eventStore: EventRecorder? = nil
    ) -> ContainerRuntimeProtocol {
        let runtimeEnv = ProcessInfo.processInfo.environment["FD_RUNTIME"]?.lowercased()

        switch runtimeEnv {
        case "cli":
            logger.info("FD_RUNTIME=cli: Using CLI runtime")
            if let cli = ContainerCLIRuntime(store: store, logStore: logStore, eventStore: eventStore) {
                return cli
            }
            logger.warning("CLI runtime unavailable, falling back to stub")
            return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)

        case "native", "containerization":
            logger.info("FD_RUNTIME=\(runtimeEnv ?? "native"): Using Containerization runtime")
            return ContainerizationRuntime()

        case "stub":
            logger.info("FD_RUNTIME=stub: Using stub runtime")
            return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)

        case .none, "", "auto":
            // Auto-detect best available runtime
            let client = ContainerizationClient.shared
            
            switch client.availability {
            case .native:
                logger.info("Auto-detected native Containerization runtime (kernel present)")
                return ContainerizationRuntime()
                
            case .missingKernel:
                logger.warning("Containerization framework available but kernel missing at \(ContainerizationClient.kernelPath.path)")
                logger.info("Falling back to CLI runtime")
                if let cli = ContainerCLIRuntime(store: store, logStore: logStore, eventStore: eventStore) {
                    return cli
                }
                logger.warning("CLI runtime also unavailable, using stub")
                return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
                
            case .missingFramework:
                logger.warning("Containerization framework not available (requires macOS 26+)")
                logger.info("Falling back to CLI runtime")
                if let cli = ContainerCLIRuntime(store: store, logStore: logStore, eventStore: eventStore) {
                    return cli
                }
                logger.warning("CLI runtime also unavailable, using stub")
                return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
            }

        default:
            logger.warning("Unknown FD_RUNTIME value '\(runtimeEnv ?? "")', using stub")
            return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
        }
    }
    
    /// Get a human-readable description of current runtime selection
    public static var runtimeDescription: String {
        let client = ContainerizationClient.shared
        let env = ProcessInfo.processInfo.environment["FD_RUNTIME"]?.lowercased()
        
        if let env = env, !env.isEmpty && env != "auto" {
            return "FD_RUNTIME=\(env)"
        }
        
        switch client.availability {
        case .native:
            return "Native Containerization (auto)"
        case .missingKernel:
            return "Fallback (kernel not found)"
        case .missingFramework:
            return "Fallback (framework unavailable)"
        }
    }
}
