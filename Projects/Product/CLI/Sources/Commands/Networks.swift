import ArgumentParser
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared

struct Networks: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Network operations",
        subcommands: [List.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List networks (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let networks = try await EngineClient.listNetworks()
                if json {
                    CLIOutput.json(networks)
                } else {
                    CLIOutput.section("Networks")
                    CLIOutput.table(
                        headers: ["Name", "Subnet", "Containers"],
                        rows: networks.map { network in
                            let count = network.connectedContainerIDs.count
                            return [network.name, network.subnet ?? "—", count == 0 ? "—" : "\(count)"]
                        }
                    )
                }
            } catch {
                CLIOutput.warn("Networks", "Unreachable. Showing mock data.")
                let fallback = SeedData.sampleNetworks
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(
                        headers: ["Name", "Subnet", "Containers"],
                        rows: fallback.map { network in
                            [
                                network.name,
                                network.subnet ?? "—",
                                network.connectedContainerIDs.isEmpty ? "—" : "\(network.connectedContainerIDs.count)",
                            ]
                        }
                    )
                }
            }
        }
    }
}
