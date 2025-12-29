# Phase 1 Tasks (Container Core)

updated: 2025-12-29
owner: flying-dutchman

This file is the *source of truth* for Phase 1 execution. It is derived from actual code inspection.

Legend:
* ✅ Done (implemented and reachable in current architecture)
* 🟡 Partial (implemented but incomplete / placeholder / not wired end-to-end)
* ⚪ Not started
* ⛔ Blocker (prevents Phase progress / build / end-to-end)

---

## 1.1 Container Engine

### Runtime + Lifecycle
* ✅ `ContainerizationRuntime` supports create/start/stop/remove with `ContainerManager` + `LinuxContainer`
* ✅ State reconciliation on engine startup (`reconcileState()` called from Engine)
* 🟡 CLI fallback exists (`ContainerCLIRuntime`) but `createContainer` is not implemented (falls back to stub)

### State machine + events
* ✅ `ContainerStateMachine` implemented and integrated into `ContainerizationRuntime`
* ✅ `ContainerEvent` exists and `ContainerEventStore` persists/replays
* ✅ `eventStream() -> AsyncStream<ContainerEvent>` implemented in runtime
* ✅ `/runtime-events` SSE endpoint exposes runtime events via HTTP
* ✅ App UI consumes runtime events via `/runtime-events` SSE

### Logs
* ✅ `getContainerLogs(id:)` returns historical logs from `ContainerLogStore`
* ✅ Live logs: VSOCK streaming protocol implemented for running containers
* 🟡 App UI: Logs are pulled via HTTP polling (`/containers/:id/logs`) rather than true follow streaming

### Compose
* 🟡 `ComposeProjectManager` exists (dependency ordering, up/down/restart)
* ✅ YAML parsing is implemented using `Yams` dependency

### Docker API compatibility shim
* 🟡 `DockerShimServer` exists (ping/version/ps/create/start/stop/rm/images/info)
* 🟡 Logs endpoint is TODO (non-streaming placeholder)

---

## 1.2 Image Management

* ✅ Basic OCI pull implemented in `ContainerizationRuntime` (manifest + layer blobs)
* 🟡 No registry auth flow (will fail on private images / Docker Hub throttling)
* ✅ `ImageCacheManager` implemented (blob metadata + LRU/age eviction)
* ✅ Cache is wired into `ContainerizationRuntime.pullImage` (uses `ImageCacheManager`)
* 🟡 `ImageFilesystemManager` implemented (placeholder exposure) and wired on pull
* ✅ `KernelManager` writes to symlink at `ContainerizationClient.kernelPath`

---

## 1.3 Storage

* ✅ `VolumeManager` exists with named volumes + mount validation
* 🟡 Bind mounts in `ContainerConfig` are represented as `[String] volumes` (parsing/validation exists), but not applied to `LinuxContainer.Configuration`
* ⚪ Container rootfs exposure (Finder-browsable) not implemented

---

## 1.4 Testing

* 🟡 Some tests claimed in `openspec/changes/start-phase-1-container-core/tasks.md` but not verified by scan in this pass
* ⚪ Integration tests for lifecycle/compose/mounts still needed

---

## Blockers (must fix to claim Phase 1.1 “engine complete”)

None.

---

## Recommended next execution slice (best path forward)

1. **Stabilize build + end-to-end “demo loop”**
    * Engine starts
    * App connects
    * Create container → start → logs → stop → remove
2. **Unify event sources**
    * Update UI to use `/runtime-events` instead of `/events`
3. **Then: mounts + filesystem exposure**
