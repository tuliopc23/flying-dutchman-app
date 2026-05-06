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
            "Linux kernel not found"

        case .initfsNotAvailable:
            "Initial filesystem not available"

        case .vmBootFailed:
            "Virtual machine failed to start"

        case .vsockConnectionFailed:
            "Failed to connect to virtual machine"
        }
    }

    public var technicalMessage: String {
        switch self {
        case let .kernelNotFound(path):
            "Linux kernel binary not found at path: \(path)"

        case .initfsNotAvailable:
            "Initial ramdisk (initramfs/initfs) not available for VM boot"

        case let .vmBootFailed(reason):
            "VM boot sequence failed: \(reason)"

        case let .vsockConnectionFailed(cid, port):
            "VSOCK connection failed to CID \(cid), port \(port)"
        }
    }

    public var isRecoverable: Bool {
        switch self {
        case .kernelNotFound:
            true // User can provide/download kernel
        case .initfsNotAvailable:
            true // Can be regenerated
        case .vmBootFailed:
            true // Can retry
        case .vsockConnectionFailed:
            true // Can retry connection
        }
    }

    public var suggestedAction: String? {
        switch self {
        case .kernelNotFound:
            "Download the Linux kernel using: dutchman kernel download"
        case .initfsNotAvailable:
            "Run: dutchman init to set up the initial filesystem"
        case .vmBootFailed:
            "Check system resources and try again"
        case .vsockConnectionFailed:
            "Ensure the VM is running and try again"
        }
    }
}
