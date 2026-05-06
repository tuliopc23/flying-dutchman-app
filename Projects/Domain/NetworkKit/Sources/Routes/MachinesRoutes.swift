import FlyingDutchmanContainers
import Foundation
import Hummingbird
import Shared

struct MachinesRoutes {
    let runtime: MachineRuntimeProtocol

    func register(on router: Router<BasicRequestContext>) {
        router.get("/machines") { _, _ in try await runtime.listMachines() }
        router.post("/machines/create") { request, context in
            struct CreateRequest: Decodable { let name: String; let config: MachineConfig }
            let body = try await request.decode(as: CreateRequest.self, context: context)
            return try await runtime.createMachine(name: body.name, config: body.config)
        }
        router.post("/machines/:nameOrID/start") { _, context in
            let machine = try await self.resolveMachine(context: context)
            return try await runtime.startMachine(id: machine.id)
        }
        router.post("/machines/:nameOrID/stop") { _, context in
            let machine = try await self.resolveMachine(context: context)
            return try await runtime.stopMachine(id: machine.id)
        }
        router.post("/machines/:nameOrID/restart") { _, context in
            let machine = try await self.resolveMachine(context: context)
            return try await runtime.restartMachine(id: machine.id)
        }
        router.delete("/machines/:nameOrID") { _, context in
            let machine = try await self.resolveMachine(context: context)
            try await runtime.deleteMachine(id: machine.id)
            return HTTPResponse.Status.ok
        }
        router.post("/machines/:nameOrID/exec") { request, context -> Response in
            struct ExecRequest: Decodable { let command: String }
            struct ExecResponse: Encodable { let output: String }
            let nameOrID = try context.parameters.require("nameOrID")
            let body = try await request.decode(as: ExecRequest.self, context: context)
            let machines = try await runtime.listMachines()
            guard let machine = machines.first(where: { $0.name == nameOrID || $0.id == nameOrID }) else {
                throw HTTPError(.notFound, message: "Machine not found: \(nameOrID)")
            }
            let output = try await runtime.executeCommand(machineID: machine.id, command: body.command)
            let response = ExecResponse(output: output)
            let data = try JSONEncoder().encode(response)
            return Response(
                status: .ok,
                headers: [.contentType: "application/json"],
                body: .init(contentLength: data.count) { writer in
                    try await writer.write(ByteBuffer(data: data))
                }
            )
        }
    }

    private func resolveMachine(context: BasicRequestContext) async throws -> Machine {
        let nameOrID = try context.parameters.require("nameOrID")
        let machines = try await runtime.listMachines()
        guard let machine = machines.first(where: { $0.name == nameOrID || $0.id == nameOrID }) else {
            throw HTTPError(.notFound, message: "Machine not found: \(nameOrID)")
        }
        return machine
    }
}
