## ADDED Requirements
### Requirement: Docker-compatible container engine
The system SHALL provide a Docker-compatible container engine, including Compose, so that standard Docker workflows run without modification.

#### Scenario: Run a container via Docker CLI
- **WHEN** a user runs a standard `docker run` command
- **THEN** the container starts successfully and appears in the app UI

### Requirement: Container lifecycle management
The system SHALL allow users to start, stop, restart, and delete containers and Compose projects from the UI.

#### Scenario: Stop a running container
- **WHEN** a user selects a running container in the app and chooses Stop
- **THEN** the container transitions to a stopped state and the UI updates
