import Foundation
import Shared

public enum RuntimeFactory {
    public static func makeRuntime(
        store: AnyContainerStore? = nil,
        logStore: (any ContainerLogStoring)? = nil,
        eventStore: EventRecorder? = nil
    ) -> ContainerRuntimeProtocol {
        let runtimeEnv = ProcessInfo.processInfo.environment["FD_RUNTIME"]?.lowercased()

        switch runtimeEnv {
        case "cli":
            if let cli = ContainerCLIRuntime(store: store, logStore: logStore, eventStore: eventStore) {
                return cli
            }
            return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)

        case "native", "containerization":
            // Use Apple Containerization framework (OrbStack-style)
            return ContainerizationRuntime()

        case .none, "", "auto":
            // Default to Containerization if kernel is available
            // This is now the primary path as per updated spec
            if ContainerizationClient.shared.isNativeAvailable {
                return ContainerizationRuntime()
            }
            // Fall back to CLI if available
            if let cli = ContainerCLIRuntime(store: store, logStore: logStore, eventStore: eventStore) {
                return cli
            }
            // Last resort: mock runtime
            return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)

        default:
            return StubContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
        }
    }
}
