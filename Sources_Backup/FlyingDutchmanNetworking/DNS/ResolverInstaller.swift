import Foundation

public enum ResolverInstaller {
    public static func resolverFileContent(port: Int) -> String {
        """
        nameserver 127.0.0.1
        port \(port)
        """
    }

    public static func installInstruction(port: Int = 5353) -> String {
        let content = resolverFileContent(port: port)
        return """
        To enable .fd.local resolution, run:

        sudo mkdir -p /etc/resolver
        echo "\(content.replacingOccurrences(of: "\n", with: "\\n"))" | sudo tee /etc/resolver/fd.local
        """
    }
}
