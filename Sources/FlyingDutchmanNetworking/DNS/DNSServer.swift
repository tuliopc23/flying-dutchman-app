import Foundation
import NIOCore
import NIOPosix
import DNSClient
import Logging
import Darwin

public actor DNSServer {
    private let group: EventLoopGroup
    private let port: Int
    private let host: String
    private var channel: Channel?
    private let routingTable: DomainRoutingTable
    private let logger = Logger(label: "com.flyingdutchman.dns")

    public init(host: String = "127.0.0.1", port: Int = 5353, routingTable: DomainRoutingTable, group: EventLoopGroup? = nil) {
        self.host = host
        self.port = port
        self.routingTable = routingTable
        self.group = group ?? MultiThreadedEventLoopGroup(numberOfThreads: 1)
    }

    public func start() async throws {
        let bootstrap = DatagramBootstrap(group: group)
            .channelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .channelInitializer { channel in
                channel.pipeline.addHandler(DNSHandler(routingTable: self.routingTable, logger: self.logger))
            }

        let channel = try await bootstrap.bind(host: host, port: port).get()
        self.channel = channel
        logger.info("DNS Server listening on \(host):\(port)")
    }
    
    public var boundPort: Int? {
        channel?.localAddress?.port
    }

    public func shutdown() async {
        try? await channel?.close()
        // If we created the group (implicit ownership assumption for simplicity in this context)
        // ideally we track if we own it.
    }
}

private final class DNSHandler: ChannelInboundHandler, Sendable {
    typealias InboundIn = AddressedEnvelope<ByteBuffer>
    typealias OutboundOut = AddressedEnvelope<ByteBuffer>

    let routingTable: DomainRoutingTable
    let logger: Logger

    init(routingTable: DomainRoutingTable, logger: Logger) {
        self.routingTable = routingTable
        self.logger = logger
    }

    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let envelope = unwrapInboundIn(data)
        let inboundData = envelope.data
        let remoteAddress = envelope.remoteAddress
        let allocator = context.channel.allocator
        let promise = context.eventLoop.makePromise(of: AddressedEnvelope<ByteBuffer>.self)
        
        promise.futureResult.whenSuccess { responseEnvelope in
            context.writeAndFlush(self.wrapOutboundOut(responseEnvelope), promise: nil)
        }
        
        promise.futureResult.whenFailure { error in
            self.logger.error("Failed to handle DNS request: \(error)")
        }
        
        do {
            let request = try DNSMessageDecoder.parse(inboundData)
            
            Task {
                var answers: [Record] = []
                
                for question in request.questions {
                    if question.type == .a {
                        let hostname = question.labels.string
                        if let ip = await self.routingTable.resolveIPv4(hostname: hostname) {
                            if let address = self.ipToUInt32(ip) {
                                let resource = ARecord(address: address)
                                let record = Record.a(ResourceRecord(
                                    domainName: question.labels,
                                    dataType: DNSResourceType.a.rawValue,
                                    dataClass: DataClass.internet.rawValue,
                                    ttl: 60,
                                    resource: resource
                                ))
                                answers.append(record)
                            }
                        }
                    }
                }
                
                let responseOptions: MessageOptions
                if answers.isEmpty {
                     responseOptions = [.answer, .authorativeAnswer, .resultCodeNameError]
                } else {
                     responseOptions = [.answer, .authorativeAnswer, .resultCodeSuccess]
                }

                let header = DNSMessageHeader(
                    id: request.header.id,
                    options: responseOptions,
                    questionCount: UInt16(request.questions.count),
                    answerCount: UInt16(answers.count),
                    authorityCount: 0,
                    additionalRecordCount: 0
                )
                
                let response = Message(
                    header: header,
                    questions: request.questions,
                    answers: answers,
                    authorities: [],
                    additionalData: []
                )
                
                do {
                    var labelIndices: [String: UInt16] = [:]
                    let responseBuffer = try DNSMessageEncoder.encodeMessage(
                        response,
                        allocator: allocator,
                        labelIndices: &labelIndices
                    )
                    
                    let responseEnvelope = AddressedEnvelope(remoteAddress: remoteAddress, data: responseBuffer)
                    promise.succeed(responseEnvelope)
                } catch {
                    promise.fail(error)
                }
            }
        } catch {
            logger.error("Failed to decode DNS message: \(error)")
        }
    }

    private func ipToUInt32(_ ip: String) -> UInt32? {
        var addr = in_addr()
        if inet_pton(AF_INET, ip, &addr) == 1 {
            return UInt32(bigEndian: addr.s_addr)
        }
        return nil
    }
}

// Helper extension if needed, but hoping DNSClient covers it.
// extension ARecord {
//    init?(_ string: String) { ... }
// }
