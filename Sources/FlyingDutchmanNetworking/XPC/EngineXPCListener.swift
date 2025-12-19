import Foundation
import Shared
import FlyingDutchmanContainers

public actor EngineXPCListener {
    public static let serviceName = "com.flyingdutchman.engine.xpc"
    public static let shared = EngineXPCListener()

    private var listener: NSXPCListener?
    private var delegate: NSXPCListenerDelegate?
    private var runtime: ContainerRuntimeProtocol?

    public func start(runtime: ContainerRuntimeProtocol) {
        guard listener == nil else { return }

        self.runtime = runtime

        let listener = NSXPCListener(machServiceName: Self.serviceName)
        let delegate = XPCDelegate(runtime: runtime)
        listener.delegate = delegate

        self.listener = listener
        self.delegate = delegate

        listener.resume()
        Loggers.make(category: "flyingdutchman.xpc").info("XPC listener started: \(Self.serviceName)")
    }
}

private final class XPCDelegate: NSObject, NSXPCListenerDelegate {
    private let runtime: ContainerRuntimeProtocol

    init(runtime: ContainerRuntimeProtocol) {
        self.runtime = runtime
        super.init()
    }

    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface(with: EngineXPCProtocol.self)
        newConnection.exportedObject = EngineXPCService(runtime: runtime)
        newConnection.resume()
        return true
    }
}
