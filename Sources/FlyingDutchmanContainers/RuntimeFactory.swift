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
            return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)

        case "native":
            // TODO: Implement ContainerizationRuntime when framework APIs are available.
            return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)

        case .none, "", "auto":
            if ContainerizationClient.shared.isNativeAvailable {
                return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
            }
            if let cli = ContainerCLIRuntime(store: store, logStore: logStore, eventStore: eventStore) {
                return cli
            }
            return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)

        default:
            return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
        }
    }
}
