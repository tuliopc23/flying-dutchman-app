import Foundation
import Logging
import Shared

/// Placeholder for Docker compatibility shim over Unix socket.
public enum DockerShimServer {
    public static let socketPath = "/var/run/flyingdutchman-docker.sock"

    public static func startStub(logger: Logger = Loggers.make(category: "flyingdutchman.dockershim")) {
        logger.info("Docker shim stub active at \(socketPath) (not implemented)")
    }
}
