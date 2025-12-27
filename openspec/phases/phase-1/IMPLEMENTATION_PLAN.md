# Phase 1 Implementation Plan

updated: 2025-12-26
status: in-progress

This document tracks the implementation order for Phase 1, designed for sequential agent handoff.

---

## Architecture Understanding (from apple/containerization)

* **vminitd** is the init process inside each container VM
* It provides a **gRPC API over VSOCK** for:
  - Spawning/managing processes
  - I/O streaming (logs)
  - Signals and events
* The host calls `dialVsock(port:)` to connect to vminitd inside the VM
* Log streaming = connect to VSOCK → read gRPC stream → yield lines

---

## Current Blockers (ordered by impact)

### Blocker 1: Compose YAML Parsing ⛔
* **File**: `Sources/FlyingDutchmanContainers/ComposeProjectManager.swift`
* **Problem**: `ComposeYAMLDecoder.decode` always throws "not implemented"
* **Fix**: Add Yams dependency or implement minimal parser
* **Impact**: Compose up/down is completely broken

### Blocker 2: Live Log Streaming Protocol ⛔
* **File**: `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`
* **Problem**: `getContainerLogs` dials VSOCK port 1024 but protocol not implemented
* **Fix**: Implement gRPC/framed protocol to read log lines from vminitd
* **Impact**: Live logs don't work (only historical)

### Blocker 3: Kernel Path Inconsistency ⛔
* **Files**:
  - `ContainerizationClient.kernelPath` → `.../kernel/vmlinux`
  - `KernelManager.kernelPath(for:)` → `.../kernels/vmlinux-<version>`
* **Fix**: Unify paths; default kernel should be at expected location
* **Impact**: Runtime may report "kernel not found" even when downloaded

### Blocker 4: Event Source Confusion 🟡
* **App** uses `/events` → `ShimEventStore` (Docker-style events)
* **Runtime** has `ContainerEventStore` with `eventStream()` (not exposed via HTTP)
* **Fix**: Either expose runtime events via HTTP, or consolidate into one store
* **Impact**: UI events don't reflect actual runtime state changes

---

## Implementation Order

### Step 1: Fix Kernel Path Consistency ✅
**Completed**: 2025-12-26
**Files modified**:
- `Sources/FlyingDutchmanContainers/KernelManager.swift`
- `Sources/FlyingDutchmanContainers/ContainerizationClient.swift` (checked, no changes needed as KernelManager now adapts)

**Action**: `KernelManager` now creates a symlink at `ContainerizationClient.kernelPath` pointing to the actual downloaded kernel.

---

### Step 2: Add Yams Dependency + Implement YAML Parsing ✅
**Completed**: 2025-12-26
**Files modified**:
- `Package.swift` (added Yams)
- `Sources/FlyingDutchmanContainers/ComposeProjectManager.swift` (implemented `ComposeYAMLDecoder` using Yams)

**Action**: Replaced placeholder `ComposeYAMLDecoder` with real Yams-based parsing.

---

### Step 3: Implement Log Streaming Protocol
**Estimated**: 1-2 hours
**Files to modify**:
- `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`
- `Sources/FlyingDutchmanContainers/Transport/ControlPlaneCodec.swift`
- `Sources/FlyingDutchmanContainers/Transport/LogStreamHandler.swift`

**Action**:
1. Use `dialVsock(port: 1024)` to get handle
2. Bridge handle to NIO channel
3. Decode length-prefixed JSON frames
4. Yield log lines to AsyncStream

**Reference**: Apple's vminitd uses gRPC over VSOCK; we can use simplified framing.

---

### Step 4: Expose Runtime Events via HTTP
**Estimated**: 30 min
**Files to modify**:
- `Sources/FlyingDutchmanNetworking/Server.swift`
- `Sources/FlyingDutchmanNetworking/Routes/EventsRoutes.swift` (create if needed)

**Action**: Add `/runtime-events` SSE endpoint that forwards `runtime.eventStream()`.

---

### Step 5: Wire UI to Runtime Events (optional, Phase 1 scope creep)
**Estimated**: 1 hour
**Files to modify**:
- `Sources/FlyingDutchmanApp/Content/EventsView.swift`
- `Sources/FlyingDutchmanNetworking/Client.swift`

**Action**: Make `EventsViewModel` subscribe to `/runtime-events` instead of `/events`.

---

## Handoff Protocol

When you finish a step:
1. Mark it ✅ in this file
2. Update `openspec/phases/phase-1/tasks.md` checkboxes
3. Commit with message: `phase-1: complete step N - <description>`

When you hit a blocker:
1. Document it in this file under "New Blockers"
2. Provide exact error message and file/line
3. Suggest fix if known

---

## New Blockers (agent-discovered)

*(Add here as you encounter them)*

