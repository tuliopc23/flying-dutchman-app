import ArgumentParser
import FlyingDutchmanNetworking
import Shared

struct Doctor: AsyncParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Show diagnostics")
    @Flag(help: "Output as JSON")
    var json: Bool = false
    func run() async throws {
        let report = await DoctorReport.fetch()
        if json {
            CLIOutput.json(report)
        } else {
            CLIOutput.section("Platform")
            if report.platform.isSupported {
                CLIOutput.line("Compatibility", report.platform.message)
            } else {
                CLIOutput.warn("Compatibility", report.platform.message)
            }
            if report.containerization.status == "ok" {
                CLIOutput.line(
                    "Containerization",
                    "\(report.containerization.status) – \(report.containerization.message)"
                )
            } else {
                CLIOutput.warn(
                    "Containerization",
                    "\(report.containerization.status) – \(report.containerization.message)"
                )
            }
            CLIOutput.line("container CLI", "\(report.containerTool.status) – \(report.containerTool.message)")

            CLIOutput.section("Engine")
            if let health = report.http {
                CLIOutput.line("HTTP", "\(health.status) – engine: \(health.engine)")
            } else if let error = report.httpError {
                CLIOutput.warn("HTTP", error)
                CLIOutput.hint("Start FlyingDutchmanEngine, then rerun 'flyingdutchman doctor'.")
            }

            if let detail = report.detail {
                CLIOutput.line("Uptime", "\(detail.uptimeSeconds)s")
                CLIOutput.line(
                    "Workers",
                    detail.workers.isEmpty ? "unknown" : detail.workers.map { "\($0.key)=\($0.value)" }
                        .joined(separator: ", ")
                )
                if let mode = detail.mode {
                    CLIOutput.line("Runtime", "containerization=\(mode)")
                }
            }

            if let xpc = report.xpc {
                CLIOutput.line("XPC", xpc.engine)
            } else if let error = report.xpcError {
                CLIOutput.warn("XPC", error)
            }

            CLIOutput.section("Networking")
            if report.resolver.status == "ok" {
                CLIOutput.line("DNS Resolver", "\(report.resolver.status) – \(report.resolver.message)")
            } else {
                CLIOutput.warn("DNS Resolver", "\(report.resolver.status) – \(report.resolver.message)")
            }

            if report.caCertificate.status == "ok" {
                CLIOutput.line("Root CA", "\(report.caCertificate.status) – \(report.caCertificate.message)")
            } else {
                CLIOutput.warn("Root CA", "\(report.caCertificate.status) – \(report.caCertificate.message)")
            }

            if !report.platform.isSupported {
                CLIOutput.hint("Run on macOS 15+ Apple Silicon to match Tahoe requirements.")
            }
        }
    }
}

private struct DoctorReport: Encodable {
    let platform: RuntimeChecks.PlatformStatus
    let containerTool: RuntimeChecks.ToolCheck
    let containerization: RuntimeChecks.ToolCheck
    let resolver: RuntimeChecks.ToolCheck
    let caCertificate: RuntimeChecks.ToolCheck
    let http: EngineStatus?
    let detail: EngineStatusDetail?
    let xpc: EngineXPCStatus?
    let httpError: String?
    let xpcError: String?

    func encode(to encoder: Encoder) throws {
        struct ToolPayload: Encodable {
            let name: String
            let status: String
            let message: String
        }

        struct PlatformPayload: Encodable {
            let osVersion: String
            let isAppleSilicon: Bool
            let isSupported: Bool
            let message: String
        }

        enum CodingKeys: String, CodingKey {
            case platform
            case containerTool
            case containerization
            case resolver
            case caCertificate
            case http
            case detail
            case xpc
            case httpError
            case xpcError
        }

        var container = encoder.container(keyedBy: CodingKeys.self)

        let os = platform.osVersion
        let platformPayload = PlatformPayload(
            osVersion: "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)",
            isAppleSilicon: platform.isAppleSilicon,
            isSupported: platform.isSupported,
            message: platform.message
        )

        try container.encode(platformPayload, forKey: .platform)
        try container.encode(
            ToolPayload(name: containerTool.name, status: containerTool.status, message: containerTool.message),
            forKey: .containerTool
        )
        try container.encode(
            ToolPayload(
                name: containerization.name,
                status: containerization.status,
                message: containerization.message
            ),
            forKey: .containerization
        )
        try container.encode(
            ToolPayload(name: resolver.name, status: resolver.status, message: resolver.message),
            forKey: .resolver
        )
        try container.encode(
            ToolPayload(name: caCertificate.name, status: caCertificate.status, message: caCertificate.message),
            forKey: .caCertificate
        )

        try container.encodeIfPresent(http, forKey: .http)
        try container.encodeIfPresent(detail, forKey: .detail)
        try container.encodeIfPresent(xpc, forKey: .xpc)
        try container.encodeIfPresent(httpError, forKey: .httpError)
        try container.encodeIfPresent(xpcError, forKey: .xpcError)
    }

    static func fetch() async -> DoctorReport {
        let platform = RuntimeChecks.platformSupport()
        let containerTool = RuntimeChecks.containerToolVersion()
        let containerization = RuntimeChecks.containerizationFramework()
        let setupManager = NetworkSetupManager()
        let resolverInstalled = await setupManager.checkDNSStatus()
        let caCertificatePresent = await setupManager.checkCATrustStatus()
        let resolver = RuntimeChecks.ToolCheck(
            name: "DNS Resolver",
            status: resolverInstalled ? "ok" : "missing",
            message: resolverInstalled
                ? "Resolver configuration is installed for Flying Dutchman domains."
                : "Resolver configuration is missing. Run 'flyingdutchman networking install-resolver'."
        )
        let caCertificate = RuntimeChecks.ToolCheck(
            name: "Root CA Certificate",
            status: caCertificatePresent ? "ok" : "missing",
            message: caCertificatePresent
                ? "Root CA certificate is present on disk. Run 'flyingdutchman trust-ca' if HTTPS remains untrusted."
                : "Root CA certificate is missing. Start FlyingDutchmanEngine, then run 'flyingdutchman trust-ca'."
        )

        let httpResult: Result<EngineStatus, Error>
        let httpDetailResult: Result<EngineStatusDetail, Error>
        let xpcResult: Result<EngineXPCStatus, Error>

        do {
            httpResult = try await .success(EngineClient.fetchHealth())
        } catch {
            httpResult = .failure(error)
        }

        do {
            httpDetailResult = try await .success(EngineClient.fetchStatus())
        } catch {
            httpDetailResult = .failure(error)
        }

        do {
            xpcResult = try await .success(EngineXPCClient.fetchStatus())
        } catch {
            xpcResult = .failure(error)
        }

        let http = try? httpResult.get()
        let detail = try? httpDetailResult.get()
        let xpc = try? xpcResult.get()

        let httpError = http == nil ? httpResult.failureDescription : nil
        let xpcError = xpc == nil ? xpcResult.failureDescription : nil

        return DoctorReport(
            platform: platform,
            containerTool: containerTool,
            containerization: containerization,
            resolver: resolver,
            caCertificate: caCertificate,
            http: http,
            detail: detail,
            xpc: xpc,
            httpError: httpError,
            xpcError: xpcError
        )
    }
}

private extension Result {
    var failureDescription: String? {
        if case let .failure(error) = self {
            return error.localizedDescription
        }
        return nil
    }
}
