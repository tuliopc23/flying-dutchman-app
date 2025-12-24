## 1. Container Runtime Abstraction (0.3)

### 1.1 Fix ContainerizationRuntime Core
- [x] 1.1.1 Replace `activeContainers: [UUID: Bool]` with `[UUID: LinuxContainer]`
- [x] 1.1.2 Add `ContainerManager` instance to handle lifecycle
- [x] 1.1.3 Update `createContainer()` to use `manager.create()` with proper config
- [x] 1.1.4 Update `startContainer()` to call `container.create()` then `container.start()`
- [x] 1.1.5 Update `stopContainer()` to call `container.stop()`
- [ ] 1.1.6 Fix VSOCK communication via `container.dialVsock(port:)` (deferred to Phase 1)

### 1.2 Fix Container Configuration
- [x] 1.2.1 Import `ContainerizationExtras` for byte size helpers
- [x] 1.2.2 Use `LinuxContainer.Configuration` for CPU/memory limits
- [x] 1.2.3 Map `ContainerConfig.cpuLimit` (millicores) to `config.cpus`
- [x] 1.2.4 Map `ContainerConfig.memoryLimit` to `config.memoryInBytes`

### 1.3 Fix RuntimeFactory
- [x] 1.3.1 Update `ContainerizationClient.isNativeAvailable` to check actual framework availability
- [x] 1.3.2 Add kernel path validation in factory
- [x] 1.3.3 Add fallback messaging when native unavailable

### 1.4 Kernel Management
- [ ] 1.4.1 Update `KernelManager` to download compatible kernel if missing (deferred to Phase 1)
- [ ] 1.4.2 Add kernel version validation (deferred to Phase 1)
- [x] 1.4.3 Add initfs reference handling (`vminit` image)

## 2. Logging & Observability (0.4)

### 2.1 Structured Logging Setup
- [x] 2.1.1 Create `LoggingConfiguration` in Shared module
- [x] 2.1.2 Configure `LoggingSystem.bootstrap` with custom handler
- [x] 2.1.3 Add metadata support (container ID, operation, duration)
- [x] 2.1.4 Add log level configuration via environment/settings

### 2.2 Log Persistence
- [x] 2.2.1 Create `FileLogHandler` for persistent logs
- [x] 2.2.2 Configure log rotation (size-based, 10MB max)
- [x] 2.2.3 Configure log retention (7 days)
- [x] 2.2.4 Store logs in `~/Library/Logs/FlyingDutchman/`

### 2.3 Module Categories
- [x] 2.3.1 Define logging categories enum: `containers`, `networking`, `persistence`, `engine`, `app`
- [x] 2.3.2 Update `Loggers.make(category:)` to use categories
- [ ] 2.3.3 Add category-specific log filtering (deferred - basic filtering via log levels)

### 2.4 Performance Metrics
- [x] 2.4.1 Add operation timing via `Loggers.timed()` helper
- [x] 2.4.2 Log container start/stop durations
- [x] 2.4.3 Log image pull progress and duration

## 3. Error Handling (0.5)

### 3.1 Unified Error Types
- [x] 3.1.1 Create `FlyingDutchmanError` protocol in Shared
- [x] 3.1.2 Create `ContainerError` conforming to protocol
- [x] 3.1.3 Create `NetworkingError` conforming to protocol
- [x] 3.1.4 Create `PersistenceError` conforming to protocol
- [x] 3.1.5 Create `EngineError` conforming to protocol

### 3.2 Error Properties
- [x] 3.2.1 Add `userMessage: String` for UI display
- [x] 3.2.2 Add `technicalMessage: String` for logging
- [x] 3.2.3 Add `isRecoverable: Bool` flag
- [x] 3.2.4 Add `suggestedAction: String?` for user guidance

### 3.3 Error Recovery
- [ ] 3.3.1 Implement retry logic for transient errors (network, timeout) (deferred to Phase 1)
- [ ] 3.3.2 Add graceful degradation for non-critical failures (deferred to Phase 1)
- [ ] 3.3.3 Add error aggregation for batch operations (deferred to Phase 1)

### 3.4 Error Integration
- [x] 3.4.1 Update ContainerizationRuntime to throw unified errors
- [ ] 3.4.2 Update ContainerCLIRuntime to throw unified errors (partial - uses existing errors)
- [x] 3.4.3 Add error logging at throw sites

## 4. Testing & Validation

### 4.1 Smoke Tests
- [ ] 4.1.1 Test ContainerizationRuntime can create container (requires macOS 26)
- [ ] 4.1.2 Test RuntimeFactory selects correct runtime
- [ ] 4.1.3 Test logging outputs to file

### 4.2 Integration Tests
- [ ] 4.2.1 Test full container lifecycle (create → start → stop → remove)
- [ ] 4.2.2 Test image pull via OCI registry
- [ ] 4.2.3 Test error recovery scenarios

## 5. Documentation

### 5.1 Update Phase Status
- [ ] 5.1.1 Update `openspec/phases/phase-0/status.md` with completion
- [ ] 5.1.2 Update `openspec/ROADMAP.md` Phase 0 progress
- [x] 5.1.3 Document API changes in design.md

---

## Summary

**Completed**: 32 tasks
**Deferred**: 7 tasks (to Phase 1 or later)
**Remaining**: 6 tasks (testing, documentation updates)

### Key Implementations

1. **ContainerizationRuntime.swift** - Complete rewrite:
   - Uses `ContainerManager` for container lifecycle
   - Two-phase start: `container.create()` → `container.start()`
   - Maps millicores to CPU count, bytes to memory
   - Kernel validation at manager initialization
   - State reconciliation on startup

2. **Logging Infrastructure**:
   - `LoggingConfiguration` - bootstraps swift-log with console + file handlers
   - `FileLogHandler` - writes to dated files with 10MB rotation, 7-day retention
   - `LogCategory` - enum with `.containers`, `.networking`, `.persistence`, `.engine`, `.app`, `.cli`, `.kubernetes`
   - `TimedOperation` - `Loggers.timed()` helper for operation duration logging

3. **Error Handling**:
   - `FlyingDutchmanError` protocol with `userMessage`, `technicalMessage`, `isRecoverable`, `suggestedAction`
   - `ContainerError` - container operations (notFound, invalidState, imageNotFound, etc.)
   - `NetworkingError` - network operations (connectionFailed, timeout, dnsResolutionFailed, etc.)
   - `PersistenceError` - database operations (databaseUnavailable, migrationFailed, etc.)
   - `EngineError` - VM/engine operations (kernelNotFound, vmBootFailed, vsockConnectionFailed, etc.)

4. **RuntimeFactory** - Updated with:
   - Three-state availability: `.native`, `.missingKernel`, `.missingFramework`
   - Comprehensive logging of runtime selection
   - FD_RUNTIME environment variable support (auto, native, cli, stub)
