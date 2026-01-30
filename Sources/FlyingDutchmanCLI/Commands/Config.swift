import Foundation
import ArgumentParser
import Shared

struct Config: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Manage Flying Dutchman configuration",
        subcommands: [Get.self, Set.self, List.self, Reset.self],
        defaultSubcommand: List.self
    )
    
    struct Get: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Get a configuration value")
        
        @Argument(help: "Configuration key")
        var key: String
        
        func run() throws {
            let config = try ConfigManager.shared.load()
            
            if let value = config.get(key: key) {
                print(value)
            } else {
                CLIOutput.warn("Error", "Configuration key not found: \(key)")
                throw ExitCode.failure
            }
        }
    }
    
    struct Set: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Set a configuration value")
        
        @Argument(help: "Configuration key")
        var key: String
        
        @Argument(help: "Configuration value")
        var value: String
        
        func run() throws {
            var config = try ConfigManager.shared.load()
            config.set(key: key, value: value)
            try ConfigManager.shared.save(config)
            
            CLIOutput.line("Set", "\(key) = \(value)")
        }
    }
    
    struct List: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List all configuration")
        
        func run() throws {
            let config = try ConfigManager.shared.load()
            
            CLIOutput.section("Configuration")
            for (key, value) in config.all() {
                CLIOutput.line(key, value)
            }
        }
    }
    
    struct Reset: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Reset configuration to defaults")
        
        @Flag(name: .shortAndLong, help: "Force reset without confirmation")
        var force: Bool = false
        
        func run() throws {
            if !force {
                print("This will reset all configuration to defaults. Continue? (y/N): ", terminator: "")
                guard let response = readLine(), response.lowercased() == "y" else {
                    CLIOutput.line("Cancelled", "Configuration not reset")
                    return
                }
            }
            
            try ConfigManager.shared.reset()
            CLIOutput.line("Status", "✓ Configuration reset to defaults")
        }
    }
}

// Simple configuration manager
final class ConfigManager {
    nonisolated(unsafe) static let shared = ConfigManager()
    
    private let configPath: URL
    
    private init() {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        let configDir = homeDir.appendingPathComponent(".config/flyingdutchman")
        try? FileManager.default.createDirectory(at: configDir, withIntermediateDirectories: true)
        self.configPath = configDir.appendingPathComponent("config.json")
    }
    
    func load() throws -> UserConfig {
        guard FileManager.default.fileExists(atPath: configPath.path) else {
            return UserConfig.default
        }
        
        let data = try Data(contentsOf: configPath)
        return try JSONDecoder().decode(UserConfig.self, from: data)
    }
    
    func save(_ config: UserConfig) throws {
        let data = try JSONEncoder().encode(config)
        try data.write(to: configPath)
    }
    
    func reset() throws {
        try save(UserConfig.default)
    }
}

struct UserConfig: Codable {
    var settings: [String: String]
    
    static let `default` = UserConfig(settings: [
        "engine.host": "127.0.0.1",
        "engine.port": "8080",
        "log.level": "info",
        "containers.autostart": "false"
    ])
    
    func get(key: String) -> String? {
        settings[key]
    }
    
    mutating func set(key: String, value: String) {
        settings[key] = value
    }
    
    func all() -> [String: String] {
        settings
    }
}
