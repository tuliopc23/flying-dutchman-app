import Foundation
import Shared

public actor EngineXPCListener {
    public static let serviceName = "com.flyingdutchman.engine.xpc"
    public static let shared = EngineXPCListener()

    private var listener: NSXPCListener?
    private var delegate: NSXPCListenerDelegate?

    public func start() {
        guard listener == nil else { return }

        let listener = NSXPCListener(machServiceName: Self.serviceName)
        let delegate = XPCDelegate()
        listener.delegate = delegate

        self.listener = listener
        self.delegate = delegate

        listener.resume()
        Loggers.make(category: "flyingdutchman.xpc").info("XPC listener started: \(Self.serviceName)")
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
