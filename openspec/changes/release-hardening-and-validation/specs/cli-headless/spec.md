## ADDED Requirements

### Requirement: CLI health diagnostics support release validation
The system SHALL provide CLI diagnostics that report release-critical runtime health for engine availability, resolver state, certificate trust, and recovery guidance.

#### Scenario: Run CLI diagnostics on a healthy system
- **WHEN** a user runs the documented CLI health command during release validation
- **THEN** the command reports successful status for required runtime checks

#### Scenario: Run CLI diagnostics on an unhealthy system
- **WHEN** a required runtime dependency is missing or unhealthy
- **THEN** the command reports the failing check and actionable recovery guidance

### Requirement: CLI recovery flows are release-safe
The system SHALL ensure documented CLI recovery commands for resolver and certificate setup are validated as part of headless release workflows.

#### Scenario: Headless networking recovery
- **WHEN** a user performs resolver or certificate recovery without the GUI
- **THEN** the documented CLI flow succeeds and can be verified by follow-up diagnostics

#### Scenario: Recovery command fails
- **WHEN** a CLI recovery step cannot complete
- **THEN** the command reports a clear failure reason and next-step guidance without silent success