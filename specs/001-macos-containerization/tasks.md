# Tasks: macOS Containerization

**Input**: `specs/001-macos-containerization/` (spec + plan + research)
**Last Updated**: 2024-12-18
**Status**: Phase A.1 Complete ✅

## Phase 1: Setup (Shared Infrastructure)

- [x] T001 [P] Ensure Package.swift declares modules `FlyingDutchmanContainers`, `FlyingDutchmanEngine`, `FlyingDutchmanCLI`, `FlyingDutchmanPersistence`, `FlyingDutchmanKubernetes`, `FlyingDutchmanAI`
- [x] T002 [P] Add dependencies: containerization, SwiftNIO, Hummingbird, AsyncHTTPClient, SwiftkubeClient, GRDB, swift-log, swift-service-lifecycle, swift-argument-parser
- [x] T003 Configure Tuist targets/workspace to mirror SPM modules and enable testing

## Phase 2: Foundational (Blocking Prerequisites)

- [x] T010 Implement engine process with swift-service-lifecycle and launchd plist (`Sources/FlyingDutchmanEngine/EngineMain.swift`)
- [x] T011 Expose internal HTTP API skeleton with Hummingbird (health, version, containers stub) (`Sources/FlyingDutchmanNetworking/Routes/`)
- [x] T012 Wire Containerization client wrapper and GRDB schema for containers/images/networks/volumes/stacks (`Sources/FlyingDutchmanPersistence/Migrations/`)
- [x] T013 Create Docker API shim socket server scaffold mapping minimal routes to engine stubs (`Sources/FlyingDutchmanContainers/DockerShimServer.swift`)

### Phase A.1: GRDB Repositories & Models (Complete ✅)

**Completed**: 2024-12-18 | **Commit**: `f8824775`

- [x] T012a ContainerStore with CRUD + search, fetchRunning, replaceAll, seedIfEmpty (`Sources/FlyingDutchmanPersistence/Repositories/ContainerStore.swift`)
- [x] T012b ImageStore with CRUD + search by name/tag (`Sources/FlyingDutchmanPersistence/Repositories/ImageStore.swift`)
- [x] T012c VolumeStore with CRUD + replaceAll (`Sources/FlyingDutchmanPersistence/Repositories/VolumeStore.swift`)
- [x] T012d NetworkStore with CRUD + replaceAll (`Sources/FlyingDutchmanPersistence/Repositories/NetworkStore.swift`)
- [x] T012e StackStore with CRUD + create from request (`Sources/FlyingDutchmanPersistence/Repositories/StackStore.swift`)
- [x] T012f ContainerLogStore with append, fetch with limit, auto-prune (`Sources/FlyingDutchmanPersistence/Repositories/ContainerLogStore.swift`)
- [x] T012g ShimEventStore for Docker event recording (`Sources/FlyingDutchmanPersistence/Repositories/ShimEventStore.swift`)
- [x] T012h SeedData utility with sample data and test generators (`Sources/FlyingDutchmanPersistence/SeedData.swift`)
- [x] T012i Database migrations: v1_core_schema, v3_networks_volumes, v4_container_logs, v5_shim_events
- [x] T012j ContainerStoreTests with 12 test cases (`Tests/FlyingDutchmanPersistenceTests/ContainerStoreTests.swift`)
- [x] T012k Concurrency fixes: nonisolated fetchAll(), @MainActor EngineClient, Sendable conformance

## Phase 3: User Story 1 – Launch and View Container Status (P1)

- [x] T020 Implement engine status endpoint using Containerization to list containers with states
- [x] T021 Bind UI status view to engine endpoint; render SF Symbols 7 state transitions

## Phase 4: User Story 2 – Manage Individual Containers (P1)

- [ ] T030 Add start/stop/restart APIs calling Containerization run/stop with graceful handling
- [ ] T031 Surface container detail view (image, ports, volumes, creation time) and transition animations

