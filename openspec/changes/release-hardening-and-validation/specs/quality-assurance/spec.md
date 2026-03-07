## ADDED Requirements

### Requirement: Layered automated test strategy
The system SHALL maintain an automated test strategy spanning smoke, deterministic unit, persistence, integration, and cross-module workflow validation.

#### Scenario: Core logic changes
- **WHEN** a core module such as persistence, containers, networking, machines, or Kubernetes changes
- **THEN** deterministic tests exist for the affected business logic and run as part of the required validation suite

#### Scenario: Feature workflow changes
- **WHEN** an app feature workflow changes
- **THEN** the validation suite includes at least one automated test or explicit manual smoke case for the affected workflow

### Requirement: Placeholder test replacement
The system SHALL not rely on placeholder-only or trivial smoke-only tests for release-critical workflows.

#### Scenario: Release-critical workflow is covered
- **WHEN** a workflow is considered release-critical
- **THEN** it has behavior-based validation beyond a placeholder assertion such as `#expect(true)`

#### Scenario: Placeholder test remains
- **WHEN** a placeholder or trivial smoke test still exists for a release-critical workflow
- **THEN** the release plan classifies it as replacement work before final sign-off

### Requirement: Manual validation matrix for privileged flows
The system SHALL define manual smoke validation for workflows that depend on macOS permissions, system configuration, virtualization, or user-observable UI state.

#### Scenario: Networking setup validation
- **WHEN** a release candidate is smoked manually
- **THEN** resolver installation, CA trust, local domains, and HTTPS behavior are validated using the documented checklist

#### Scenario: Runtime workflow validation
- **WHEN** a release candidate is smoked manually
- **THEN** at least one container, one machine, and one Kubernetes workflow are exercised using the documented checklist

### Requirement: Validation ownership and repeatability
The system SHALL assign each required validation step to a documented command or checklist entry so another operator can repeat it without tribal knowledge.

#### Scenario: Another contributor runs the release suite
- **WHEN** a contributor follows the documented validation plan
- **THEN** they can execute the required build, test, and smoke steps without needing undocumented setup knowledge