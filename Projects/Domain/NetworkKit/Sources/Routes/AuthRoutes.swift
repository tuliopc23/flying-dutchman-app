import FlyingDutchmanContainers
import Foundation
import Hummingbird
import Shared

/// HTTP routes for registry authentication (login/logout)
struct AuthRoutes {
    let runtime: ContainerRuntimeProtocol

    func register(on router: Router<BasicRequestContext>) {
        router.post("/auth/login", use: login)
        router.post("/auth/logout", use: logout)
    }

    // MARK: - Handlers

    private func login(_ request: Request, _ context: BasicRequestContext) async throws -> Response {
        struct LoginRequest: Decodable {
            let registry: String
            let username: String
            let password: String
        }

        struct LoginResponse: Encodable {
            let status: String
            let registry: String
            let message: String
        }

        // Decode request
        let payload = try await request.decode(as: LoginRequest.self, context: context)

        // Validate inputs
        guard !payload.registry.isEmpty else {
            return errorResponse(message: "Registry cannot be empty", status: .badRequest)
        }
        guard !payload.username.isEmpty else {
            return errorResponse(message: "Username cannot be empty", status: .badRequest)
        }
        guard !payload.password.isEmpty else {
            return errorResponse(message: "Password cannot be empty", status: .badRequest)
        }

        // Get RegistryAuthManager from runtime
        // We need to cast to ContainerizationRuntime to access authManager
        guard let containerizationRuntime = runtime as? ContainerizationRuntime else {
            return errorResponse(
                message: "Authentication not supported by current runtime",
                status: .serviceUnavailable
            )
        }

        // Perform login
        do {
            try await containerizationRuntime.login(
                registry: payload.registry,
                username: payload.username,
                password: payload.password
            )

            let response = LoginResponse(
                status: "success",
                registry: payload.registry,
                message: "Login succeeded"
            )

            return try encodeResponse(response, status: .ok)
        } catch {
            return errorResponse(message: error.localizedDescription, status: .unauthorized)
        }
    }

    private func logout(_ request: Request, _ context: BasicRequestContext) async throws -> Response {
        struct LogoutRequest: Decodable {
            let registry: String
        }

        struct LogoutResponse: Encodable {
            let status: String
            let registry: String
            let message: String
        }

        // Decode request
        let payload = try await request.decode(as: LogoutRequest.self, context: context)

        // Validate input
        guard !payload.registry.isEmpty else {
            return errorResponse(message: "Registry cannot be empty", status: .badRequest)
        }

        // Get RegistryAuthManager from runtime
        guard let containerizationRuntime = runtime as? ContainerizationRuntime else {
            return errorResponse(
                message: "Authentication not supported by current runtime",
                status: .serviceUnavailable
            )
        }

        // Perform logout
        do {
            try await containerizationRuntime.logout(registry: payload.registry)

            let response = LogoutResponse(
                status: "success",
                registry: payload.registry,
                message: "Logout succeeded"
            )

            return try encodeResponse(response, status: .ok)
        } catch {
            return errorResponse(message: error.localizedDescription, status: .internalServerError)
        }
    }

    // MARK: - Helpers

    private func errorResponse(message: String, status: HTTPResponse.Status) -> Response {
        let json = """
        {"error": "\(message.replacingOccurrences(of: "\"", with: "\\\""))"}
        """

        var headers = HTTPFields()
        headers[.contentType] = "application/json"

        return Response(
            status: status,
            headers: headers,
            body: ResponseBody(byteBuffer: ByteBuffer(string: json))
        )
    }

    private func encodeResponse(_ value: some Encodable, status: HTTPResponse.Status) throws -> Response {
        let data = try JSONEncoder().encode(value)
        var buffer = ByteBufferAllocator().buffer(capacity: data.count)
        buffer.writeBytes(data)

        var headers = HTTPFields()
        headers[.contentType] = "application/json"
        headers[.contentLength] = "\(buffer.readableBytes)"

        return Response(status: status, headers: headers, body: .init(byteBuffer: buffer))
    }
}
