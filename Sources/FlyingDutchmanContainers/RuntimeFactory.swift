import Foundation
import Shared

public enum RuntimeFactory {
    public static func makeRuntime(
        store: AnyContainerStore? = nil,
        logStore: (any ContainerLogStoring)? = nil,
        eventStore: EventRecorder? = nil
    ) -> ContainerRuntimeProtocol {
        let runtimeEnv = ProcessInfo.processInfo.environment["FD_RUNTIME"]?.lowercased()
        if runtimeEnv == "cli", let cli = ContainerCLIRuntime(store: store, logStore: logStore, eventStore: eventStore) {
            return cli
        }
        if runtimeEnv == "native" {
            #if canImport(Containerization)
            // TODO: Implement ContainerizationRuntime when framework APIs are available.
            return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
            #else
            return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
            #endif
        } else {
            return ContainerRuntime(store: store, logStore: logStore, eventStore: eventStore)
        }
    }
}
