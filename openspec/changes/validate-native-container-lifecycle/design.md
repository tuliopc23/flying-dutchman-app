# Design: Validate and Fix Native Container Lifecycle

## Current implementation
The `FlyingDutchmanContainers` library contains code wrapping the macOS virtualization/containerization stack, but does not thoroughly handle edge-case teardown, log persistence, or DB garbage collection. SQLite mappings may drift from actual OS process states.

## Proposed implementation
Harden lifecycle logic within the container manager:
- Use transaction-backed GRDB writes for state changes.
- Intercept container termination signals to release mapped host ports.
- Safely mount directories by validating paths exist and checking permissions before applying macOS virtualization bindings.
- Store container logs in `/Users/<user>/.flyingdutchman/logs/<container-id>.log` so they survive process restarts.
- Ensure state transition errors are caught and recorded, transitioning the record to `.failed` with a copyable error payload.

## Files likely touched
- `Projects/Domain/ContainerKit/Sources/ContainerManager.swift`
- `Projects/Core/Persistence/Sources/Persistence.swift`
- `docs/validation/native-container-lifecycle.md` (new)

## Architecture boundaries
- Ensure virtualization dependencies remain internal to `FlyingDutchmanContainers`.
- Do not expose low-level container objects directly; use domain-safe model representations.

## Testing strategy
- Integration tests simulating a mock container runtime environment.
- Asserting DB state matches actual host process states.
- Running port binding test cases to verify port reuse.
