import ArgumentParser
import Shared

struct Version: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Show version")
    func run() throws {
        CLIOutput.section("Flying Dutchman")
        CLIOutput.line("Version", AppConfig.version)
    }
}
