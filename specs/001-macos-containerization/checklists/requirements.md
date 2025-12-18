# Requirements Checklist: macOS Containerization

**Purpose**: Track implementation status of all requirements for macOS containerization feature
**Created**: 2024-12-18
**Last Updated**: 2024-12-18
**Feature**: [specs/001-macos-containerization/spec.md](../spec.md)

## Phase A.1: GRDB Repositories & Models ✅

**Status**: Complete | **Commit**: `f8824775`

### Data Layer
- [x] CHK001 ContainerStore with full CRUD operations
- [x] CHK002 ImageStore with full CRUD + name/tag lookup
- [x] CHK003 VolumeStore with full CRUD operations
- [x] CHK004 NetworkStore with full CRUD operations
- [x] CHK005 StackStore with full CRUD + create from request
- [x] CHK006 ContainerLogStore with append, fetch, auto-prune
- [x] CHK007 ShimEventStore for Docker API event recording

### Database Schema
- [x] CHK008 v1_core_schema migration (containers, images, stacks, containerStacks)
- [x] CHK009 v3_networks_volumes migration (volumes, networks)
- [x] CHK010 v4_container_logs migration (containerLogs)
- [x] CHK011 v5_shim_events migration (shimEvents)

### Concurrency & Thread Safety
- [x] CHK012 Actor-based stores for thread safety
- [x] CHK013 nonisolated fetchAll() for synchronous reads
- [x] CHK014 @MainActor for EngineClient configuration
- [x] CHK015 Sendable conformance for EngineStatus types

### Seed Data & Testing
- [x] CHK016 SeedData utility with sample data
- [x] CHK017 Test data generators (randomContainer, randomImage)
- [x] CHK018 ContainerStoreTests with 12 test cases
- [x] CHK019 Package.swift updated with test target

## Phase A.2: Docker Shim Server ⏳

**Status**: Pending | **Blockers**: None

### Unix Socket Server
- [ ] CHK020 Unix socket listener at `/var/run/flyingdutchman-docker.sock`
- [ ] CHK021 NIO-based HTTP server over Unix socket
- [ ] CHK022 Graceful shutdown handling

### Docker Engine API v1.41 Subset
- [ ] CHK023 `GET /containers/json` (docker ps)
- [ ] CHK024 `POST /containers/create` (docker create)
- [ ] CHK025 `POST /containers/{id}/start` (docker start)
- [ ] CHK026 `POST /containers/{id}/stop` (docker stop)
- [ ] CHK027 `GET /containers/{id}/logs` (docker logs)
- [ ] CHK028 `GET /images/json` (docker images)
- [ ] CHK029 `POST /images/create` (docker pull - stub)

### Integration
- [ ] CHK030 Wire shim to ContainerStore for persistence
- [ ] CHK031 Error handling for unsupported APIs
- [ ] CHK032 Event recording via ShimEventStore

## Phase A.3: Live UI Integration ⏳

**Status**: Pending | **Blockers**: A.1 ✅, A.2 ⏳

### Data Binding
- [ ] CHK033 Replace EngineClient.listContainers() with ContainerStore
- [ ] CHK034 Wire ContainerListViewModel to GRDB
- [ ] CHK035 Real-time refresh on container changes
- [ ] CHK036 Remove mock data fallbacks

### View Updates
- [ ] CHK037 Update ContainerListView for live data
- [ ] CHK038 Update ImageListView for live data
- [ ] CHK039 Update VolumeListView for live data
- [ ] CHK040 Update NetworkListView for live data

## Phase A.4: Apple Containerization Runtime ⏳

**Status**: Pending | **Blockers**: A.1 ✅

### ContainerizationClient
- [ ] CHK041 Containerization.framework integration
- [ ] CHK042 Create container from OCI image
- [ ] CHK043 Start/stop/pause/resume operations
- [ ] CHK044 Query state and metadata
- [ ] CHK045 Stream logs via NIO

### Fallback & Factory
- [ ] CHK046 RuntimeFactory for runtime selection
- [ ] CHK047 ContainerCLIRuntime fallback implementation
- [ ] CHK048 Wire to ContainerStore for persistence

## Phase A.5: NIO Log Streaming ⏳

**Status**: Pending | **Blockers**: A.4 ⏳

### Streaming Infrastructure
- [ ] CHK049 NIO-based log streaming from container stdout/stderr
- [ ] CHK050 Write logs to GRDB containerLogs table
- [ ] CHK051 SwiftUI AsyncStream binding for LogsView

### UI Features
- [ ] CHK052 Real-time log display
- [ ] CHK053 Log filtering by level/content
- [ ] CHK054 Tail mode (auto-scroll)

## Build Status

| Target | Status |
|--------|--------|
| FlyingDutchmanPersistence | ✅ Builds |
| FlyingDutchmanEngine | ✅ Builds |
| FlyingDutchmanCLI | ✅ Builds |
| FlyingDutchmanContainers | ✅ Builds |
| FlyingDutchmanNetworking | ✅ Builds |
| FlyingDutchmanApp | ⚠️ UI fixes needed (macOS 26 availability) |
| FlyingDutchmanPersistenceTests | ✅ Compiles |

## Notes

- Phase A.1 completed 2024-12-18, commit `f8824775`
- ContainerFixtures replaced with centralized SeedData
- All stores use actor isolation for thread safety
- Database stored at `~/Library/Application Support/flyingdutchman/flyingdutchman.sqlite`
