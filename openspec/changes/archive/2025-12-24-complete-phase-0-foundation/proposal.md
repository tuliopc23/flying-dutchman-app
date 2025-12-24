# Change: Complete Phase 0 Foundation

## Why
Phase 0 (Foundation) is blocking all subsequent phases. The ContainerizationRuntime has VM creation stubbed out due to API mismatch with Apple's Containerization framework. Logging and error handling infrastructure are missing, making debugging and user feedback difficult.

## What Changes

### 0.3 Container Runtime Abstraction (Complete)
- **Fix ContainerizationRuntime** to use correct Apple Containerization APIs:
  - Replace placeholder `[UUID: Bool]` with `[UUID: LinuxContainer]`
  - Use `ContainerManager` for container lifecycle instead of direct VM creation
  - Use `LinuxContainer.Configuration` for CPU/memory limits
  - Fix VSOCK communication via `container.dialVsock(port:)`
- **Update RuntimeFactory** with proper native availability detection
- **Add ContainerizationExtras** import for `.mib()` / `.gib()` byte helpers

### 0.4 Logging & Observability (New)
- Configure swift-log with structured logging
- Add log persistence and rotation
- Create logging categories per module
- Add performance metrics collection

### 0.5 Error Handling (New)
- Create unified `FlyingDutchmanError` enum in Shared module
- Add domain-specific error types per module
- Implement error recovery strategies
- Add user-facing error message localization

## Impact
- Affected specs: `container-engine`
- Affected modules:
  - `FlyingDutchmanContainers/ContainerizationRuntime.swift` - major rewrite
  - `FlyingDutchmanContainers/RuntimeFactory.swift` - update availability check
  - `Shared/` - new error types and logging configuration
  - All modules - adopt unified logging and error handling
