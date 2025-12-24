## Purpose
Provide quick access to container and machine management through a macOS menu bar applet, enabling users to monitor status, control resources, and access common actions without opening the main application window.

## Requirements
### Requirement: Menu bar controls
The system SHALL provide a menu bar applet to manage containers and machines from anywhere.

#### Scenario: Stop a container from the menu bar
- **WHEN** a user selects a running container in the menu bar applet and chooses Stop
- **THEN** the container stops and the applet updates the state

### Requirement: Menu bar quick actions
The system SHALL provide menu bar actions for logs, terminals, and opening web services.

#### Scenario: Open a container's web service
- **WHEN** a user selects a container and chooses Open Web Service
- **THEN** the default browser opens the service URL
