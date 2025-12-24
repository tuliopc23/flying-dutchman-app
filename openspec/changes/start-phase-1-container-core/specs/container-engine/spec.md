## MODIFIED Requirements

### Requirement: Container state machine
The system SHALL track container state transitions with a formal state machine: created → starting → running → stopping → stopped → removing → removed.

#### Scenario: Container state consistency
- **WHEN** a container state changes externally (via CLI or runtime)
- **THEN** the app UI reflects the new state within 2 seconds

#### Scenario: State transition validation
- **WHEN** an invalid state transition is requested (e.g., start a running container)
- **THEN** the system returns an error without changing state

#### Scenario: State persistence
- **WHEN** the application restarts
- **THEN** container states are reconciled with actual VM status

### Requirement: Container logs streaming
The system SHALL provide real-time log streaming for running containers with follow mode and persistent storage.

#### Scenario: View live logs
- **WHEN** a user opens logs for a running container
- **THEN** logs stream in real-time as the container produces output

#### Scenario: View historical logs
- **WHEN** a user opens logs for a stopped container
- **THEN** the system displays logs from the container's last run

#### Scenario: Log persistence
- **WHEN** a container produces log output
- **THEN** logs are persisted to `~/Library/Application Support/flyingdutchman/containers/<id>/logs/`

## ADDED Requirements

### Requirement: Container event streaming
The system SHALL provide real-time event streaming for container state changes and resource updates.

#### Scenario: Subscribe to container events
- **WHEN** a client subscribes to container events
- **THEN** an AsyncStream delivers events for state changes, log output, and resource updates

#### Scenario: Event replay on reconnect
- **WHEN** a client reconnects after disconnection
- **THEN** recent events can be replayed from persistent storage

### Requirement: VSOCK communication
The system SHALL enable host-to-container communication via VSOCK for health checks and management.

#### Scenario: Health check via VSOCK
- **WHEN** a container is running
- **THEN** the host can perform health checks via container.dialVsock(port:)

#### Scenario: VSOCK connection timeout
- **WHEN** a VSOCK connection attempt times out
- **THEN** the system reports a vsockConnectionFailed error

### Requirement: Compose project support
The system SHALL support Docker Compose projects with multi-container orchestration.

#### Scenario: Start a Compose project
- **WHEN** a user runs `docker-compose up` in a project directory
- **THEN** all services start in dependency order and appear grouped in the UI

#### Scenario: Stop a Compose project
- **WHEN** a user runs `docker-compose down`
- **THEN** all services stop in reverse dependency order

#### Scenario: Service dependency ordering
- **WHEN** a service depends on another via `depends_on`
- **THEN** the dependency starts before the dependent service
