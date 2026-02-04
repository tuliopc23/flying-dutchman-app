import Foundation
import ArgumentParser
import Shared
import FlyingDutchmanNetworking

struct Stop: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Stop the Flying Dutchman engine"
    )
    
    @Flag(name: .shortAndLong, help: "Force stop without graceful shutdown")
    var force: Bool = false
    
    func run() async throws {
        CLIOutput.section("Stop Flying Dutchman")
        
        // Check if engine is running
        do {
            _ = try await EngineClient.getStatus()
        } catch {
            CLIOutput.line("Status", "Engine not running")
            return
        }
        
        if force {
            CLIOutput.line("Mode", "Force stop")
            try forceStop()
        } else {
            CLIOutput.line("Mode", "Graceful shutdown")
            try await gracefulStop()
        }
        
        CLIOutput.line("Status", "✓ Engine stopped")
    }
    
    private func gracefulStop() async throws {
        // Send shutdown signal to engine
        // For now, we'll use process termination
        // In production, this would call an API endpoint
        
        if let pid = findEnginePID() {
            let process = Process()
            process.executableURL = URL(fileURLWithPath: "/bin/kill")
            process.arguments = ["-TERM", "\(pid)"]
            try process.run()
            process.waitUntilExit()
            
            // Wait for graceful shutdown
            try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
        }
    }
    
    private func forceStop() throws {
        if let pid = findEnginePID() {
            let process = Process()
            process.executableURL = URL(fileURLWithPath: "/bin/kill")
            process.arguments = ["-KILL", "\(pid)"]
            try process.run()
            process.waitUntilExit()
        }
    }
    
    private func findEnginePID() -> Int? {
        // Find engine process
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/pgrep")
        process.arguments = ["-f", "FlyingDutchmanEngine"]
        
        let pipe = Pipe()
        process.standardOutput = pipe
        
        try? process.run()
        process.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
              let pid = Int(output) else {
            return nil
        }
        
        return pid
    }
}
