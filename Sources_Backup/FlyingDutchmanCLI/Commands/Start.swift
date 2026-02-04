import Foundation
import ArgumentParser
import Shared
import FlyingDutchmanNetworking

struct Start: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Start the Flying Dutchman engine and all services"
    )
    
    @Flag(name: .long, help: "Run in background (daemon mode)")
    var daemon: Bool = false
    
    @Flag(name: .long, help: "Wait for engine to be ready")
    var wait: Bool = false
    
    func run() async throws {
        CLIOutput.section("Start Flying Dutchman")
        
        // Check if engine is already running
        do {
            _ = try await EngineClient.getStatus()
            CLIOutput.line("Status", "✓ Engine already running")
            return
        } catch {
            // Engine not running, continue with start
        }
        
        if daemon {
            CLIOutput.line("Mode", "Daemon (background)")
            try startDaemon()
        } else {
            CLIOutput.line("Mode", "Foreground")
            CLIOutput.warn("Note", "Engine will run in foreground. Use --daemon for background mode.")
            try startForeground()
        }
        
        if wait {
            CLIOutput.line("Waiting", "Engine to be ready...")
            try await waitForEngine()
        }
        
        CLIOutput.line("Status", "✓ Engine started")
        CLIOutput.line("API", "http://localhost:8080")
        CLIOutput.hint("Check status with: fd doctor")
    }
    
    private func startDaemon() throws {
        // Launch engine as background process
        let enginePath = findEngineBinary()
        
        let process = Process()
        process.executableURL = URL(fileURLWithPath: enginePath)
        process.arguments = []
        
        // Redirect output to log file
        let logDir = FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent("Library/Logs/FlyingDutchman")
        try? FileManager.default.createDirectory(at: logDir, withIntermediateDirectories: true)
        
        let logFile = logDir.appendingPathComponent("engine.log")
        let logHandle = try FileHandle(forWritingTo: logFile)
        process.standardOutput = logHandle
        process.standardError = logHandle
        
        try process.run()
        process.waitUntilExit()
        
        CLIOutput.line("Daemon", "Started (PID: \(process.processIdentifier))")
        CLIOutput.line("Logs", logFile.path)
    }
    
    private func startForeground() throws {
        let enginePath = findEngineBinary()
        
        let process = Process()
        process.executableURL = URL(fileURLWithPath: enginePath)
        process.arguments = []
        
        try process.run()
        process.waitUntilExit()
    }
    
    private func findEngineBinary() -> String {
        // Try to find the engine binary
        let possiblePaths = [
            ".build/debug/FlyingDutchmanEngine",
            ".build/release/FlyingDutchmanEngine",
            "/usr/local/bin/FlyingDutchmanEngine",
            "/Applications/FlyingDutchman.app/Contents/MacOS/FlyingDutchmanEngine"
        ]
        
        for path in possiblePaths {
            if FileManager.default.fileExists(atPath: path) {
                return path
            }
        }
        
        return "FlyingDutchmanEngine" // Fallback to PATH
    }
    
    private func waitForEngine(timeout: TimeInterval = 30) async throws {
        let startTime = Date()
        
        while Date().timeIntervalSince(startTime) < timeout {
            do {
                _ = try await EngineClient.getStatus()
                return
            } catch {
                // Engine not ready yet
            }
            
            try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        }
        
        throw CLIError.engineNotReady
    }
}

enum CLIError: Error, LocalizedError {
    case engineNotReady
    case engineNotRunning
    
    var errorDescription: String? {
        switch self {
        case .engineNotReady:
            return "Engine did not become ready within timeout"
        case .engineNotRunning:
            return "Engine is not running"
        }
    }
}
