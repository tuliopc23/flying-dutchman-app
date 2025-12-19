import Foundation
import SystemPackage
import Shared
import AsyncHTTPClient
import NIOCore
import NIOPosix

/// Manages Linux kernel downloads and storage for containerization
public actor KernelManager {
    private let logger = Loggers.make(category: "flyingdutchman.kernel")
    private let httpClient: HTTPClient
    
    public static let shared = KernelManager()
    
    // Kernel download URLs
    private struct KernelSource {
        let name: String
        let url: String
        let sha256: String?
        
        static let kata = KernelSource(
            name: "kata-containers",
            url: "https://github.com/kata-containers/kata-containers/releases/download/3.2.0/kata-static-3.2.0-x86_64.tar.xz",
            sha256: nil  // TODO: Add checksum
        )
        
        static let custom = KernelSource(
            name: "flyingdutchman-optimized",
            url: "https://example.com/vmlinux",  // TODO: Host our own
            sha256: nil
        )
    }
    
    private init() {
        self.httpClient = HTTPClient(eventLoopGroupProvider: .singleton)
    }
    
    /// Get the path to a usable kernel, downloading if necessary
    public func ensureKernel() async throws -> FilePath {
        let kernelPath = Self.kernelPath()
        
        if FileManager.default.fileExists(atPath: kernelPath.string) {
            logger.info("Using existing kernel at \(kernelPath)")
            return kernelPath
        }
        
        logger.info("Kernel not found, downloading...")
        try await downloadKernel(to: kernelPath)
        return kernelPath
    }
    
    /// Download the kernel from a known source
    private func downloadKernel(to path: FilePath) async throws {
        let source = KernelSource.kata  // Use Kata for now
        
        logger.info("Downloading kernel from \(source.url)")
        
        // Create kernel directory
        let kernelDir = path.removingLastComponent()
        try FileManager.default.createDirectory(
            atPath: kernelDir.string,
            withIntermediateDirectories: true
        )
        
        // Download to temporary file
        let tempURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
        
        let request = try HTTPClient.Request(url: source.url)
        let response = try await httpClient.execute(request: request).get()
        
        guard response.status == .ok else {
            throw KernelError.downloadFailed("HTTP \(response.status)")
        }
        
        // Stream to file
        var buffer = ByteBufferAllocator().buffer(capacity: 0)
        for try await chunk in response.body {
            var chunk = chunk
            buffer.writeBuffer(&chunk)
        }
        
        let data = Data(buffer: buffer)
        try data.write(to: tempURL)
        
        // Extract if archive
        if source.url.hasSuffix(".tar.xz") {
            try await extractKernelFromArchive(tempURL, to: path)
        } else {
            // Direct kernel file
            try FileManager.default.moveItem(
                at: tempURL,
                to: URL(fileURLWithPath: path.string)
            )
        }
        
        logger.info("Kernel downloaded successfully to \(path)")
    }
    
    private func extractKernelFromArchive(_ archiveURL: URL, to kernelPath: FilePath) async throws {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/tar")
        task.arguments = [
            "-xf", archiveURL.path,
            "--strip-components=3",  // Kata structure: kata-static/vmlinux
            "-C", kernelPath.removingLastComponent().string,
            "*/vmlinux*"
        ]
        
        try task.run()
        task.waitUntilExit()
        
        guard task.terminationStatus == 0 else {
            throw KernelError.extractionFailed
        }
        
        // Find extracted vmlinux
        let kernelDir = kernelPath.removingLastComponent()
        let contents = try FileManager.default.contentsOfDirectory(atPath: kernelDir.string)
        
        if let vmlinux = contents.first(where: { $0.hasPrefix("vmlinux") }) {
            let extractedPath = kernelDir.appending(vmlinux)
            if extractedPath != kernelPath {
                try FileManager.default.moveItem(
                    at: URL(fileURLWithPath: extractedPath.string),
                    to: URL(fileURLWithPath: kernelPath.string)
                )
            }
        }
    }
    
    /// Clean up downloaded kernels
    public func cleanKernelCache() throws {
        let kernelDir = Self.kernelPath().removingLastComponent()
        if FileManager.default.fileExists(atPath: kernelDir.string) {
            try FileManager.default.removeItem(atPath: kernelDir.string)
        }
    }
    
    private static func kernelPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!
        
        let kernelURL = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("kernel")
            .appendingPathComponent("vmlinux")
        
        return FilePath(kernelURL.path)
    }
}

enum KernelError: LocalizedError {
    case downloadFailed(String)
    case extractionFailed
    
    var errorDescription: String? {
        switch self {
        case .downloadFailed(let reason):
            return "Failed to download kernel: \(reason)"
        case .extractionFailed:
            return "Failed to extract kernel from archive"
        }
    }
}