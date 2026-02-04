import AsyncHTTPClient
import Foundation
import HTTPTypes
import Hummingbird
import HummingbirdTLS
import Logging
import NIOCore
import NIOHTTP1
import NIOSSL
import ServiceLifecycle
import Shared

public struct HTTPSProxy: Service {
    let host: String
    let port: Int
    let routingTable: DomainRoutingTable
    let ca: CertificateAuthority
    let logger = Loggers.make(category: "https.proxy")
    let httpClient: HTTPClient

    public init(
        host: String = "127.0.0.1",
        port: Int = AppConfig.Networking.httpsProxyPort,
        routingTable: DomainRoutingTable,
        ca: CertificateAuthority
    ) {
        self.host = host
        self.port = port
        self.routingTable = routingTable
        self.ca = ca
        self.httpClient = HTTPClient(eventLoopGroupProvider: .singleton)
    }

    public func run() async throws {
        // Generate wildcard cert for all supported domains
        let wildcards = AppConfig.Networking.allDomainSuffixes.map { "*.\($0)" }
        let (cert, key) = try ca.generateLeafCert(hostnames: wildcards)

        let tlsConfiguration = try TLSConfiguration.makeServerConfiguration(
            certificateChain: [.certificate(cert.toNIOSSL())],
            privateKey: .privateKey(key.toNIOSSL())
        )

        let router = Router()
        router.add(middleware: ProxyMiddleware(routingTable: routingTable, httpClient: httpClient, logger: logger))

        // Catch-all to ensure middleware runs if it didn't return
        router.get("**") { _, _ in
            Response(status: .notFound)
        }

        // Use .tls() wrapper if available, or .http2Upgrade if http1+tls is not directly exposed as static method
        // Assuming .tls wrapper exists for any server builder
        let app = try Application(
            router: router,
            server: .tls(.http1(), configuration: TLSChannelConfiguration(tlsConfiguration: tlsConfiguration)),
            configuration: .init(address: .hostname(host, port: port)),
            onServerRunning: { _ in
                self.logger.info("HTTPS Proxy started on \(self.host):\(self.port)")
            }
        )

        try await app.runService()
    }
}

struct ProxyMiddleware: RouterMiddleware {
    let routingTable: DomainRoutingTable
    let httpClient: HTTPClient
    let logger: Logger

    typealias Context = BasicRequestContext

    func handle(
        _ request: Request,
        context: Context,
        next: (Request, Context) async throws -> Response
    ) async throws -> Response {
        // Try Host header
        let hostname: String
        if let hostHeader = request.headers[HTTPField.Name("Host")!] {
            hostname = hostHeader.split(separator: ":")[0].description
        } else {
            return try await next(request, context)
        }

        // Only proxy supported domains
        let isSupported = AppConfig.Networking.allDomainSuffixes.contains { suffix in
            hostname.hasSuffix(".\(suffix)")
        }
        guard isSupported else {
            return try await next(request, context)
        }

        guard let upstream = await routingTable.resolveUpstream(hostname: hostname) else {
            logger.warning("No upstream found for \(hostname)")
            throw HTTPError(.notFound)
        }

        // Construct upstream URL
        var components = URLComponents()
        components.scheme = upstream.scheme
        components.host = upstream.host
        components.port = upstream.port
        components.path = request.uri.path
        components.query = request.uri.query

        guard let url = components.string else {
            throw HTTPError(.badRequest)
        }

        var clientRequest = HTTPClientRequest(url: url)
        clientRequest.method = NIOHTTP1.HTTPMethod(rawValue: request.method.rawValue)

        for field in request.headers {
            clientRequest.headers.add(name: field.name.rawName, value: field.value)
        }

        // Forward body
        clientRequest.body = .stream(request.body, length: .unknown)

        do {
            let response = try await httpClient.execute(clientRequest, timeout: .seconds(30))

            // Convert Response Status
            let status = HTTPResponse.Status(
                code: Int(response.status.code),
                reasonPhrase: response.status.reasonPhrase
            )

            // Convert Response Headers
            var headers = HTTPFields()
            for (name, value) in response.headers {
                if let fieldName = HTTPField.Name(name) {
                    headers[fieldName] = value
                }
            }

            // Convert Body
            let body = ResponseBody(asyncSequence: response.body)

            return Response(
                status: status,
                headers: headers,
                body: body
            )
        } catch {
            logger.error("Proxy error: \(error)")
            throw HTTPError(.badGateway)
        }
    }
}
