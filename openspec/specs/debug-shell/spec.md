## Purpose
Provide powerful debugging capabilities for containers, including a pre-configured debug shell with common tools that works even with minimal or distroless images, and support for debugging containers on remote Docker hosts.

## Requirements
### Requirement: Debug shell for containers
The system SHALL provide a debug shell with built-in tools for container debugging, including minimal and distroless containers.

#### Scenario: Start a debug shell from the UI
- **WHEN** a user clicks Debug on a container
- **THEN** a terminal opens with a shell and common tools available

### Requirement: Remote container debugging
The system SHALL support debugging containers running on remote Docker hosts via Docker contexts.

#### Scenario: Connect to a remote host
- **WHEN** a user selects a Docker context configured with SSH credentials
- **THEN** the debug shell connects to the remote container
