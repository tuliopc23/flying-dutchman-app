## ADDED Requirements
### Requirement: Resource efficiency baseline
The system SHALL minimize CPU, memory, and disk usage when idle and scale on demand.

#### Scenario: Idle resource usage
- **WHEN** no containers or machines are running
- **THEN** CPU and memory usage remain minimal

### Requirement: Resource limits via settings
The system SHALL allow users to configure CPU and memory limits for containers and machines.

#### Scenario: Update memory limit
- **WHEN** a user sets a new memory limit in settings
- **THEN** the runtime applies the limit to future workloads

### Requirement: Rosetta configuration on Apple silicon
The system SHALL allow users to enable or disable Rosetta-based x86 emulation.

#### Scenario: Toggle Rosetta support
- **WHEN** a user disables the Rosetta setting
- **THEN** the runtime stops using Rosetta for x86 container images
