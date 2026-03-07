import Testing
import Foundation
import Darwin
import Shared
import FlyingDutchmanContainers

@Suite("Engine Startup Tests")
struct EngineStartupTests {
    @Test("Runtime checks expose startup diagnostics")
    func runtimeChecksDescribeStartupEnvironment() {
        let platform = RuntimeChecks.platformSupport()
        let framework = RuntimeChecks.containerizationFramework()

        #expect(platform.osVersion.majorVersion > 0)
        #expect(!platform.message.isEmpty)
        #expect(framework.name == "Containerization.framework")
        #expect(!framework.status.isEmpty)
        #expect(!framework.message.isEmpty)
    }

    @Test("Runtime checks explain native runtime fallback without misreporting stub state")
    func runtimeChecksDescribeFallbackGuidanceWhenFrameworkIsMissing() {
        let framework = RuntimeChecks.containerizationFramework(frameworkAvailable: false)

        #expect(framework.status == "missing")
        #expect(framework.message.contains("CLI fallback"))
        #expect(framework.message.contains("stub mode"))
        #expect(!framework.message.contains("Not detected (stub)"))
    }

    @Test("Runtime factory can force stub startup mode")
    func runtimeFactoryCanBuildInspectableStubRuntime() async throws {
        let previous = ProcessInfo.processInfo.environment["FD_RUNTIME"]
        setenv("FD_RUNTIME", "stub", 1)
        defer {
            if let previous {
                setenv("FD_RUNTIME", previous, 1)
            } else {
                unsetenv("FD_RUNTIME")
            }
        }

        let runtime = RuntimeFactory.makeRuntime()
        let containers = try await runtime.listContainers()

        #expect(await runtime.name == "Stub Runtime")
        #expect(!containers.isEmpty)
        #expect(RuntimeFactory.runtimeDescription == "FD_RUNTIME=stub")
    }
}
