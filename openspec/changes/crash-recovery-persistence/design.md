# Design: Validate Persistence and Crash Recovery

## Current implementation
Container states are stored in a local SQLite file using GRDB. Mismatches between the database state and actual running virtualization processes are not automatically corrected at startup, which can lock the user interface in a stuck transition state.

## Proposed implementation
Establish a `StateReconciler` class inside `FlyingDutchmanEngine`:
- On engine launch, perform a non-blocking check: query all container entries in database.
- Query active virtualization states from host system using `Containerization` APIs.
- Match databases records by container ID.
- Reconcile status mismatch:
  ```swift
  func reconcile(dbContainer: ContainerRecord, hostContainer: HostContainerInfo?) async throws {
      // If stuck in a transient state and engine just started
      if dbContainer.state.isTransient {
          try await db.updateState(for: dbContainer.id, to: .failed, error: "Aborted due to engine restart")
      }
      ...
  }
  ```
- Expose the repair process through the `flyingdutchman repair` CLI endpoint, which forcefully cleans up orphaned virtual files and resets database rows.

## Files likely touched
- `Projects/Product/Engine/Sources/Engine/StateReconciler.swift` (new)
- `Projects/Core/Persistence/Sources/Persistence.swift`
- `Projects/Product/CLI/Sources/Commands/Repair.swift` (new)
- `docs/validation/crash-recovery.md` (new)

## Architecture boundaries
- The reconciler lives in the engine target and leverages Persistence + Containerization modules.
- It must not leak UI dependencies.

## Testing strategy
- Database transactional testing.
- Stubbing virtual container list results to verify reconciler outcomes.
