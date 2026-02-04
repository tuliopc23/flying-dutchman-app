import Foundation
import ArgumentParser
import Shared

struct InstallResolver: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "install-resolver",
        abstract: "Install DNS resolver configuration for .fd.local domains"
    )
    
    func run() async throws {
        let resolverDir = "/etc/resolver"
        let resolverFile = "\(resolverDir)/fd.local"
        let resolverContent = """
        # Flying Dutchman DNS Resolver
        # Resolves *.fd.local domains to the local DNS server
        nameserver 127.0.0.1
        port 5353
        
        """
        
        CLIOutput.section("Install DNS Resolver")
        CLIOutput.line("Target", resolverFile)
        CLIOutput.line("Action", "Creating resolver configuration (requires sudo)")
        
        let createDirProcess = Process()
        createDirProcess.executableURL = URL(fileURLWithPath: "/usr/bin/sudo")
        createDirProcess.arguments = ["mkdir", "-p", resolverDir]
        
        do {
            try createDirProcess.run()
            createDirProcess.waitUntilExit()
            
            guard createDirProcess.terminationStatus == 0 else {
                CLIOutput.warn("Failed", "Could not create \(resolverDir) directory")
                throw ExitCode.failure
            }
            
            let tempFile = NSTemporaryDirectory() + "fd.local.resolver"
            try resolverContent.write(toFile: tempFile, atomically: true, encoding: .utf8)
            
            let copyProcess = Process()
            copyProcess.executableURL = URL(fileURLWithPath: "/usr/bin/sudo")
            copyProcess.arguments = ["cp", tempFile, resolverFile]
            
            try copyProcess.run()
            copyProcess.waitUntilExit()
            
            try? FileManager.default.removeItem(atPath: tempFile)
            
            if copyProcess.terminationStatus == 0 {
                CLIOutput.line("Status", "✓ Resolver installed successfully")
                CLIOutput.hint("DNS queries for *.fd.local will now resolve via 127.0.0.1:5353")
                CLIOutput.hint("Test with: dig nginx.fd.local")
            } else {
                CLIOutput.warn("Failed", "Could not write resolver file")
                throw ExitCode.failure
            }
        } catch {
            CLIOutput.warn("Error", error.localizedDescription)
            CLIOutput.hint("Ensure you have sudo privileges")
            throw ExitCode.failure
        }
    }
}
