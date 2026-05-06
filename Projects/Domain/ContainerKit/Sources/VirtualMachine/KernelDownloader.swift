import Foundation
import Logging
import Shared

public actor KernelDownloader {
    private let logger = Loggers.make(category: "flyingdutchman.machines.kernel")
    private let cacheDirectory: URL

    public init() {
        let fm = FileManager.default
        let appSupport = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        self.cacheDirectory = appSupport.appendingPathComponent("flyingdutchman/kernels", isDirectory: true)

        try? fm.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }

    /// Kernel URLs for different distributions
    private func kernelURL(for distro: String, version: String) -> (kernel: String, initrd: String)? {
        switch distro.lowercased() {
        case "ubuntu":
            // Ubuntu cloud images kernel
            (
                kernel: "https://cloud-images.ubuntu.com/releases/\(version)/release/unpacked/ubuntu-\(version)-server-cloudimg-amd64-vmlinuz-generic",
                initrd: "https://cloud-images.ubuntu.com/releases/\(version)/release/unpacked/ubuntu-\(version)-server-cloudimg-amd64-initrd-generic"
            )
        case "debian":
            // Debian cloud kernels
            (
                kernel: "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.tar.xz",
                initrd: "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.tar.xz"
            )
        default:
            nil
        }
    }

    public func ensureKernel(
        for machineID: String,
        distro: String,
        version: String,
        targetKernelPath: URL,
        targetInitrdPath: URL
    ) async throws {
        // Check if kernel and initrd already exist
        if FileManager.default.fileExists(atPath: targetKernelPath.path),
           FileManager.default.fileExists(atPath: targetInitrdPath.path) {
            logger.info("Kernel and initrd already exist for machine \(machineID)")
            return
        }

        guard let urls = kernelURL(for: distro, version: version) else {
            logger.warning("No kernel download URL configured for \(distro):\(version)")
            logger.info("You can manually place kernel at: \(targetKernelPath.path)")
            logger.info("You can manually place initrd at: \(targetInitrdPath.path)")
            return
        }

        logger.info("Downloading kernel for \(distro):\(version)...")

        do {
            // Download kernel
            let (kernelData, _) = try await URLSession.shared.data(from: URL(string: urls.kernel)!)
            try kernelData.write(to: targetKernelPath)
            logger.info("Downloaded kernel: \(targetKernelPath.path)")

            // Download initrd
            let (initrdData, _) = try await URLSession.shared.data(from: URL(string: urls.initrd)!)
            try initrdData.write(to: targetInitrdPath)
            logger.info("Downloaded initrd: \(targetInitrdPath.path)")
        } catch {
            logger.error("Failed to download kernel/initrd: \(error.localizedDescription)")
            logger.info("You can manually place kernel at: \(targetKernelPath.path)")
            logger.info("You can manually place initrd at: \(targetInitrdPath.path)")
            throw error
        }
    }

    public func getCachedKernel(for distro: String, version: String) -> (kernel: URL, initrd: URL)? {
        let kernelPath = cacheDirectory.appendingPathComponent("\(distro)-\(version)-vmlinuz")
        let initrdPath = cacheDirectory.appendingPathComponent("\(distro)-\(version)-initrd.img")

        if FileManager.default.fileExists(atPath: kernelPath.path),
           FileManager.default.fileExists(atPath: initrdPath.path) {
            return (kernel: kernelPath, initrd: initrdPath)
        }

        return nil
    }
}
