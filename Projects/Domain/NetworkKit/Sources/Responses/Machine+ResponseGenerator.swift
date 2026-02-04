import Foundation
import Hummingbird
import NIOCore
import Shared

extension Machine: ResponseGenerator {
    public func response(from request: Request, context: some RequestContext) throws -> Response {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(self)
        return Response(
            status: .ok,
            headers: [.contentType: "application/json"],
            body: .init(contentLength: data.count) { writer in
                try await writer.write(ByteBuffer(data: data))
            }
        )
    }
}

extension MachineConfig: ResponseGenerator {
    public func response(from request: Request, context: some RequestContext) throws -> Response {
        let data = try JSONEncoder().encode(self)
        return Response(
            status: .ok,
            headers: [.contentType: "application/json"],
            body: .init(contentLength: data.count) { writer in
                try await writer.write(ByteBuffer(data: data))
            }
        )
    }
}
