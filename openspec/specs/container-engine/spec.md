## Purpose
Provide a Docker-compatible container engine that allows developers to run their existing Docker and Compose workflows on macOS without modification, while offering native UI integration for container lifecycle management, logging, and monitoring.

## Requirements

### Requirement: Docker-compatible container engine
The system SHALL provide a Docker-compatible container engine, including Compose, so that standard Docker workflows run without modification.

#### Scenario: Run a container via Docker CLI
- **WHEN** a user runs a standard `docker run` command
- **THEN** the container starts successfully and appears in the app UI

#### Scenario: Run a Compose project
- **WHEN** a user runs `docker-compose up` in a project directory
- **THEN** all services start and appear grouped in the app UI

### Requirement: Container lifecycle management
The system SHALL allow users to start, stop, restart, and delete containers and Compose projects from the UI.

#### Scenario: Stop a running container
- **WHEN** a user selects a running container in the app and chooses Stop
- **THEN** the container transitions to a stopped state and the UI updates

#### Scenario: Restart a container
- **WHEN** a user selects a container and chooses Restart
- **THEN** the container stops and starts again, preserving its configuration

#### Scenario: Delete a stopped container
- **WHEN** a user selects a stopped container and chooses Delete
- **THEN** the container is removed and no longer appears in the UI

### Requirement: Container state machine
The system SHALL track container state transitions: created → running → paused → stopped → removed.

#### Scenario: Container state consistency
- **WHEN** a container state changes externally (via CLI or runtime)
- **THEN** the app UI reflects the new state within 2 seconds

### Requirement: Container logs streaming
The system SHALL provide real-time log streaming for running containers with follow mode.

#### Scenario: View live logs
- **WHEN** a user opens logs for a running container
- **THEN** logs stream in real-time as the container produces output

#### Scenario: View historical logs
- **WHEN** a user opens logs for a stopped container
- **THEN** the system displays logs from the container's last run

### Requirement: Container resource usage
The system SHALL display CPU, memory, and network usage for running containers.

#### Scenario: View container stats
- **WHEN** a user views a running container's details
- **THEN** real-time CPU percentage, memory usage, and network I/O are displayed

### Requirement: Container environment and configuration
The system SHALL allow viewing and editing container environment variables and configuration.

#### Scenario: View environment variables
- **WHEN** a user inspects a container
- **THEN** all environment variables are displayed

#### Scenario: Create container with environment
- **WHEN** a user creates a container with `-e KEY=VALUE` flags
- **THEN** the container runs with those environment variables set

---

## Implementation Notes

**Module**: `FlyingDutchmanContainers`

**Phase**: 1.1

**Key Types**:
- `Container` - SwiftData model or Sendable struct
- `ContainerState` - Enum (created, running, paused, stopped, removed)
- `ContainerRuntime` - Protocol for runtime abstraction
- `ContainerService` - Business logic layer

**Dependencies**:
- Apple Containerization framework
- swift-nio for async streaming
- GRDB for persistence (or SwiftData)
