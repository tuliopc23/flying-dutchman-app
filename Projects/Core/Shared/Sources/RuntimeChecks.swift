import Foundation

public enum RuntimeChecks {
    public struct ToolCheck {
        public let name: String
        public let status: String
        public let message: String

        public init(name: String, status: String, message: String) {
            self.name = name
            self.status = status
            self.message = message
        }
    }

    public struct PlatformStatus {
        public let osVersion: OperatingSystemVersion
        public let isAppleSilicon: Bool
        public let isSupported: Bool
        public let message: String
    }

    private static var containerizationFrameworkAvailable: Bool {
        #if canImport(Containerization)
            true
        #else
            false
        #endif
    }

    public static func containerToolVersion() -> ToolCheck {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = ["container", "--version"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        do {
            try process.run()
            process.waitUntilExit()
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
            if process.terminationStatus == 0 {
                return ToolCheck(name: "container", status: "ok", message: output)
            } else {
                return ToolCheck(
                    name: "container",
                    status: "error",
                    message: output.isEmpty ? "container tool returned non-zero" : output
                )
            }
        } catch {
            return ToolCheck(name: "container", status: "missing", message: "container CLI not found in PATH")
        }
    }

    public static func containerizationFramework() -> ToolCheck {
        containerizationFramework(frameworkAvailable: containerizationFrameworkAvailable)
    }

    public static func containerizationFramework(frameworkAvailable: Bool) -> ToolCheck {
        if frameworkAvailable {
            return ToolCheck(name: "Containerization.framework", status: "ok", message: "Framework present")
        }

        return ToolCheck(
            name: "Containerization.framework",
            status: "missing",
            message: """
            Containerization.framework not detected. \
            Install Tahoe Containerization for the native runtime. \
            Flying Dutchman can use CLI fallback when available \
            and only falls back to stub mode if no runtime is reachable.
            """
        )
    }

    public static func platformSupport(
        minimumMajorVersion: Int = 26,
        requireAppleSilicon: Bool = true
    ) -> PlatformStatus {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        #if arch(arm64)
            let isAppleSilicon = true
        #else
            let isAppleSilicon = false
        #endif

        let meetsVersion = version.majorVersion >= minimumMajorVersion
        let meetsArch = requireAppleSilicon ? isAppleSilicon : true
        let requiredOSLabel = minimumMajorVersion >= 26 ? "macOS Tahoe \(minimumMajorVersion)+" : "macOS \(minimumMajorVersion)+"

        let supported = meetsVersion && meetsArch
        let message: String = if supported {
            "Platform supported (\(version.majorVersion).\(version.minorVersion)) on \(isAppleSilicon ? "Apple Silicon" : "Intel")"
        } else if !meetsVersion {
            "Requires \(requiredOSLabel) (detected \(version.majorVersion).\(version.minorVersion))"
        } else {
            "Apple Silicon required (detected Intel)"
        }

        return PlatformStatus(
            osVersion: version,
            isAppleSilicon: isAppleSilicon,
            isSupported: supported,
            message: message
        )
    }

    private static var kernelPath: URL {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        return base
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("kernel")
            .appendingPathComponent("vmlinux")
    }

    public static func checkKernelAvailability() -> ToolCheck {
        let path = kernelPath.path
        if FileManager.default.fileExists(atPath: path) {
            return ToolCheck(name: "Kernel", status: "ok", message: "Kernel present at \(path)")
        } else {
            return ToolCheck(name: "Kernel", status: "missing", message: "Kernel missing at \(path). Please run 'dutchman kernel download'")
        }
    }

    public static func checkInitfsAvailability() -> ToolCheck {
        #if canImport(Containerization)
        return ToolCheck(name: "vminit (initfs)", status: "ok", message: "Reference: ghcr.io/apple/containerization/vminit:0.13.0")
        #else
        return ToolCheck(name: "vminit (initfs)", status: "missing", message: "Containerization framework required to load initfs")
        #endif
    }

    public static func checkDatabaseStatus() -> ToolCheck {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fm.temporaryDirectory
        let dbDir = base.appendingPathComponent("flyingdutchman")
        let dbPath = dbDir.appendingPathComponent("flyingdutchman.sqlite")

        if !fm.fileExists(atPath: dbPath.path) {
            let dirExists = fm.fileExists(atPath: dbDir.path)
            if !dirExists {
                try? fm.createDirectory(at: dbDir, withIntermediateDirectories: true)
            }
            if fm.isWritableFile(atPath: dbDir.path) {
                return ToolCheck(name: "Database (SQLite)", status: "ok", message: "Database does not exist yet, directory is writable")
            } else {
                return ToolCheck(name: "Database (SQLite)", status: "error", message: "Database directory is not writable")
            }
        }

        if fm.isWritableFile(atPath: dbPath.path) {
            return ToolCheck(name: "Database (SQLite)", status: "ok", message: "Database file is present and writable")
        } else {
            return ToolCheck(name: "Database (SQLite)", status: "error", message: "Database file is not writable")
        }
    }

    public static func checkPortAvailability() -> ToolCheck {
        var occupied: [Int] = []
        // Standard ports: 8080 (HTTP API), 5353 (DNS Resolver), 8443 (HTTPS Proxy)
        let portsToCheck = [8080, 5353, 8443]

        for port in portsToCheck {
            if isPortInUse(UInt16(port)) {
                occupied.append(port)
            }
        }

        if occupied.isEmpty {
            return ToolCheck(name: "Ports Status", status: "ok", message: "All ports (8080, 5353, 8443) are available")
        } else {
            return ToolCheck(
                name: "Ports Status",
                status: "warning",
                message: "Ports occupied by other processes: \(occupied.map(String.init).joined(separator: ", "))"
            )
        }
    }

    private static func isPortInUse(_ port: UInt16) -> Bool {
        var socketAddress = sockaddr_in()
        socketAddress.sin_family = sa_family_t(AF_INET)
        socketAddress.sin_port = port.bigEndian
        socketAddress.sin_addr.s_addr = INADDR_ANY.bigEndian

        let socketFd = socket(AF_INET, SOCK_STREAM, 0)
        if socketFd == -1 { return false }
        defer { close(socketFd) }

        var yes: Int32 = 1
        setsockopt(socketFd, SOL_SOCKET, SO_REUSEADDR, &yes, socklen_t(MemoryLayout<Int32>.size))

        let bindResult = withUnsafePointer(to: &socketAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                bind(socketFd, $0, socklen_t(MemoryLayout<sockaddr_in>.size))
            }
        }

        return bindResult == -1
    }

    public static func activeRuntimeMode() -> String {
        let env = ProcessInfo.processInfo.environment["FD_RUNTIME"]?.lowercased()
        if let env, !env.isEmpty, env != "auto" {
            return env
        }

        #if canImport(Containerization)
        let fm = FileManager.default
        if fm.fileExists(atPath: kernelPath.path) {
            return "native"
        }
        #endif

        let cliCheck = containerToolVersion()
        if cliCheck.status == "ok" {
            return "cli"
        }

        return "stub"
    }
}
