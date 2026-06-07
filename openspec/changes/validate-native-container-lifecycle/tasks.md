# Tasks: Validate and Fix Native Container Lifecycle

## Inspection
- [ ] Audit native container lifecycle methods in `FlyingDutchmanContainers`.
- [ ] Inspect args, environment variable, and bind mount wiring.
- [ ] Verify image pull caching, storage locations, and registry auth.

## Implementation
- [ ] Implement and verify `pull`, `create`, `start`, `stop`, `restart`, and `remove` paths.
- [ ] Ensure state machine correctly transitions through: `creating`, `created`, `starting`, `running`, `stopping`, `stopped`, `removing`, `failed`.
- [ ] Wire container environment variables and CLI arguments into the native process config.
- [ ] Implement robust port allocation and release during container start and stop/remove.
- [ ] Ensure logs are persisted and accessible after container termination.
- [ ] Implement bind mount path verification (read-only, writable, bad paths).
- [ ] Ensure database and filesystem cleanup upon container removal.
- [ ] Gracefully handle missing images or failed pull attempts without corrupting local state.

## Validation
- [ ] Write integration test cases or manual verification scripts for hello-world, Alpine, and Nginx.
- [ ] Verify engine restarts do not leave zombie container states in database or host.
- [ ] Create manual validation document: `docs/validation/native-container-lifecycle.md`.
