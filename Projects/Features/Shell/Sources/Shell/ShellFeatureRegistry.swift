import ContainersInterface
import DebugShellInterface
import DiagnosticsInterface
import ImagesInterface
import KubernetesInterface
import MachinesInterface
import NetworksInterface
import StacksInterface
import VolumesInterface

public struct ShellFeatureRegistry {
    public let containers: ContainersFeature
    public let images: ImagesFeature
    public let volumes: VolumesFeature
    public let networks: NetworksFeature
    public let diagnostics: DiagnosticsFeature
    public let stacks: StacksFeature
    public let machines: MachinesFeature
    public let kubernetes: KubernetesFeature
    public let debugShell: DebugShellFeature

    public init(
        containers: ContainersFeature,
        images: ImagesFeature,
        volumes: VolumesFeature,
        networks: NetworksFeature,
        diagnostics: DiagnosticsFeature,
        stacks: StacksFeature,
        machines: MachinesFeature,
        kubernetes: KubernetesFeature,
        debugShell: DebugShellFeature
    ) {
        self.containers = containers
        self.images = images
        self.volumes = volumes
        self.networks = networks
        self.diagnostics = diagnostics
        self.stacks = stacks
        self.machines = machines
        self.kubernetes = kubernetes
        self.debugShell = debugShell
    }
}
