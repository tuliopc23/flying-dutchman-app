import Dependencies
import Foundation

public struct TerminalLauncher: Sendable {
    public var openTerminal: @Sendable (_ command: String) async throws -> Void

    public init(openTerminal: @escaping @Sendable (_ command: String) async throws -> Void) {
        self.openTerminal = openTerminal
    }

    public static let live = TerminalLauncher { command in
        try await Task.detached(priority: .utility) {
            let app = TerminalApp.preferred
            try app.open(command: command)
        }.value
    }
}

public enum TerminalLauncherKey: DependencyKey {
    public static let liveValue = TerminalLauncher.live
    public static let testValue = TerminalLauncher { _ in }
}

public extension DependencyValues {
    var terminalLauncher: TerminalLauncher {
        get { self[TerminalLauncherKey.self] }
        set { self[TerminalLauncherKey.self] = newValue }
    }
}

private enum TerminalApp {
    case ghostty
    case terminal
    case iTerm
    case wezTerm
    case kitty

    static var preferred: TerminalApp {
        if let env = ProcessInfo.processInfo.environment["FD_TERMINAL"]?.lowercased() {
            switch env {
            case "ghostty":
                return .ghostty
            case "iterm", "iterm2":
                return .iTerm
            case "wezterm":
                return .wezTerm
            case "kitty":
                return .kitty
            case "terminal":
                return .terminal
            default: break
            }
        }
        for app in preferredOrder {
            if app.isInstalled {
                return app
            }
        }
        return .terminal
    }

    private static let preferredOrder: [TerminalApp] = [
        .ghostty,
        .iTerm,
        .wezTerm,
        .kitty,
        .terminal,
    ]

    private var appName: String {
        switch self {
        case .ghostty:
            "Ghostty"
        case .iTerm:
            "iTerm"
        case .wezTerm:
            "WezTerm"
        case .kitty:
            "kitty"
        case .terminal:
            "Terminal"
        }
    }

    private var appPaths: [String] {
        let homeApps = "\(NSHomeDirectory())/Applications"
        switch self {
        case .ghostty:
            return [
                "/Applications/Ghostty.app",
                "\(homeApps)/Ghostty.app",
            ]
        case .iTerm:
            return [
                "/Applications/iTerm.app",
                "/Applications/iTerm2.app",
                "\(homeApps)/iTerm.app",
                "\(homeApps)/iTerm2.app",
            ]
        case .wezTerm:
            return [
                "/Applications/WezTerm.app",
                "\(homeApps)/WezTerm.app",
            ]
        case .kitty:
            return [
                "/Applications/kitty.app",
                "\(homeApps)/kitty.app",
            ]
        case .terminal:
            return [
                "/Applications/Utilities/Terminal.app",
            ]
        }
    }

    private var isInstalled: Bool {
        appPaths.contains { FileManager.default.fileExists(atPath: $0) }
    }

    func open(command: String) throws {
        if let script = appleScript(for: command) {
            do {
                try runAppleScript(script)
                return
            } catch {
                if supportsClipboardFallback {
                    try openAppAndCopy(command)
                    return
                }
                throw error
            }
        }
        try openAppAndCopy(command)
    }

    private var supportsClipboardFallback: Bool {
        switch self {
        case .terminal:
            false
        case .iTerm:
            true
        case .ghostty, .wezTerm, .kitty:
            true
        }
    }

    private func appleScript(for command: String) -> String? {
        let escaped = escape(command)
        switch self {
        case .terminal:
            return "tell application \"Terminal\"\nactivate\ndo script \"\(escaped)\"\nend tell"
        case .iTerm:
            return "tell application \"iTerm\"\nactivate\ncreate window with default profile\ntell current session of current window\nwrite text \"\(escaped)\"\nend tell\nend tell"
        case .ghostty, .wezTerm, .kitty:
            return nil
        }
    }

    private func openAppAndCopy(_ command: String) throws {
        let appArgument = appPaths.first { FileManager.default.fileExists(atPath: $0) } ?? appName
        try runOpen(appArgument)
        try? copyToClipboard(command)
    }

    private func escape(_ value: String) -> String {
        value
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"", with: "\\\"")
    }
}

private func runAppleScript(_ script: String) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
    process.arguments = ["-e", script]

    let stderr = Pipe()
    process.standardError = stderr

    try process.run()
    process.waitUntilExit()

    guard process.terminationStatus == 0 else {
        let data = stderr.fileHandleForReading.readDataToEndOfFile()
        let message = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
        throw NSError(domain: "TerminalLauncher", code: Int(process.terminationStatus), userInfo: [
            NSLocalizedDescriptionKey: message.isEmpty ? "Failed to open terminal" : message,
        ])
    }
}

private func runOpen(_ app: String) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/open")
    process.arguments = ["-a", app]

    let stderr = Pipe()
    process.standardError = stderr

    try process.run()
    process.waitUntilExit()

    guard process.terminationStatus == 0 else {
        let data = stderr.fileHandleForReading.readDataToEndOfFile()
        let message = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
        throw NSError(domain: "TerminalLauncher", code: Int(process.terminationStatus), userInfo: [
            NSLocalizedDescriptionKey: message.isEmpty ? "Failed to open terminal app" : message,
        ])
    }
}

private func copyToClipboard(_ value: String) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/pbcopy")

    let input = Pipe()
    process.standardInput = input

    try process.run()
    if let data = value.data(using: .utf8) {
        input.fileHandleForWriting.write(data)
    }
    input.fileHandleForWriting.closeFile()
    process.waitUntilExit()

    guard process.terminationStatus == 0 else {
        throw NSError(domain: "TerminalLauncher", code: Int(process.terminationStatus), userInfo: [
            NSLocalizedDescriptionKey: "Failed to copy command to clipboard",
        ])
    }
}
