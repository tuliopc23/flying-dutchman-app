## ADDED Requirements

### Requirement: Networking setup is diagnosable and recoverable
The system SHALL provide verifiable diagnostics and recovery guidance for resolver installation, certificate trust, local domains, and port-forwarding setup.

#### Scenario: Resolver setup is missing
- **WHEN** the resolver files are absent or incorrect
- **THEN** the product surfaces the failure state and provides a documented recovery path

#### Scenario: Local trust is missing
- **WHEN** the local certificate authority is not trusted
- **THEN** the product surfaces the failure state and provides a documented recovery path

### Requirement: Release validation covers networking workflows
The system SHALL include explicit automated or manual release checks for DNS resolution, HTTPS trust, domain routing, and port-forwarding behavior.

#### Scenario: Release candidate networking validation
- **WHEN** a release candidate is validated
- **THEN** the release evidence includes successful checks for DNS resolution, HTTPS access, and port-forward reachability

#### Scenario: Networking regression discovered
- **WHEN** any networking validation check fails during release validation
- **THEN** the candidate is blocked until the regression is resolved or formally deferred with non-release scope