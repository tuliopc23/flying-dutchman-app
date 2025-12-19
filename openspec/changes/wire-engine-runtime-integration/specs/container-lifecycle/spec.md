## ADDED Requirements

### Requirement: Engine Runtime Integration

The engine MUST instantiate a container runtime via `RuntimeFactory` on startup and route all HTTP/XPC requests through the runtime.

#### Scenario: Engine starts with stub runtime

- **WHEN** engine launches without Containerization framework available
- **THEN** `RuntimeFactory.makeRuntime()` returns stub runtime
- **AND** engine logs "Using stub runtime" at startup
- **AND** `/health` endpoint returns `{"runtime": "stub"}`

#### Scenario: Engine starts with native runtime

- **WHEN** engine launches with `FD_RUNTIME=native` and Containerization framework present
- **THEN** `RuntimeFactory.makeRuntime()` returns ContainerizationRuntime
- **AND** engine logs "Using native Containerization framework" at startup
- **AND** `/health` endpoint returns `{"runtime": "native"}`

### Requirement: Container Listing via HTTP

The engine HTTP server MUST expose `/containers` endpoint that returns all containers from the runtime.

#### Scenario: List containers successfully

- **WHEN** client sends `GET /containers`
- **THEN** engine calls `runtime.list()`
- **AND** returns HTTP 200 with JSON array of container summaries
- **AND** each container includes: `id`, `name`, `image`, `status`, `ports`

#### Scenario: List containers when empty

- **WHEN** client sends `GET /containers` and no containers exist
- **THEN** engine returns HTTP 200 with empty JSON array `[]`

### Requirement: Container Creation via HTTP

The engine HTTP server MUST expose `/containers/create` endpoint that creates containers via runtime.

#### Scenario: Create container successfully

- **WHEN** client sends `POST /containers/create` with `{"name": "test", "image": "ubuntu:latest"}`
- **THEN** engine calls `runtime.createContainer(name: "test", image: "ubuntu:latest", config: .default)`
- **AND** engine persists container to GRDB `ContainerStore`
- **AND** returns HTTP 201 with created container JSON
- **AND** container status is `stopped`

#### Scenario: Create container with invalid name

- **WHEN** client sends `POST /containers/create` with empty name
- **THEN** engine returns HTTP 400 with error `{"error": "Container name is required"}`

### Requirement: Container Lifecycle via HTTP

The engine HTTP server MUST expose `/containers/{id}/start` and `/containers/{id}/stop` endpoints.

#### Scenario: Start stopped container

- **WHEN** client sends `POST /containers/{id}/start` for a stopped container
- **THEN** engine calls `runtime.start(containerID: id)`
- **AND** engine updates GRDB with new status
- **AND** returns HTTP 200 with updated container (status = `running`)

#### Scenario: Stop running container

- **WHEN** client sends `POST /containers/{id}/stop` for a running container
- **THEN** engine calls `runtime.stop(containerID: id)`
- **AND** engine updates GRDB with new status
- **AND** returns HTTP 200 with updated container (status = `stopped`)

#### Scenario: Start non-existent container

- **WHEN** client sends `POST /containers/{invalid-id}/start`
- **THEN** engine returns HTTP 404 with error `{"error": "Container not found"}`

#### Scenario: Start already running container

- **WHEN** client sends `POST /containers/{id}/start` for a running container
- **THEN** engine returns HTTP 409 with error `{"error": "Container is already running"}`

### Requirement: Container Removal via HTTP

The engine HTTP server MUST expose `/containers/{id}` DELETE endpoint.

#### Scenario: Remove stopped container

- **WHEN** client sends `DELETE /containers/{id}` for a stopped container
- **THEN** engine calls `runtime.removeContainer(id: id)`
- **AND** engine deletes container from GRDB
- **AND** returns HTTP 204 (no content)

#### Scenario: Remove running container

- **WHEN** client sends `DELETE /containers/{id}` for a running container
- **THEN** engine stops container first
- **AND** removes container after stop completes
- **AND** returns HTTP 204 (no content)

### Requirement: Container Logs via HTTP

The engine HTTP server MUST expose `/containers/{id}/logs` endpoint that streams logs.

#### Scenario: Stream container logs

- **WHEN** client sends `GET /containers/{id}/logs?follow=true`
- **THEN** engine calls `runtime.logs(for: id)`
- **AND** returns HTTP 200 with `text/event-stream` content-type
- **AND** streams log lines as Server-Sent Events until connection closes

