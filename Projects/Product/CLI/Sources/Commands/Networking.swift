import ArgumentParser

struct Networking: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Networking operations",
        subcommands: [InstallResolver.self, UninstallResolver.self]
    )
}
