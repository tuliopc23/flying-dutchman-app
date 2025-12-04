import Foundation
import Shared

public final class EngineXPCListener {
    public static let serviceName = "com.flyingdutchman.engine.xpc"

    public static func start() {
        let listener = NSXPCListener(machServiceName: serviceName)
        listener.delegate = XPCDelegate()
        listener.resume()
        Loggers.make(category: "flyingdutchman.xpc").info("XPC listener started: \(serviceName)")
    }
}

private final class XPCDelegate: NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface(with: EngineXPCProtocol.self)
        newConnection.exportedObject = EngineXPCService()
        newConnection.resume()
        return true
    }
}
