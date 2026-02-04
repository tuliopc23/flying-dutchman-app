import ArgumentParser
import FlyingDutchmanNetworking
import Foundation
import Shared

struct Machines: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Manage Linux machines",
        subcommands: [
            List.self,
            Create.self,
            Start.self,
            Stop.self,
            Restart.self,
            Delete.self,
            SSH.self,
            Exec.self,
        ],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List all machines")

        func run() async throws {
            let machines = try await EngineClient.listMachines()

            if machines.isEmpty {
                print("No machines found")
                CLIOutput.hint("Create a machine with: fd machines create <name>")
                return
            }

            CLIOutput.section("Machines")
            for machine in machines {
                let statusIcon = machine.status == MachineStatus.running ? "●" : "○"
                CLIOutput.line(
                    "\(statusIcon) \(machine.name)",
                    "\(machine.distro):\(machine.version) (\(machine.status.rawValue))"
                )
            }
        }
    }

    struct Create: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Create a new machine")

        @Argument(help: "Machine name")
        var name: String

        @Option(name: .shortAndLong, help: "Distribution (ubuntu, debian, fedora, alpine, arch)")
        var distro: String = "ubuntu"

        @Option(name: .shortAndLong, help: "Distribution version")
        var version: String = "24.04"

        @Option(help: "CPU count")
        var cpu: Int = 2

        @Option(help: "Memory in GB")
        var memory: Int = 2

        @Option(help: "Disk size in GB")
        var disk: Int = 20

        @Option(name: .customLong("cloud-init"), help: "Cloud-init user data file")
        var cloudInitFile: String?

        func run() async throws {
            CLIOutput.section("Create Machine")
            CLIOutput.line("Name", name)
            CLIOutput.line("Distribution", "\(distro):\(version)")
            CLIOutput.line("Resources", "\(cpu) CPU, \(memory)GB RAM, \(disk)GB disk")

            var cloudInitData: String?
            if let file = cloudInitFile {
                cloudInitData = try String(contentsOfFile: file, encoding: .utf8)
                CLIOutput.line("Cloud-init", file)
            }

            let config = MachineConfig(
                distro: distro,
                version: version,
                cpuCount: cpu,
                memoryGB: memory,
                diskGB: disk,
                cloudInitData: cloudInitData
            )

            let machine = try await EngineClient.createMachine(name: name, config: config)

            CLIOutput.line("Status", "✓ Machine created successfully")
            CLIOutput.line("ID", machine.id)
            CLIOutput.hint("Start the machine with: fd machines start \(name)")
        }
    }

    struct Start: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Start a machine")

        @Argument(help: "Machine name or ID")
        var machine: String

        func run() async throws {
            CLIOutput.section("Start Machine")
            CLIOutput.line("Machine", machine)

            let updated = try await EngineClient.startMachine(nameOrID: machine)

            CLIOutput.line("Status", "✓ Machine started")
            if let ip = updated.ipAddress {
                CLIOutput.line("IP Address", ip)
            }
            if let port = updated.sshPort {
                CLIOutput.line("SSH", "ssh -p \(port) root@localhost")
            }
        }
    }

    struct Stop: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Stop a machine")

        @Argument(help: "Machine name or ID")
        var machine: String

        func run() async throws {
            CLIOutput.section("Stop Machine")
            CLIOutput.line("Machine", machine)

            _ = try await EngineClient.stopMachine(nameOrID: machine)

            CLIOutput.line("Status", "✓ Machine stopped")
        }
    }

    struct Restart: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Restart a machine")

        @Argument(help: "Machine name or ID")
        var machine: String

        func run() async throws {
            CLIOutput.section("Restart Machine")
            CLIOutput.line("Machine", machine)

            _ = try await EngineClient.restartMachine(nameOrID: machine)

            CLIOutput.line("Status", "✓ Machine restarted")
        }
    }

    struct Delete: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Delete a machine")

        @Argument(help: "Machine name or ID")
        var machine: String

        @Flag(name: .shortAndLong, help: "Force deletion without confirmation")
        var force: Bool = false

        func run() async throws {
            if !force {
                CLIOutput.warn("Warning", "This will permanently delete the machine and all its data")
                print("Continue? (y/N): ", terminator: "")
                guard let response = readLine(), response.lowercased() == "y" else {
                    CLIOutput.line("Cancelled", "Machine not deleted")
                    return
                }
            }

            CLIOutput.section("Delete Machine")
            CLIOutput.line("Machine", machine)

            try await EngineClient.deleteMachine(nameOrID: machine)

            CLIOutput.line("Status", "✓ Machine deleted")
        }
    }

    struct SSH: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "SSH into a machine")

        @Argument(help: "Machine name or ID")
        var machine: String

        func run() async throws {
            let machines = try await EngineClient.listMachines()

            guard let target = machines.first(where: { $0.name == machine || $0.id == machine }) else {
                CLIOutput.warn("Error", "Machine not found: \(machine)")
                throw ExitCode.failure
            }

            guard target.status == MachineStatus.running else {
                CLIOutput.warn("Error", "Machine is not running")
                CLIOutput.hint("Start it with: fd machines start \(machine)")
                throw ExitCode.failure
            }

            guard let port = target.sshPort else {
                CLIOutput.warn("Error", "SSH port not available")
                throw ExitCode.failure
            }

            let process = Process()
            process.executableURL = URL(fileURLWithPath: "/usr/bin/ssh")
            process.arguments = ["-p", "\(port)", "root@localhost"]

            try process.run()
            process.waitUntilExit()
        }
    }

    struct Exec: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Execute a command in a machine")

        @Argument(help: "Machine name or ID")
        var machine: String

        @Argument(help: "Command to execute")
        var command: [String]

        func run() async throws {
            let commandString = command.joined(separator: " ")
            let output = try await EngineClient.executeMachineCommand(nameOrID: machine, command: commandString)

            print(output)
        }
    }
}
