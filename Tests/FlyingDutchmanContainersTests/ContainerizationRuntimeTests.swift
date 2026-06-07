@testable import FlyingDutchmanContainers
import SystemPackage
import XCTest

final class ContainerizationRuntimeTests: XCTestCase {
    var runtime: ContainerizationRuntime?

    override func setUp() async throws {
        try await super.setUp()
        runtime = ContainerizationRuntime(kernelPath: FilePath("/tmp/nonexistent-kernel"))
    }

    func testLogFilePersistenceAndCleanup() async throws {
        let runtime = try XCTUnwrap(self.runtime)
        let containerID = UUID()
        let logLine = "Test log line 1"

        // 1. Append log line
        await runtime.appendLogLineToFile(containerID: containerID, line: logLine)

        // 2. Verify file exists and has content
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        let logFileURL = homeDir.appendingPathComponent(".flyingdutchman/logs/\(containerID.uuidString).log")
        XCTAssertTrue(FileManager.default.fileExists(atPath: logFileURL.path))

        let content = try String(contentsOf: logFileURL, encoding: .utf8)
        XCTAssertEqual(content, logLine + "\n")

        // 3. Append another log line
        let logLine2 = "Test log line 2"
        await runtime.appendLogLineToFile(containerID: containerID, line: logLine2)

        let content2 = try String(contentsOf: logFileURL, encoding: .utf8)
        XCTAssertEqual(content2, logLine + "\n" + logLine2 + "\n")

        // 4. Remove log file
        try? FileManager.default.removeItem(at: logFileURL)
        XCTAssertFalse(FileManager.default.fileExists(atPath: logFileURL.path))
    }
}
