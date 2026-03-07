## Why

Flying Dutchman now builds and tests successfully, but it still lacks a release-grade specification for product hardening, test coverage, and final validation. We need a single change that turns the current "works in development" state into a repeatable, measurable release process.

## What Changes

- Define release quality gates for the App, Engine, CLI, and key feature modules.
- Define a full test strategy spanning smoke, deterministic unit, integration, persistence, and end-to-end validation.
- Require replacement of placeholder tests and stub-facing release paths in user-critical workflows.
- Define hardening requirements for diagnostics, error handling, warnings triage, settings health checks, and networking setup UX.
- Define a release checklist covering build, test, packaging, manual smoke, migration safety, and rollback readiness.

## Capabilities

### New Capabilities
- `release-readiness`: Defines the release gate, validation matrix, packaging checks, warning/stub thresholds, and final sign-off criteria.
- `quality-assurance`: Defines the required automated and manual test suite structure for app, engine, CLI, persistence, networking, machines, and Kubernetes workflows.

### Modified Capabilities
- `settings-efficiency`: Settings must expose release-critical runtime status, defaults, diagnostics, and recovery actions clearly enough for production use.
- `container-networking`: Resolver, HTTPS trust, local domain routing, and port-forwarding flows must be validated with explicit automated and manual release checks.
- `cli-headless`: CLI diagnostics and recovery commands must support release validation and headless troubleshooting.

## Impact

- Affected modules: `FlyingDutchmanApp`, `FlyingDutchmanEngine`, `FlyingDutchmanCLI`, `Shared`, `FlyingDutchmanPersistence`, `FlyingDutchmanNetworking`, `FlyingDutchmanContainers`, `Machines`, `Kubernetes`, `Settings`, `Shell`, `Diagnostics`.
- Affected systems: test suite layout, CI/release validation flow, OpenSpec capability definitions, packaging/release checklist, user-visible diagnostics and setup UX.
- Affected artifacts: new release-focused specs, implementation plan, and execution tasks for hardening and polish.