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
            message: "Containerization.framework not detected. Install Tahoe Containerization for the native runtime. Flying Dutchman can use CLI fallback when available and only falls back to stub mode if no runtime is reachable."
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
}
