import ArgumentParser
import Foundation
import Shared

struct InstallResolver: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "install-resolver",
        abstract: "Install DNS resolver configuration for Flying Dutchman domains"
    )

    func run() async throws {
        let resolverDir = "/etc/resolver"
        let domains = AppConfig.Networking.resolverDomainSuffixes
        let resolverContent = """
        # Flying Dutchman DNS Resolver
        # Resolves *.flyingdutchman.local, *.k8s.flyingdutchman.local (and legacy *.fd.local) domains
        nameserver 127.0.0.1
        port \(AppConfig.Networking.dnsPort)

        """

        CLIOutput.section("Install DNS Resolver")
        CLIOutput.line("Targets", domains.map { "\(resolverDir)/\($0)" }.joined(separator: ", "))
        CLIOutput.line("Action", "Creating resolver configurations (requires sudo)")

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

            let tempFile = NSTemporaryDirectory() + "flyingdutchman.local.resolver"
            try resolverContent.write(toFile: tempFile, atomically: true, encoding: .utf8)

            for domain in domains {
                let resolverFile = "\(resolverDir)/\(domain)"
                let copyProcess = Process()
                copyProcess.executableURL = URL(fileURLWithPath: "/usr/bin/sudo")
                copyProcess.arguments = ["cp", tempFile, resolverFile]

                try copyProcess.run()
                copyProcess.waitUntilExit()

                guard copyProcess.terminationStatus == 0 else {
                    CLIOutput.warn("Failed", "Could not write resolver file for \(domain)")
                    throw ExitCode.failure
                }
            }

            try? FileManager.default.removeItem(atPath: tempFile)

            CLIOutput.line("Status", "✓ Resolver installed successfully")
            CLIOutput
                .hint("DNS queries for Flying Dutchman domains resolve via 127.0.0.1:\(AppConfig.Networking.dnsPort)")
            CLIOutput.hint("Test with: dig nginx.flyingdutchman.local")
        } catch {
            CLIOutput.warn("Error", error.localizedDescription)
            CLIOutput.hint("Ensure you have sudo privileges")
            throw ExitCode.failure
        }
    }
}
