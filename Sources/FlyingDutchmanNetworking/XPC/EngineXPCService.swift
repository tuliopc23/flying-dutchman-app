import Foundation
import Shared
import FlyingDutchmanContainers

// ContainerError is defined in ContainerizationRuntime, but we need it here
// For now, we'll use a generic error approach
private enum XPCContainerError: Error {
    case notFound
    case invalidState(String)
}

// Wrapper to make reply closures Sendable for Task.detached
private final class SendableReply<T>: @unchecked Sendable {
    let value: T
    init(_ value: T) {
        self.value = value
    }
}

public final class EngineXPCService: NSObject, EngineXPCProtocol {
    private let runtime: ContainerRuntimeProtocol

    public init(runtime: ContainerRuntimeProtocol) {
        self.runtime = runtime
        super.init()
    }

    public func fetchStatus(reply: @escaping (NSData) -> Void) {
        let runtime = self.runtime
        let replyWrapper = SendableReply(reply)
        Task.detached {
            let runtimeName = await runtime.name
            let status = EngineXPCStatus(
                engine: "running",
                uptimeSeconds: EngineRuntime.uptimeSeconds,
                workers: [
                    "http": "ready",
                    "xpc": "ready",
                    "containerization": ContainerizationClient.shared.workerStatus
                ],
                runtimeMode: runtimeName
            )

            let data = (try? JSONEncoder().encode(status)) ?? Data()
            replyWrapper.value(data as NSData)
        }
    }

    public func listContainers(reply: @escaping (NSData?, NSError?) -> Void) {
        let runtime = self.runtime
        let replyWrapper = SendableReply(reply)
        Task.detached {
            do {
                let containers = try await runtime.listContainers()

                guard let data = try? JSONEncoder().encode(containers) else {
                    let error = NSError(
                        domain: "com.flyingdutchman.xpc",
                        code: 500,
                        userInfo: [NSLocalizedDescriptionKey: "Failed to encode containers"]
                    )
                    replyWrapper.value(nil, error)
                    return
                }

                replyWrapper.value(data as NSData, nil)
            } catch {
                let nsError = NSError(
                    domain: "com.flyingdutchman.xpc",
                    code: 500,
                    userInfo: [NSLocalizedDescriptionKey: error.localizedDescription]
                )
                replyWrapper.value(nil, nsError)
            }
        }
    }

    public func startContainer(id: String, reply: @escaping (NSData?, NSError?) -> Void) {
        guard let uuid = UUID(uuidString: id) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Invalid container ID format"]
            )
            reply(nil, error)
            return
        }

        let runtime = self.runtime
        let replyWrapper = SendableReply(reply)
        Task.detached {
            do {
                let updated = try await runtime.startContainer(id: uuid)

                guard let data = try? JSONEncoder().encode(updated) else {
                    let error = NSError(
                        domain: "com.flyingdutchman.xpc",
                        code: 500,
                        userInfo: [NSLocalizedDescriptionKey: "Failed to encode container"]
                    )
                    replyWrapper.value(nil, error)
                    return
                }

                replyWrapper.value(data as NSData, nil)
            } catch {
                // Map error to appropriate HTTP status code
                let errorDescription = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
                let errorCode: Int
                if errorDescription.contains("not found") || errorDescription.contains("NotFound") {
                    errorCode = 404
                } else if errorDescription.contains("Invalid state") || errorDescription.contains("invalidState") || errorDescription.contains("already") {
                    errorCode = 409
                } else {
                    errorCode = 500
                }
                
                let nsError = NSError(
                    domain: "com.flyingdutchman.xpc",
                    code: errorCode,
                    userInfo: [NSLocalizedDescriptionKey: errorDescription]
                )
                replyWrapper.value(nil, nsError)
            }
        }
    }

    public func stopContainer(id: String, reply: @escaping (NSData?, NSError?) -> Void) {
        guard let uuid = UUID(uuidString: id) else {
            let error = NSError(
                domain: "com.flyingdutchman.xpc",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Invalid container ID format"]
            )
            reply(nil, error)
            return
        }

        let runtime = self.runtime
        let replyWrapper = SendableReply(reply)
        Task.detached {
            do {
                let updated = try await runtime.stopContainer(id: uuid)

                guard let data = try? JSONEncoder().encode(updated) else {
                    let error = NSError(
                        domain: "com.flyingdutchman.xpc",
                        code: 500,
                        userInfo: [NSLocalizedDescriptionKey: "Failed to encode container"]
                    )
                    replyWrapper.value(nil, error)
                    return
                }

                replyWrapper.value(data as NSData, nil)
            } catch {
                // Map error to appropriate HTTP status code
                let errorDescription = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
                let errorCode: Int
                if errorDescription.contains("not found") || errorDescription.contains("NotFound") {
                    errorCode = 404
                } else if errorDescription.contains("Invalid state") || errorDescription.contains("invalidState") || errorDescription.contains("already") {
                    errorCode = 409
                } else {
                    errorCode = 500
                }
                
                let nsError = NSError(
                    domain: "com.flyingdutchman.xpc",
                    code: errorCode,
                    userInfo: [NSLocalizedDescriptionKey: errorDescription]
                )
                replyWrapper.value(nil, nsError)
            }
        }
    }
}
