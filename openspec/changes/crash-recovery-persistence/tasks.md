# Tasks: Validate Persistence and Crash Recovery

## Inspection
- [ ] Inspect existing state reconciliation and sync functions in `FlyingDutchmanEngine`.
- [ ] Audit all transient database states (e.g. `creating`, `starting`, `stopping`, `removing`, `pulling`).
- [ ] Review how active port mappings are stored and cleaned.

## Implementation
- [ ] Add active reconciliation logic at engine startup to compare DB records with host systems:
  - If DB says `running` but runtime process is dead, update DB to `stopped`.
  - If DB says `stopped` but process is running, update DB to `running` or gracefully sync.
  - If DB is stuck in transient states (e.g. `creating`, `starting`, `stopping`, `removing`) after a restart, reset state to `stopped` or `failed` as appropriate.
- [ ] Ensure that aborted image pulls release disk spaces and clean temporary caches.
- [ ] Clear database port-forwarding metadata and release system port bindings if a container is removed or engine restarts.
- [ ] Implement `flyingdutchman repair` (or `flyingdutchman doctor --repair`) CLI command to trigger full manual reconciliation and clean orphaned resources.
- [ ] Implement UI indicators and buttons to trigger state repair in the app's diagnostic view.

## Validation
- [ ] Write unit tests simulating abrupt engine halts during creation or deletion.
- [ ] Test the database status sync behavior using simulated container state mismatches.
- [ ] Document manual recovery scenarios in `docs/validation/crash-recovery.md`.
