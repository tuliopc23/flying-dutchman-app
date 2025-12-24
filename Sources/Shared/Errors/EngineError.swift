import Foundation

/// Errors related to the virtualization engine
public enum EngineError: FlyingDutchmanError {
    /// The Linux kernel was not found at the specified path
    case kernelNotFound(path: String)

    /// The initial ramdisk (initfs) is not available
    case initfsNotAvailable

    /// The virtual machine failed to boot
    case vmBootFailed(reason: String)

    /// Failed to establish a VSOCK connection
    case vsockConnectionFailed(cid: UInt32, port: UInt32)

    // MARK: - FlyingDutchmanError

    public var userMessage: String {
        switch self {
        case .kernelNotFound:
            return "Linux kernel not found"

        case .initfsNotAvailable:
            return "Initial filesystem not available"

        case .vmBootFailed:
            return "Virtual machine failed to start"

        case .vsockConnectionFailed:
            return "Failed to connect to virtual machine"
        }
    }

    public var technicalMessage: String {
        switch self {
        case let .kernelNotFound(path):
            return "Linux kernel binary not found at path: \(path)"

        case .initfsNotAvailable:
            return "Initial ramdisk (initramfs/initfs) not available for VM boot"

        case let .vmBootFailed(reason):
            return "VM boot sequence failed: \(reason)"

        case let .vsockConnectionFailed(cid, port):
            return "VSOCK connection failed to CID \(cid), port \(port)"
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .kernelNotFound:
            return true // User can provide/download kernel
        case .initfsNotAvailable:
            return true // Can be regenerated
        case .vmBootFailed:
            return true // Can retry
        case .vsockConnectionFailed:
            return true // Can retry connection
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .kernelNotFound:
            return "Download the Linux kernel using: dutchman kernel download"
        case .initfsNotAvailable:
            return "Run: dutchman init to set up the initial filesystem"
        case .vmBootFailed:
            return "Check system resources and try again"
        case .vsockConnectionFailed:
            return "Ensure the VM is running and try again"
        }
    }
}
