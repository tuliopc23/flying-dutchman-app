import ContainersInterface
import DiagnosticsInterface
import ImagesInterface
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

    public init(
        containers: ContainersFeature,
        images: ImagesFeature,
        volumes: VolumesFeature,
        networks: NetworksFeature,
        diagnostics: DiagnosticsFeature,
        stacks: StacksFeature
    ) {
        self.containers = containers
        self.images = images
        self.volumes = volumes
        self.networks = networks
        self.diagnostics = diagnostics
        self.stacks = stacks
    }
}