## Phase 5: User Story 3 – Pull and Manage Images (P2)

- [x] T040 Implement image pull endpoint using AsyncHTTPClient + Containerization; stream progress
- [x] T041 Persist images metadata in GRDB and display in UI list (ImageStore complete)
- [x] T042 Error handling for auth/network failures with remediation messages

## Phase 6: User Story 4 – Execute Commands via CLI (P2)

- [x] T050 Add CLI commands `version`, `containers list`, `containers start/stop` wiring to engine HTTP/XPC
- [x] T051 Add CLI error reporting with actionable guidance for engine connectivity issues

## Phase 7: User Story 5 – Organize Containers in Projects/Stacks (P3)

- [x] T060 Define GRDB models for projects/stacks and relationships to containers (StackStore complete)
- [ ] T061 Implement start/stop stack operations with dependency ordering
- [ ] T062 UI list and actions for stacks with empty-state guidance

## Phase 8: User Story 6 – Access Logs and Metrics (P3)

- [x] T070a ContainerLogStore persistence layer complete (append, fetch, prune)
- [ ] T070b Implement log streaming path (Containerization → NIO → UI) with filters
- [ ] T071 Add metrics sampling (CPU/mem) and display with SF Symbol draw effects

## Phase 9: User Story 7 – Docker API Compatibility Shim (P2)

- [x] T080 Implement Docker HTTP subset (ps/create/start/logs/pull) over Unix socket `/var/run/flyingdutchman-docker.sock`
- [x] T081 Map shim requests to Containerization operations and persist mappings in GRDB (CLI runtime placeholder available via FD_RUNTIME=cli; native pending Containerization.framework)
- [x] T082 Return explicit unsupported-feature errors and optional Podman fallback hints

## Phase 10: User Story 8 – Flying Dutchman Dev Cluster (P3)

- [ ] T090 Automate dev cluster creation with K3s running in Apple Container or micro-VM; publish kubeconfig
- [ ] T091 Integrate SwiftkubeClient app-centric views (apps → deployments/services/pods) with live status/logs
- [ ] T092 Implement cluster teardown/recovery flows and resource cleanup

## Phase 11: Pipelines & AI (Optional per PRD, P3)

- [ ] T100 Define pipeline schema (YAML/Swift DSL) and executor for build/test/push/deploy steps
- [ ] T101 Integrate Stakpak/SwiftAI hooks for diagnostics and workflow generation (behind feature flag)

## Phase 12: Polish & Cross-Cutting

- [x] T110 Platform gating and diagnostics for Tahoe/Apple Silicon and Containerization availability
- [ ] T111 Performance pass: ensure list/start/stop/pull within latency targets; profile shim
- [x] T112 Update quickstart.md with docker-host setup, cluster creation, and CLI usage

## Dependencies & Execution Order

- Phases 1–2 block all user stories; shim (Phase 9) depends on engine APIs (T010–T013).
- Dev cluster (Phase 10) depends on Containerization + networking + persistence groundwork.
- Pipelines/AI (Phase 11) optional; enable after core container flows are stable.

---

## Implementation Progress

### Completed Phases
| Phase | Status | Date | Commit |
|-------|--------|------|--------|
| A.1 GRDB Repositories | ✅ Complete | 2024-12-18 | `f8824775` |

### Next Up
| Phase | Description | Blockers |
|-------|-------------|----------|
| A.2 | Docker Shim Server | None (A.1 complete) |
| A.3 | Live UI Integration | A.1, A.2 |
| A.4 | Apple Containerization Runtime | A.1 |
| A.5 | NIO Log Streaming | A.4 |

### Build Status
- ✅ FlyingDutchmanPersistence
- ✅ FlyingDutchmanEngine
- ✅ FlyingDutchmanCLI
- ✅ FlyingDutchmanContainers
- ✅ FlyingDutchmanNetworking
- ⚠️ FlyingDutchmanApp (UI fixes needed for macOS 26 availability)
