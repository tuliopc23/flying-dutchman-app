import Foundation
import NIOCore
import NIOTransportServices
import Logging
import Network

public final class VSOCKConnector: Sendable {
    private let group: NIOTSEventLoopGroup
    private let logger = Logger(label: "flyingdutchman.vsock")

    public init(group: NIOTSEventLoopGroup) {
        self.group = group
    }

    /// Connects to a guest VM via VSOCK using Apple's Network.framework bridge
    public func connect(cid: UInt32, port: UInt32) async throws -> Channel {
        let bootstrap = NIOTSConnectionBootstrap(group: group)
            .channelOption(NIOTSChannelOptions.waitForActivity, value: true)
            .channelInitializer { channel in
                // Add our framing codec to the pipeline
                channel.pipeline.addHandler(ControlPlaneCodec())
            }
            
        // Construct the VSOCK endpoint
        let endpoint = try NWEndpoint.vsock(cid: cid, port: port)
        
        logger.info("Connecting VSOCK to CID: \(cid) Port: \(port)")
        return try await bootstrap.connect(endpoint: endpoint).get()
    }
}

// Helper for macOS 26+ VSOCK addressing
extension NWEndpoint {
    static func vsock(cid: UInt32, port: UInt32) throws -> NWEndpoint {
        // Format: cid.vsock:port (Standard convention for macOS Virtio bridging)
        return .hostPort(host: .init("\(cid).vsock"), port: .init(integerLiteral: UInt16(port)))
    }
}
