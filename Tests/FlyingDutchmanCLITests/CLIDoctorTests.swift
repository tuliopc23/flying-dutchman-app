import Foundation
import Testing

@Suite("CLI Doctor Tests")
struct CLIDoctorTests {
    @Test("doctor --json emits structured diagnostics")
    func doctorJSONIncludesStableTopLevelKeys() throws {
        let result = try CLIProcess.run(["doctor", "--json"])

        #expect(result.exitCode == 0)

        let payload = try #require(
            try JSONSerialization.jsonObject(with: Data(result.stdout.utf8)) as? [String: Any]
        )

        let platform = try #require(payload["platform"] as? [String: Any])
        let containerTool = try #require(payload["containerTool"] as? [String: Any])
        let containerization = try #require(payload["containerization"] as? [String: Any])

        #expect(platform["message"] as? String != nil)
        #expect(platform["isSupported"] as? Bool != nil)
        #expect(platform["osVersion"] as? String != nil)

        #expect(containerTool["name"] as? String == "container")
        #expect(containerTool["status"] as? String != nil)
        #expect(containerTool["message"] as? String != nil)

        #expect(containerization["name"] as? String == "Containerization.framework")
        #expect(containerization["status"] as? String != nil)
        #expect(containerization["message"] as? String != nil)

        #expect(payload["http"] != nil || payload["httpError"] != nil)
        #expect(payload["xpc"] != nil || payload["xpcError"] != nil)
    }

    @Test("doctor and recovery commands advertise help text")
    func helpOutputDocumentsDiagnosticsAndRecoveryCommands() throws {
        let doctorHelp = try CLIProcess.run(["doctor", "--help"])
        #expect(doctorHelp.exitCode == 0)
        #expect(doctorHelp.stdout.contains("Show diagnostics"))
        #expect(doctorHelp.stdout.contains("--json"))

        let resolverHelp = try CLIProcess.run(["networking", "install-resolver", "--help"])
        #expect(resolverHelp.exitCode == 0)
        #expect(resolverHelp.stdout.contains("Install DNS resolver configuration"))
        #expect(resolverHelp.stdout.contains("install-resolver"))

        let trustCAHelp = try CLIProcess.run(["trust-ca", "--help"])
        #expect(trustCAHelp.exitCode == 0)
        #expect(trustCAHelp.stdout.contains("Trust the Flying Dutchman Root CA certificate"))
        #expect(trustCAHelp.stdout.contains("trust-ca"))
    }
}

private struct CLIProcess {
    let exitCode: Int32
    let stdout: String
    let stderr: String

    static func run(_ arguments: [String]) throws -> CLIProcess {
        let process = Process()
        process.executableURL = try executableURL()
        process.arguments = arguments

        let stdoutPipe = Pipe()
        let stderrPipe = Pipe()
        process.standardOutput = stdoutPipe
        process.standardError = stderrPipe

        try process.run()
        process.waitUntilExit()

        let stdout = String(decoding: stdoutPipe.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
        let stderr = String(decoding: stderrPipe.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)

        return CLIProcess(
            exitCode: process.terminationStatus,
            stdout: stdout,
            stderr: stderr
        )
    }

    private static func executableURL() throws -> URL {
        let sourceFile = URL(fileURLWithPath: #filePath)
        let repoRoot = sourceFile
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()

        let candidates = [
            repoRoot.appendingPathComponent(".build/debug/FlyingDutchmanCLI"),
            repoRoot.appendingPathComponent(".build/arm64-apple-macosx/debug/FlyingDutchmanCLI"),
        ]

        for candidate in candidates where FileManager.default.isExecutableFile(atPath: candidate.path) {
            return candidate
        }

        throw CLIProcessError.executableNotFound(candidates.map(\.path))
    }
}

private enum CLIProcessError: LocalizedError {
    case executableNotFound([String])

    var errorDescription: String? {
        switch self {
        case let .executableNotFound(paths):
            return "Could not find FlyingDutchmanCLI executable at: \(paths.joined(separator: ", "))"
        }
    }
}
