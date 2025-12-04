import Foundation

public enum EngineXPCClient {
    public static func fetchStatus() async throws -> EngineXPCStatus {
        try await withCheckedThrowingContinuation { continuation in
            let connection = NSXPCConnection(machServiceName: EngineXPCListener.serviceName, options: [])
            connection.remoteObjectInterface = NSXPCInterface(with: EngineXPCProtocol.self)
            connection.resume()

            guard let proxy = connection.remoteObjectProxyWithErrorHandler({ error in
                connection.invalidate()
                continuation.resume(throwing: error)
            }) as? EngineXPCProtocol else {
                connection.invalidate()
                continuation.resume(throwing: NSError(domain: "EngineXPC", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid XPC proxy"]))
                return
            }

            proxy.fetchStatus { status in
                connection.invalidate()
                continuation.resume(returning: status)
            }
        }
    }
}
