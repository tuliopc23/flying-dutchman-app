import Foundation

public enum RuntimeChecks {
    public struct ToolCheck {
        public let name: String
        public let status: String
        public let message: String
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
                return ToolCheck(name: "container", status: "error", message: output.isEmpty ? "container tool returned non-zero" : output)
            }
        } catch {
            return ToolCheck(name: "container", status: "missing", message: "container CLI not found in PATH")
        }
    }
}
