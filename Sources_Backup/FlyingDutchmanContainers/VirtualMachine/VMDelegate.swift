import Foundation
import Logging
import Virtualization

final class VMDelegate: NSObject, VZVirtualMachineDelegate {
    let machineID: String
    let logger: Logger

    init(machineID: String, logger: Logger) {
        self.machineID = machineID
        self.logger = logger
        super.init()
    }

    func guestDidStop(_: VZVirtualMachine) {
        logger.info("VM stopped: \(machineID)")
    }

    func virtualMachine(_: VZVirtualMachine, didStopWithError error: Error) {
        logger.error("VM stopped with error: \(machineID) - \(error.localizedDescription)")
    }

    func virtualMachine(
        _: VZVirtualMachine,
        networkDevice _: VZNetworkDevice,
        attachmentWasDisconnectedWithError error: Error
    ) {
        logger.warning("VM network disconnected: \(machineID) - \(error.localizedDescription)")
    }
}
