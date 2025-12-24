## Purpose
Enable full control of Flying Dutchman's container and VM runtime from the command line, supporting headless operation for automation, CI/CD pipelines, and users who prefer terminal-based workflows over the GUI.

## Requirements
### Requirement: Headless CLI operation
The system SHALL support starting, stopping, and configuring the runtime exclusively from the command line without the GUI.

#### Scenario: Start from CLI
- **WHEN** a user runs `orb start`
- **THEN** the runtime starts and Docker commands become available

### Requirement: Runtime configuration via CLI
The system SHALL provide CLI commands for runtime configuration (for example, resource limits and settings).

#### Scenario: Change a configuration value
- **WHEN** a user runs `orb config set setup.use_admin false`
- **THEN** the configuration value is updated and persisted