#### Scenario: Get historic logs

- **WHEN** client sends `GET /containers/{id}/logs?follow=false`
- **THEN** engine returns all historic logs from GRDB `ContainerLogStore`
- **AND** returns HTTP 200 with JSON array of log entries
- **AND** closes connection after last log line

### Requirement: Container Lifecycle via XPC

The engine XPC service MUST expose methods for container lifecycle operations.

#### Scenario: XPC list containers

- **WHEN** app client calls `EngineXPCClient.listContainers()`
- **THEN** XPC service calls `runtime.list()`
- **AND** returns encoded array of container summaries
- **AND** completes within 200ms (constitution target)

#### Scenario: XPC start container

- **WHEN** app client calls `EngineXPCClient.startContainer(id:)`
- **THEN** XPC service calls `runtime.start(containerID: id)`
- **AND** updates GRDB persistence
- **AND** returns updated container via XPC reply
- **AND** completes within 200ms for stub runtime

### Requirement: CLI Container Commands

The CLI MUST communicate with engine via HTTP and display results correctly.

#### Scenario: CLI lists containers

- **WHEN** user runs `flyingdutchman containers list`
- **THEN** CLI sends `GET /containers` to engine
- **AND** parses JSON response
- **AND** displays table: `ID | NAME | IMAGE | STATUS | PORTS`
- **AND** completes within 500ms (constitution target)

#### Scenario: CLI starts container

- **WHEN** user runs `flyingdutchman containers start <name-or-id>`
- **THEN** CLI resolves name to ID if needed
- **AND** sends `POST /containers/{id}/start` to engine
- **AND** displays success message: "Container <name> started"
- **AND** exits with code 0

#### Scenario: CLI handles engine unreachable

- **WHEN** user runs `flyingdutchman containers list` and engine is not running
- **THEN** CLI detects connection failure
- **AND** displays error: "Engine unreachable. Start with: swift run FlyingDutchmanEngine"
- **AND** exits with code 1

### Requirement: State Synchronization

The engine MUST keep GRDB persistence in sync with runtime state.

#### Scenario: Persist after runtime state change

- **WHEN** runtime changes container status (start/stop)
- **THEN** engine immediately calls `ContainerStore.update()` with new state
- **AND** persists to GRDB before returning response

#### Scenario: Periodic state reconciliation

- **WHEN** engine has been running for 5 seconds
- **THEN** engine polls `runtime.list()` to get current state
- **AND** compares with GRDB state
- **AND** updates GRDB if any containers have diverged
- **AND** logs any state corrections

### Requirement: Error Propagation

The engine MUST propagate runtime errors as clear HTTP/XPC errors.

#### Scenario: Runtime throws error

- **WHEN** runtime throws `ContainerError.notFound(id)`
- **THEN** HTTP endpoint returns 404 with JSON `{"error": "Container <id> not found"}`
- **AND** XPC method returns NSError with code 404

#### Scenario: Runtime throws invalid state error

- **WHEN** runtime throws `ContainerError.invalidState("Container is not stopped")`
- **THEN** HTTP endpoint returns 409 with JSON `{"error": "Container is not stopped"}`
- **AND** XPC method returns NSError with code 409

### Requirement: Structured Logging

The engine MUST log all runtime operations with structured fields.

#### Scenario: Log container lifecycle operations

- **WHEN** engine calls `runtime.start(containerID: id)`
- **THEN** engine logs `info` level: "Starting container"
- **AND** log includes fields: `container_id`, `container_name`, `runtime_mode`
- **AND** uses swift-log structured logging

#### Scenario: Log engine startup

- **WHEN** engine launches
- **THEN** engine logs runtime mode: "Engine started with <mode> runtime"
- **AND** log includes fields: `runtime_mode`, `grdb_path`, `http_port`, `xpc_enabled`

### Requirement: Performance Targets

The engine-runtime integration MUST meet performance targets defined in constitution.

#### Scenario: CLI command performance

- **WHEN** user runs any CLI command against running engine
- **THEN** command completes within 500ms

#### Scenario: UI status update performance

- **WHEN** UI fetches container status via XPC
- **THEN** request completes within 200ms

#### Scenario: HTTP response performance

- **WHEN** client sends GET /containers to engine
- **THEN** response returns within 200ms for <100 containers
