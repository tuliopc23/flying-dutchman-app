import ArgumentParser
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Foundation
import Shared

struct Images: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Image operations",
        subcommands: [List.self, Pull.self, Build.self],
        defaultSubcommand: List.self
    )

    struct List: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "List images (stubbed if engine offline)")
        @Flag(help: "Output as JSON")
        var json: Bool = false
        func run() async throws {
            do {
                let images = try await EngineClient.listImages()
                if json {
                    CLIOutput.json(images)
                } else {
                    CLIOutput.section("Images")
                    CLIOutput.table(headers: ["Name", "Tag", "Digest", "Size"], rows: images.map { img in
                        [
                            img.name,
                            img.tag,
                            img.digest ?? "—",
                            img.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—",
                        ]
                    })
                }
            } catch {
                CLIOutput.warn("Images", "Unreachable. Showing mock data.")
                let fallback = SeedData.sampleImages
                if json {
                    CLIOutput.json(fallback)
                } else {
                    CLIOutput.table(headers: ["Name", "Tag", "Digest", "Size"], rows: fallback.map { img in
                        [
                            img.name,
                            img.tag,
                            img.digest ?? "—",
                            img.sizeBytes.map { "\($0 / 1_000_000)MB" } ?? "—",
                        ]
                    })
                }
            }
        }
    }

    struct Pull: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Pull an image reference")

        @Argument(help: "Image reference, e.g., ghcr.io/fd/api:dev")
        var reference: String

        func run() async throws {
            do {
                let message = try await EngineClient.pullImage(reference: reference)
                CLIOutput.line("Pull", message)
            } catch {
                CLIOutput.warn("Pull", "Failed to pull image: \(error.localizedDescription)")
            }
        }
    }

    struct Build: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Build an image from a local context")

        @Argument(help: "Build context directory")
        var context: String

        @Option(name: [.short, .long], help: "Tag to apply (repeatable)")
        var tag: [String] = []

        @Option(name: [.customLong("file")], help: "Path to Dockerfile")
        var dockerfile: String?

        @Option(name: .long, parsing: .upToNextOption, help: "Target platforms, e.g. linux/amd64 linux/arm64")
        var platform: [String] = []

        @Option(name: .long, parsing: .unconditionalSingleValue, help: "Build argument in KEY=VALUE form")
        var buildArg: [String] = []

        func run() async throws {
            let tags = tag.isEmpty ? [defaultTag] : tag
            let buildArgumentPairs: [(String, String)] = buildArg.compactMap { item in
                let pieces = item.split(separator: "=", maxSplits: 1).map(String.init)
                guard pieces.count == 2 else { return nil }
                return (pieces[0], pieces[1])
            }
            let buildArguments = Dictionary(uniqueKeysWithValues: buildArgumentPairs)

            let request = ImageBuildRequest(
                contextPath: context,
                dockerfilePath: dockerfile,
                tags: tags,
                platforms: platform,
                buildArguments: buildArguments
            )

            do {
                let result = try await EngineClient.buildImage(request)
                CLIOutput.line("Build", "Built \(result.image.displayName) via \(result.builder)")
                for line in result.logs.suffix(10) {
                    CLIOutput.line("", line)
                }
            } catch {
                CLIOutput.warn("Build", "Failed to build image: \(error.localizedDescription)")
            }
        }

        private var defaultTag: String {
            let base = URL(fileURLWithPath: context).lastPathComponent
            return base.isEmpty ? "flyingdutchman/local:latest" : "\(base):latest"
        }
    }
}
