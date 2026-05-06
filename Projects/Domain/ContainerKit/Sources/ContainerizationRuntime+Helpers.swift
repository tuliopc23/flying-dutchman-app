import AsyncHTTPClient
import Containerization
import ContainerizationExtras
import ContainerizationOCI
import FlyingDutchmanPersistence
import Foundation
import Logging
import NIOCore
import NIOTransportServices
import Shared
import SystemPackage

extension ContainerizationRuntime {
    func cleanupContainerData(for containerID: UUID) async throws {
        let containerDir = Self.containerDirectory(for: containerID)
        if FileManager.default.fileExists(atPath: containerDir.string) {
            try FileManager.default.removeItem(atPath: containerDir.string)
        }
    }

    /// Stream logs from a VSOCK FileHandle using length-prefixed JSON protocol
    /// The vminitd protocol uses 4-byte length prefix followed by JSON-encoded ControlPlaneEvent
    func streamLogsFromHandle(
        _ handle: FileHandle,
        continuation: AsyncStream<String>.Continuation,
        containerID: UUID
    ) async throws {
        logger.info("Starting log stream for container \(containerID)")

        var buffer = Data()
        let decoder = JSONDecoder()

        // Read loop - process incoming data from vminitd
        while true {
            // Read available data asynchronously
            let chunk: Data?
            do {
                chunk = try await withCheckedThrowingContinuation { (cont: CheckedContinuation<Data?, Error>) in
                    handle.readabilityHandler = { fileHandle in
                        let data = fileHandle.availableData
                        fileHandle.readabilityHandler = nil
                        if data.isEmpty {
                            cont.resume(returning: nil) // EOF
                        } else {
                            cont.resume(returning: data)
                        }
                    }
                }
            } catch {
                logger.error("Read error for container \(containerID): \(error)")
                continuation.yield("[Stream error: \(error.localizedDescription)]")
                break
            }

            // Check for EOF
            guard let data = chunk, !data.isEmpty else {
                logger.info("Log stream ended for container \(containerID) (EOF)")
                break
            }

            buffer.append(data)

            // Process complete frames from buffer
            while buffer.count >= 4 {
                // Read 4-byte length prefix (big-endian UInt32)
                let lengthBytes = buffer.prefix(4)
                let length = lengthBytes.withUnsafeBytes { $0.load(as: UInt32.self).bigEndian }

                // Check if we have the complete frame
                guard buffer.count >= 4 + Int(length) else {
                    break // Wait for more data
                }

                // Extract JSON body
                let jsonData = buffer.subdata(in: 4 ..< (4 + Int(length)))
                buffer.removeFirst(4 + Int(length))

                // Decode and handle event
                do {
                    let event = try decoder.decode(ControlPlaneEvent.self, from: jsonData)

                    switch event {
                    case let .logLine(line):
                        continuation.yield(line)
                        // Also persist to log store for historical access
                        self.logStore.append(containerID: containerID, line: line)

                    case let .exit(code):
                        logger.info("Container \(containerID) process exited with code \(code)")
                        continuation.yield("[Process exited with code \(code)]")
                        continuation.finish()
                        try? handle.close()
                        return

                    case .pong:
                        // Keepalive response, ignore
                        break
                    }
                } catch {
                    logger.warning("Failed to decode control plane event: \(error)")
                    // Try to recover by continuing to next frame
                }
            }
        }

        // Clean up
        try? handle.close()
        continuation.finish()
        logger.info("Log stream completed for container \(containerID)")
    }

    func blobsPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!

        let path = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("cache")
            .appendingPathComponent("blobs")

        return FilePath(path.path)
    }

    func manifestsPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!

        let path = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("cache")
            .appendingPathComponent("manifests")

        return FilePath(path.path)
    }

    func manifestFilePath(name: String, tag: String) -> FilePath {
        let safeName = name.replacingOccurrences(of: "/", with: "_")
        let filename = "\(safeName)_\(tag).json"
        return manifestsPath().appending(filename)
    }

    func storeContainerConfig(containerID: UUID, config: ContainerConfig) async throws {
        let configPath = Self.containerConfigPath(for: containerID)
        let configDir = configPath.removingLastComponent()

        try FileManager.default.createDirectory(
            atPath: configDir.string,
            withIntermediateDirectories: true
        )

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let configData = try encoder.encode(config)
        try configData.write(to: URL(fileURLWithPath: configPath.string))
    }

    func loadContainerConfig(containerID: UUID) async throws -> ContainerConfig {
        let configPath = Self.containerConfigPath(for: containerID)

        guard FileManager.default.fileExists(atPath: configPath.string) else {
            return ContainerConfig.default
        }

        let configData = try Data(contentsOf: URL(fileURLWithPath: configPath.string))
        return try JSONDecoder().decode(ContainerConfig.self, from: configData)
    }

    func computeCPUCount(from cpuLimit: Int?) -> Int {
        // cpuLimit is in millicores (1000 = 1 CPU)
        if let limit = cpuLimit {
            let cores = max(1, (limit + 999) / 1000)
            let hostCores = ProcessInfo.processInfo.processorCount
            return min(cores, hostCores)
        }
        return 2 // Default
    }

    func computeMemorySize(from memoryLimit: Int?) -> Int {
        // memoryLimit is in bytes
        if let limit = memoryLimit {
            let minMemory = 128 * 1024 * 1024 // 128MB
            let maxMemory = Int(ProcessInfo.processInfo.physicalMemory)
            return max(minMemory, min(limit, maxMemory))
        }
        return 512 * 1024 * 1024 // 512MB default
    }
}
