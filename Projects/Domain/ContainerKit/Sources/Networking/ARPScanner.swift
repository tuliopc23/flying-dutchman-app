import Foundation
import Shared

public struct ARPScanner: Sendable {
    public init() {}

    /// Scans the local ARP table for a MAC address and returns the associated IP address.
    /// - Parameter macAddress: The MAC address to look for (e.g., "52:54:00:12:34:56")
    /// - Returns: The IPv4 address as a string, or nil if not found.
    public func scan(forMAC macAddress: String) async throws -> String? {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/sbin/arp")
        process.arguments = ["-an"]

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8) else { return nil }

        // Normalize MAC address for comparison
        // arp output usually has single digits for MAC bytes sometimes? No, standard is 52:54:00...
        // But let's handle case insensitivity
        let targetMAC = macAddress.lowercased()

        // Output format example:
        // ? (192.168.64.2) at 52:54:00:12:34:56 on bridge100 ifscope [ethernet]

        for line in output.components(separatedBy: .newlines) {
            let normalizedLine = line.lowercased()
            if normalizedLine.contains(targetMAC) {
                // Extract IP from parenthesis
                if let start = line.firstIndex(of: "("),
                   let end = line.firstIndex(of: ")"),
                   start < end {
                    let ipRange = line.index(after: start) ..< end
                    return String(line[ipRange])
                }
            }
        }

        return nil
    }
}
