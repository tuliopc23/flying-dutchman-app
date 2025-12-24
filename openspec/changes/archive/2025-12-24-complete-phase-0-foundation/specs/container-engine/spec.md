## MODIFIED Requirements

### Requirement: Docker-compatible container engine
The system SHALL provide a Docker-compatible container engine using Apple's Containerization framework as the primary runtime, with CLI fallback for environments without native support.

#### Scenario: Run a container via Docker CLI
- **WHEN** a user runs a standard `docker run` command
- **THEN** the container starts successfully using the native Containerization runtime and appears in the app UI

#### Scenario: Run a container when native unavailable
- **WHEN** a user runs `docker run` and Apple Containerization is unavailable
- **THEN** the system falls back to ContainerCLIRuntime and the container starts via Docker CLI

#### Scenario: Run a Compose project
- **WHEN** a user runs `docker-compose up` in a project directory
- **THEN** all services start using the Containerization runtime and appear grouped in the app UI

### Requirement: Container lifecycle management
The system SHALL allow users to start, stop, restart, and delete containers using a two-phase lifecycle model (VM create → process start).

#### Scenario: Start a container
- **WHEN** a user starts a stopped container
- **THEN** the system boots the VM (container.create()), starts the process (container.start()), and updates status to running

#### Scenario: Stop a running container
- **WHEN** a user selects a running container in the app and chooses Stop
- **THEN** the system calls container.stop(), the VM shuts down, and the UI updates to stopped

#### Scenario: Restart a container
- **WHEN** a user selects a container and chooses Restart
- **THEN** the container stops and starts again, preserving its configuration

#### Scenario: Delete a stopped container
- **WHEN** a user selects a stopped container and chooses Delete
- **THEN** the container and its rootfs are removed and no longer appear in the UI

### Requirement: Container environment and configuration
The system SHALL allow viewing and editing container environment variables and configuration, with support for CPU and memory limits via LinuxContainer.Configuration.

#### Scenario: View environment variables
- **WHEN** a user inspects a container
- **THEN** all environment variables are displayed

#### Scenario: Create container with environment
- **WHEN** a user creates a container with `-e KEY=VALUE` flags
- **THEN** the container runs with those environment variables set

#### Scenario: Create container with CPU limit
- **WHEN** a user creates a container with `--cpus=2`
- **THEN** the container VM is configured with 2 CPU cores via config.cpus

#### Scenario: Create container with memory limit
- **WHEN** a user creates a container with `--memory=1g`
- **THEN** the container VM is configured with 1GB RAM via config.memoryInBytes

#### Scenario: Default resource limits
- **WHEN** a user creates a container without resource limits
- **THEN** the container uses defaults: 2 CPUs, 512MB memory

## ADDED Requirements

### Requirement: Structured logging
The system SHALL provide structured logging across all modules using swift-log with file persistence.

#### Scenario: Log container operations
- **WHEN** a container operation occurs (create, start, stop)
- **THEN** a structured log entry is written with operation type, container ID, and duration

#### Scenario: Log persistence
- **WHEN** the application runs
- **THEN** logs are persisted to `~/Library/Logs/FlyingDutchman/` with rotation

#### Scenario: Log filtering by category
- **WHEN** a developer sets `FD_LOG_LEVEL=debug`
- **THEN** debug-level logs are included in output

### Requirement: Unified error handling
The system SHALL provide unified error handling with user-friendly messages and recovery guidance.

#### Scenario: Display user error message
- **WHEN** an operation fails
- **THEN** the UI displays the error's userMessage property

#### Scenario: Log technical error details
- **WHEN** an error is thrown
- **THEN** the technicalMessage is logged with full context

#### Scenario: Recoverable error retry
- **WHEN** a recoverable error occurs (network timeout)
- **THEN** the system may automatically retry based on isRecoverable flag
