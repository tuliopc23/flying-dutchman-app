import Foundation
import ArgumentParser
import Shared

extension Containers {
    struct Run: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Run a container from an image"
        )
        
        @Argument(help: "Image reference (e.g. nginx:latest)")
        var image: String
        
        @Option(name: .shortAndLong, help: "Container name")
        var name: String?
        
        @Option(name: .shortAndLong, parsing: .upToNextOption, help: "Port mappings (e.g. 8080:80)")
        var publish: [String] = []
        
        @Option(name: .long, help: "Working directory")
        var workdir: String?
        
        @Option(name: .shortAndLong, parsing: .upToNextOption, help: "Environment variables (KEY=VALUE)")
        var env: [String] = []
        
        func run() async throws {
            let containerName = name ?? "container-\(UUID().uuidString.prefix(8))"
            
            // Parse port mappings
            var portMappings: [PortMapping] = []
            if !publish.isEmpty {
                do {
                    portMappings = try publish.map { try PortMapping.parse($0) }
                } catch {
                    CLIOutput.warn("Error", "Invalid port mapping: \(error.localizedDescription)")
                    throw ExitCode.validationFailure
                }
            }
            
            // Parse env vars
            let envDict = Dictionary(uniqueKeysWithValues: env.compactMap { spec -> (String, String)? in
                let parts = spec.split(separator: "=", maxSplits: 1)
                guard parts.count == 2 else { return nil }
                return (String(parts[0]), String(parts[1]))
            })
            
            // Create container
            let config = ContainerConfig(
                command: nil,
                env: envDict.isEmpty ? nil : envDict,
                ports: nil, // Legacy format not used here
                portMappings: portMappings.isEmpty ? nil : portMappings,
                volumes: nil,
                workingDir: workdir,
                cpuLimit: nil,
                memoryLimit: nil
            )
            
            CLIOutput.section("Creating Container")
            CLIOutput.line("Name", containerName)
            CLIOutput.line("Image", image)
            
            let client = EngineClient() // EngineClient is an enum with static methods, no instance needed
            
            do {
                let container = try await EngineClient.createContainer(name: containerName, image: image, config: config)
                CLIOutput.line("ID", container.id.uuidString)
                
                CLIOutput.section("Starting Container")
                let started = try await EngineClient.startContainer(id: container.id)
                CLIOutput.line("Status", started.status.rawValue)
                
                if !portMappings.isEmpty {
                    CLIOutput.section("Port Mappings")
                    for mapping in portMappings {
                        CLIOutput.line("Forward", "localhost:\(mapping.hostPort) → container:\(mapping.containerPort)")
                    }
                }
                
                CLIOutput.hint("Use 'fd logs \(containerName)' to view logs")
            } catch {
                CLIOutput.warn("Error", error.localizedDescription)
                throw ExitCode.failure
            }
        }
    }
}
