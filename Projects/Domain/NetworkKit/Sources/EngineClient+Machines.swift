import FlyingDutchmanContainers
import Foundation
import Shared

public extension EngineClient {
    @MainActor static func listMachines() async throws -> [Machine] {
        let url = URL(string: "\(baseURL)/machines")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([Machine].self, from: data)
    }

    @MainActor static func createMachine(name: String, config: MachineConfig) async throws -> Machine {
        let url = URL(string: "\(baseURL)/machines/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        struct CreateRequest: Encodable { let name: String; let config: MachineConfig }
        let body = CreateRequest(name: name, config: config)
        request.httpBody = try JSONEncoder().encode(body)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(Machine.self, from: data)
    }

    @MainActor static func startMachine(nameOrID: String) async throws -> Machine {
        try await mutateMachine(nameOrID: nameOrID, action: "start")
    }

    @MainActor static func stopMachine(nameOrID: String) async throws -> Machine {
        try await mutateMachine(nameOrID: nameOrID, action: "stop")
    }

    @MainActor static func restartMachine(nameOrID: String) async throws -> Machine {
        try await mutateMachine(nameOrID: nameOrID, action: "restart")
    }

    @MainActor static func deleteMachine(nameOrID: String) async throws {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }

    @MainActor static func executeMachineCommand(nameOrID: String, command: String) async throws -> String {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)/exec")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        struct ExecRequest: Encodable { let command: String }
        let body = ExecRequest(command: command)
        request.httpBody = try JSONEncoder().encode(body)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        struct ExecResponse: Decodable { let output: String }
        let result = try JSONDecoder().decode(ExecResponse.self, from: data)
        return result.output
    }

    @MainActor private static func mutateMachine(nameOrID: String, action: String) async throws -> Machine {
        let url = URL(string: "\(baseURL)/machines/\(nameOrID)/\(action)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(Machine.self, from: data)
    }
}
