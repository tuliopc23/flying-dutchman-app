import ArgumentParser
import Shared

@main
struct FlyingDutchmanCLI: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "flyingdutchman",
        abstract: "Flying Dutchman CLI (foundation stub)",
        version: AppConfig.version,
        subcommands: [
            Start.self,
            Stop.self,
            Version.self,
            Doctor.self,
            Containers.self,
            Images.self,
            Stacks.self,
            Volumes.self,
            Networks.self,
            Networking.self,
            Machines.self,
            Kubernetes.self,
            Events.self,
            Config.self,
            Completion.self,
            Login.self,
            Logout.self,
            TrustCA.self,
            Shell.self,
        ]
    )
}
