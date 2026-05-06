import ArgumentParser
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared

struct Volumes: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Volume operations",
        subcommands: [List.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List volumes (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let volumes = try await EngineClient.listVolumes()
                if json {
                    CLIOutput.json(volumes)
                } else {
                    CLIOutput.section("Volumes")
                    CLIOutput.table(
                        headers: ["Name", "Mount", "Size"],
                        rows: volumes.map { volume in
                            let size = volume.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—"
                            return [volume.name, volume.mountPath, size]
                        }
                    )
                }
            } catch {
                CLIOutput.warn("Volumes", "Unreachable. Showing mock data.")
                let fallback = SeedData.sampleVolumes
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(
                        headers: ["Name", "Mount", "Size"],
                        rows: fallback.map { volume in
                            let size = volume.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—"
                            return [volume.name, volume.mountPath, size]
                        }
                    )
                }
            }
        }
    }
}
