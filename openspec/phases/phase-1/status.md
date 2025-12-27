# Phase 1: Container Core - Status

phase: 1
status: in-progress
started: 2025-12-27
updated: 2025-12-26
blockers: []

---

## Overview

Container Core phase delivers a Docker-compatible container engine with full lifecycle support, image management, and storage.

**Primary Module**: `FlyingDutchmanContainers`
**Capabilities**: `container-engine`, `container-storage`, `image-management`

---

## Sub-phases

### 1.1 Container Engine 🟡
- [ ] 1. Container CRUD operations (enhance existing)
- [x] 2. Container state machine
- [ ] 3. Compose project support
- [ ] 4. Container logs streaming
- [x] 5. Container event streaming (from Phase 0)
- [x] 6. VSOCK communication (from Phase 0)

**Current Task**: 1.1.3 - Compose YAML parsing + wire compose up/down

**Notes**: Build on Phase 0 foundation. `ContainerizationRuntime` already has create/start/stop/remove. Need to add state machine, streaming, and Compose support.

### 1.2 Image Management ⚪
- [ ] 1. Image pull/push/delete (basic pull exists)
- [ ] 2. Kernel download automation (from Phase 0)
- [ ] 3. BuildKit integration
- [ ] 4. Multi-platform builds
- [ ] 5. Image layer caching
- [ ] 6. Image filesystem exposure (`~/FlyingDutchman/images/`)

**Notes**: OCI registry pull exists in `ContainerizationRuntime`. Need to enhance with proper caching, BuildKit, and expose images to filesystem.

### 1.3 Storage ⚪
- [ ] 1. Bind mount support
- [ ] 2. Named volumes
- [ ] 3. Volume lifecycle management
- [ ] 4. Filesystem exposure (`~/FlyingDutchman/containers/`)

---

## Entry Criteria

All entry criteria met:
- [x] Phase 0 complete
- [x] `ContainerRuntime` protocol defined
- [x] `ContainerizationRuntime` implemented
- [x] Logging and error handling in place
- [x] GRDB persistence working

## Exit Criteria

Phase 1 is complete when:
- [ ] Containers can be created, started, stopped, and removed via native runtime
- [ ] Container state transitions are tracked and observable
- [ ] Docker Compose projects work
- [ ] Container logs can be streamed in real-time
- [ ] Images can be pulled, cached, and deleted
- [ ] Bind mounts and named volumes work
- [ ] Container/image data exposed via filesystem

---

## Blockers

None currently.

---

## Dependencies from Phase 0

Items deferred from Phase 0 that should be addressed in Phase 1:

1. **Container event streaming** (0.3.7) → 1.1.5
2. **VSOCK communication** (0.3.1.1.6) → 1.1.6
3. **Kernel download automation** (0.3.1.4.1, 0.3.1.4.2) → 1.2.2
4. **Error recovery retry logic** (0.5.3.3.1-3) → Throughout Phase 1

---

## Technical Approach

### Container State Machine
```
created → starting → running → stopping → stopped → removing → removed
                 ↑                    ↓
                 └──── restarting ────┘
```

### Key Files to Modify
- `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift` - Add streaming, state machine
- `Sources/Shared/Models/Container.swift` - Add state enum
- `Sources/FlyingDutchmanPersistence/ContainerStore.swift` - Add state tracking

### New Files to Create
- `Sources/FlyingDutchmanContainers/ContainerStateMachine.swift`
- `Sources/FlyingDutchmanContainers/ComposeProjectManager.swift`
- `Sources/FlyingDutchmanContainers/ImageManager.swift`
- `Sources/FlyingDutchmanContainers/VolumeManager.swift`
- `Sources/FlyingDutchmanContainers/KernelManager.swift`
