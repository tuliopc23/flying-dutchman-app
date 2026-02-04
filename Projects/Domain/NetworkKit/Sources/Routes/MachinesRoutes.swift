import FlyingDutchmanContainers
import Foundation
import Hummingbird
import Shared

struct MachinesRoutes {
    let runtime: MachineRuntimeProtocol

    func register(on router: Router<BasicRequestContext>) {
        // List all machines
        router.get("/machines") { _, _ in
            try await runtime.listMachines()
        }

        // Create a new machine
        router.post("/machines/create") { request, context in
            struct CreateRequest: Decodable {
                let name: String
                let config: MachineConfig
            }

            let body = try await request.decode(as: CreateRequest.self, context: context)
            return try await runtime.createMachine(name: body.name, config: body.config)
        }

        // Start a machine
        router.post("/machines/:nameOrID/start") { _, context in
            let nameOrID = try context.parameters.require("nameOrID")

            // Try to find by name first, then by ID
            let machines = try await runtime.listMachines()
            guard let machine = machines.first(where: { $0.name == nameOrID || $0.id == nameOrID }) else {
                throw HTTPError(.notFound, message: "Machine not found: \(nameOrID)")
            }

            return try await runtime.startMachine(id: machine.id)
        }

        // Stop a machine
        router.post("/machines/:nameOrID/stop") { _, context in
            let nameOrID = try context.parameters.require("nameOrID")

            let machines = try await runtime.listMachines()
            guard let machine = machines.first(where: { $0.name == nameOrID || $0.id == nameOrID }) else {
                throw HTTPError(.notFound, message: "Machine not found: \(nameOrID)")
            }

            return try await runtime.stopMachine(id: machine.id)
        }

        // Restart a machine
        router.post("/machines/:nameOrID/restart") { _, context in
            let nameOrID = try context.parameters.require("nameOrID")

            let machines = try await runtime.listMachines()
            guard let machine = machines.first(where: { $0.name == nameOrID || $0.id == nameOrID }) else {
                throw HTTPError(.notFound, message: "Machine not found: \(nameOrID)")
            }

            return try await runtime.restartMachine(id: machine.id)
        }

        // Delete a machine
        router.delete("/machines/:nameOrID") { _, context in
            let nameOrID = try context.parameters.require("nameOrID")

            let machines = try await runtime.listMachines()
            guard let machine = machines.first(where: { $0.name == nameOrID || $0.id == nameOrID }) else {
                throw HTTPError(.notFound, message: "Machine not found: \(nameOrID)")
            }

            try await runtime.deleteMachine(id: machine.id)
            return HTTPResponse.Status.ok
        }

        // Execute command in a machine
        router.post("/machines/:nameOrID/exec") { request, context -> Response in
            struct ExecRequest: Decodable {
                let command: String
            }

            struct ExecResponse: Encodable {
                let output: String
            }

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
}
