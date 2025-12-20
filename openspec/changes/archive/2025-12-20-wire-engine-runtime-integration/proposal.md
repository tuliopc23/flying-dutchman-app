# Change: Wire Engine-Runtime Integration for End-to-End Container Lifecycle

## Why

Phase A.1 established the foundation (UI, persistence, CLI scaffold) but the engine HTTP/XPC endpoints currently return stub responses without calling the container runtime. The full stack needs to be wired end-to-end so that:

- Engine endpoints (`/containers`, `/images`, etc.) call `ContainerRuntime`
- CLI commands hit the engine and receive real responses from the runtime
- UI fetches from the engine and displays actual runtime state
- Complete create/start/stop/remove lifecycle flows through all layers

This establishes the architecture before tackling Apple Containerization framework integration, following the constitution's "minimal, surgical changes" principle.

## What Changes

- **Engine HTTP Routes**: Wire `ContainersRoutes`, `ImagesRoutes` to call `RuntimeFactory.makeRuntime()`
- **Engine XPC Service**: Wire XPC methods to route through runtime
- **CLI Integration**: Update CLI commands to parse engine responses correctly
- **State Synchronization**: Ensure GRDB persistence stays in sync with runtime state
- **Error Handling**: Propagate runtime errors through HTTP/XPC with clear messages
- **Logging**: Add structured logging for engine → runtime → persistence flow

**Non-Breaking**: All changes are internal wiring; external APIs remain unchanged.

## Impact

### Affected Specs
- `container-lifecycle` (new) - Defines end-to-end container lifecycle behavior
- `engine-http-api` (future) - HTTP endpoint contracts
- `engine-xpc-protocol` (future) - XPC method contracts

### Affected Code
- `Sources/FlyingDutchmanEngine/` - Engine main, launchd lifecycle
- `Sources/FlyingDutchmanNetworking/Routes/` - HTTP route handlers
- `Sources/FlyingDutchmanNetworking/XPC/` - XPC service implementation
- `Sources/FlyingDutchmanCLI/main.swift` - CLI command parsing
- `Sources/FlyingDutchmanContainers/RuntimeFactory.swift` - Runtime instantiation

### Testing
- Manual smoke test: `swift run FlyingDutchmanEngine` + `swift run FlyingDutchmanCLI containers list`
- Integration test: Engine → Runtime → Persistence round-trip
- UI smoke test: App launches, fetches containers from engine, displays correctly

### Performance
- Target: CLI commands <500ms, UI updates <200ms (within constitution targets)
- Uses existing stub runtime (fast in-memory operations)

## Migration Notes

No user-facing migration needed. This is internal wiring that completes the foundation architecture.

## Dependencies

- Requires: Phase A.1 Foundation (completed)
- Blocks: Apple Containerization framework integration (future)
- Blocks: Docker API compatibility (future)
- Blocks: Real OCI image pulling (future)
