import Foundation
import Shared

public enum ResolverInstaller {
    public static func resolverFileContent(port: Int = AppConfig.Networking.dnsPort) -> String {
        """
        nameserver 127.0.0.1
        port \(port)
        """
    }

    public static func installInstruction(port: Int = AppConfig.Networking.dnsPort) -> String {
        let content = resolverFileContent(port: port)
        let domains = AppConfig.Networking.resolverDomainSuffixes
        return """
        To enable Flying Dutchman auto domains, run:

        sudo mkdir -p /etc/resolver
        \(domains
            .map { "echo \"\(content.replacingOccurrences(of: "\n", with: "\\n"))\" | sudo tee /etc/resolver/\($0)" }
            .joined(separator: "\n"))
        """
    }
}
