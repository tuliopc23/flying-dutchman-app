import ArgumentParser
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared

struct Stacks: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Stack operations",
        subcommands: [List.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List stacks (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let stacks = try await EngineClient.listStacks()
                if json {
                    CLIOutput.json(stacks)
                } else {
                    CLIOutput.section("Stacks")
                    CLIOutput.table(headers: ["Name", "Description", "Containers"], rows: stacks.map { stack in
                        [
                            stack.name,
                            stack.description ?? "—",
                            stack.containerNames.isEmpty ? "—" : stack.containerNames.joined(separator: ", "),
                        ]
                    })
                }
            } catch {
                CLIOutput.warn("Stacks", "Unreachable. Showing mock data.")
                let fallback = SeedData.sampleStacks
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(headers: ["Name", "Description", "Containers"], rows: fallback.map { stack in
                        [
                            stack.name,
                            stack.description ?? "—",
                            stack.containerNames.isEmpty ? "—" : stack.containerNames.joined(separator: ", "),
                        ]
                    })
                }
            }
        }
    }
}
