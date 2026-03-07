## ADDED Requirements

### Requirement: Settings expose release-critical runtime status
The system SHALL present release-critical runtime health in Settings, including resolver status, certificate trust status, and actionable recovery paths.

#### Scenario: Open Settings with incomplete networking setup
- **WHEN** a user opens Settings and the resolver or CA trust is not configured correctly
- **THEN** the UI shows the failing status and an actionable recovery path

#### Scenario: Open Settings with healthy networking setup
- **WHEN** a user opens Settings and networking prerequisites are configured correctly
- **THEN** the UI reflects healthy status without requiring terminal inspection

### Requirement: Persisted defaults remain verifiable
The system SHALL allow release-critical defaults and preferences to be changed, persisted, and re-read without ambiguous UI state.

#### Scenario: Restart after changing defaults
- **WHEN** a user updates supported settings defaults and relaunches the app
- **THEN** the stored values are restored correctly and remain visible in Settings

#### Scenario: Defaults influence future workflows
- **WHEN** a user opens a workflow that depends on saved defaults
- **THEN** the UI uses the persisted values consistently for first-run state