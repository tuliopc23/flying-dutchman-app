# Flying Dutchman - Technical Specification
**Version**: 1.0  
**Date**: 2026-01-20  
**Status**: Active  
**Phase**: Sprint 1-6 Planning (Post-Phase 1 Completion)

---

## 1. Technical Context

### 1.1 Technology Stack
- **Language**: Swift 6.2 with strict concurrency checking
- **Platform**: macOS 26.0+ (Tahoe), Apple Silicon only (arm64)
- **Containerization**: Apple Containerization framework 0.21.1
- **Persistence**: GRDB.swift 7.8+ (SQLite)
- **HTTP Server**: Hummingbird 2.0+ (lightweight async/await)
- **UI Framework**: SwiftUI + SwiftData (UI state only)
- **CLI Framework**: ArgumentParser 1.3+
- **Networking**: SwiftNIO 2.60+, AsyncHTTPClient 1.20+
- **Build System**: Swift Package Manager (Package.swift)
- **Project Management**: OpenSpec workflow (spec-driven development)

### 1.2 Architecture Overview
**Multi-target architecture** with 3 executables and 6 library modules:

**Executables**:
- `FlyingDutchmanApp` - SwiftUI macOS application (285 LOC main file)
- `FlyingDutchmanEngine` - Background daemon/server (65 LOC main file)
- `FlyingDutchmanCLI` - Command-line interface (26 KB main file)

**Libraries**:
- `Shared` - Common types, models, logging, error handling, config
- `FlyingDutchmanContainers` - Runtime abstraction, Containerization integration (826 LOC for ContainerizationRuntime)
- `FlyingDutchmanPersistence` - GRDB repositories, migrations (140 LOC Database.swift, 7 migrations)
- `FlyingDutchmanNetworking` - HTTP server routes, XPC client/server
- `FlyingDutchmanKubernetes` - SwiftkubeClient (stubbed, 331 bytes)
- `FlyingDutchmanAI` - AI insights (stubbed, 233 bytes)

**Dependency Flow**:
```
App → Networking → Containers → Shared
    ↘ Persistence ↗

Engine → Networking + Persistence + Containers

CLI → Networking + Containers + Persistence
```

### 1.3 Current Codebase Metrics
- **Total Files**: 105 Swift files
- **Total Lines of Code**: ~12,970 LOC in Sources/
- **Test Files**: 5 files (only Containers + Persistence modules)
- **Test Coverage**: ~10% estimated (5/105 files)
- **Database Tables**: 8 tables (containers, images, stacks, volumes, networks, containerLogs, shimEvents, containerEvents, blobMetadata)
- **HTTP Endpoints**: 6 route groups (~30 endpoints total)
- **XPC Protocol**: 1 protocol (EngineXPCProtocol)

### 1.4 Current Build Status
**❌ BROKEN** - Missing test directories:
```
error: invalid custom path 'Tests/FlyingDutchmanAppTests' for target 'FlyingDutchmanAppTests'
```

**Missing Directories**:
- `Tests/FlyingDutchmanAppTests/`
- `Tests/FlyingDutchmanEngineTests/`
- `Tests/FlyingDutchmanCLITests/`
- `Tests/IntegrationTests/`

---

## 2. Current State Assessment

### 2.1 What's Working Well ✅
1. **Clean Architecture**: Module boundaries are well-defined, no circular dependencies
2. **Runtime Abstraction**: `ContainerRuntimeProtocol` cleanly abstracts Apple Containerization framework
3. **Persistence**: GRDB with 7 migrations, structured repositories
4. **Container Lifecycle**: State machine prevents invalid transitions, event streaming works
5. **VSOCK Communication**: Length-prefixed JSON protocol for log streaming
6. **Design System**: "Liquid Glass" with tokens (Colors, Typography, Spacing, Shadows)
7. **OpenSpec Workflow**: Well-documented phases, specs, and change tracking
8. **Swift 6.2 Compliance**: Strict concurrency, Sendable, async/await throughout

### 2.2 Critical Gaps 🔴
1. **Build Broken**: Missing test directories block `swift build` and `swift test`
2. **Test Coverage**: Only 5 test files, ~10% coverage, 0 integration tests
3. **Phase 1 Incomplete**: Phase 1.3 (Storage) not started - no bind mounts, named volumes
4. **Docker API Partial**: Missing attach, build, volume/network CRUD endpoints
5. **Performance Unknown**: No benchmarks, no Instruments profiling
6. **No Documentation**: Missing README.md, architecture diagrams, API docs (DocC)
7. **Accessibility Unaudited**: No VoiceOver, keyboard navigation, or Accessibility Inspector testing

### 2.3 Phase Progress
**Phase 0: Foundation** ✅ 100% Complete
**Phase 1: Container Core** 🟡 95% Complete
- **1.1 Container Engine** ✅ 100% - CRUD, state machine, logs, events, Compose YAML
- **1.2 Image Management** 🟡 60% - Kernel download, cache wired, BuildKit/multi-platform missing
- **1.3 Storage** ❌ 0% - Bind mounts, named volumes, filesystem exposure not started

**Phase 2-4** ⚪ 0% Not Started

---

## 3. Implementation Approach

### 3.1 Strategic Priorities (Next 6 Sprints)
Following the requirements.md recommendations:

**Sprint 1 (Immediate - 1-2 weeks)**: Stabilize foundation, fix build, establish quality baseline
**Sprint 2-3 (Short Term - 2-4 weeks)**: Docker API parity, performance baseline, Phase 2 start
**Sprint 4-6 (Medium Term - 1-2 months)**: Complete Phase 2 (Networking), Phase 3 start (Kubernetes/CLI)

### 3.2 Design Principles (from CLAUDE.md Constitution 1.0.0)
All implementation MUST align with:
1. **Platform Constraints**: macOS 26.0+ (Tahoe), Apple Silicon only (NON-NEGOTIABLE)
2. **Native-First**: Prefer Apple frameworks over cross-platform alternatives
3. **Swift-Only**: 100% Swift 6.2, strict concurrency
4. **Local-First**: Single-developer workflows, not enterprise
5. **"It Just Works"**: Zero-config defaults, fast (<2s launch, <500ms container start)
6. **Minimal/Surgical**: Change only what's necessary, no scope creep
7. **Opinionated**: Guided workflows, command palette (⌘K), not generic wrappers

### 3.3 Technical Approach

#### 3.3.1 Build Fix Strategy
**Problem**: Package.swift declares test targets with missing directories  
**Solution**: Create minimal placeholder tests for all 4 missing targets

**Why not remove targets from Package.swift?**
- Test targets document intended test coverage
- Creating placeholders encourages future test development
- Keeps CI/CD infrastructure ready

#### 3.3.2 Testing Strategy
**Goal**: >60% test coverage (unit + integration)

**Layers**:
1. **Unit Tests** (per module):
   - `FlyingDutchmanContainers`: State machine, cache, volumes, runtime factory
   - `FlyingDutchmanPersistence`: All 7 stores + migrations
   - `FlyingDutchmanNetworking`: Routes, XPC protocol, client
   - `Shared`: Error handling, logging, runtime checks

2. **Integration Tests**:
   - Engine startup/shutdown cycle
   - Container lifecycle via HTTP API (create → start → stop → delete)
   - XPC client/server contract
   - GRDB store round-trips
   - VSOCK log streaming end-to-end

3. **UI Tests** (XCUITest):
   - App launches without crash
   - Container list loads from engine
   - Logs stream in real-time
   - Command palette opens (⌘K)

#### 3.3.3 Storage Implementation (Phase 1.3)
**Apple Containerization Framework Dependencies**:
- `LinuxContainer.Configuration.mounts` - Bind mounts array
- `VolumeManager` - Named volume lifecycle (create, delete, inspect)
- `ImageFilesystemManager` - Layer extraction to `~/FlyingDutchman/images/`

**Persistence**:
- `VolumeStore` - Already exists, extend CRUD
- `VolumesRoutes` - Already exists, wire to VolumeManager
- Database schema - `volumes` table already exists (migration v3)

**Implementation Steps**:
1. Extend `ContainerConfig` to support mounts array
2. Implement `VolumeManager.createVolume(name:)` → `Volume`
3. Wire `VolumesRoutes` to VolumeManager CRUD
4. Update `ContainerizationRuntime.createContainer()` to mount volumes
5. Expose filesystems to `~/FlyingDutchman/containers/{id}/rootfs`

#### 3.3.4 Docker API Compatibility Strategy
**Missing Endpoints** (high priority):
- `POST /containers/{id}/attach` - WebSocket log streaming (alternative to VSOCK)
- `POST /images/build` - BuildKit integration (Phase 1.2 completion)
- `POST /volumes/create`, `DELETE /volumes/{id}` - Volume CRUD (Phase 1.3)
- `POST /networks/create`, `DELETE /networks/{id}` - Network CRUD (Phase 2.1)
- `GET /containers/{id}/logs` - Historical logs endpoint (complement VSOCK streaming)

**Compatibility Testing**:
- Use Docker CLI as reference client
- Test `docker-compose` compatibility
- Test lazydocker compatibility
- Document deviations in `COMPATIBILITY.md`

#### 3.3.5 Performance Benchmarking
**XCTest Performance Suite**:
```swift
func testAppLaunchPerformance() {
    measure { 
        // Measure cold start time (target: <2s)
    }
}

func testContainerStartLatency() {
    measure {
        // Measure container start (target: <500ms)
    }
}

func testLogStreamingThroughput() {
    measure {
        // Measure log streaming latency (target: <100ms)
    }
}
```

**Instruments Profiling**:
- Time Profiler - Identify hotspots
- Allocations - Memory leaks, high watermark
- System Trace - Thread scheduling, I/O

**Load Testing**:
- 100 containers - UI responsiveness
- 1000 containers - Database query performance
- 1M log entries - Log store performance

#### 3.3.6 Documentation Strategy
**Phase 1 Documentation** (Sprint 1):
- `README.md` - Installation, quick start, architecture overview
- `ARCHITECTURE.md` - Module dependencies diagram (Mermaid)
- `XPC_PROTOCOL.md` - XPC contract documentation

**Phase 2+ Documentation**:
- `API.md` - Docker API compatibility matrix
- `PERFORMANCE.md` - Benchmark results, optimization notes
- `CONTRIBUTING.md` - Development setup, testing guidelines
- DocC - Public API documentation (Phase 4)

---

## 4. Source Code Structure Changes

### 4.1 New Test Files (Sprint 1)

#### Create `Tests/FlyingDutchmanAppTests/AppBootstrapTests.swift`
**Purpose**: Test app startup, UI state loading, engine client configuration
**Coverage**: RootContainerView bootstrap, SwiftData UIState persistence

#### Create `Tests/FlyingDutchmanEngineTests/EngineServerTests.swift`
**Purpose**: Test engine startup, HTTP server binding, XPC listener startup
**Coverage**: FlyingDutchmanEngineMain, EngineServer lifecycle

#### Create `Tests/FlyingDutchmanCLITests/DoctorCommandTests.swift`
**Purpose**: Test CLI doctor command output, diagnostics accuracy
**Coverage**: Platform checks, containerization framework detection, engine health

#### Create `Tests/IntegrationTests/ContainerLifecycleTests.swift`
**Purpose**: End-to-end container lifecycle via HTTP API
**Coverage**: Engine → Runtime → Persistence → HTTP API → Client round-trip

### 4.2 Extended Implementation Files (Sprint 1-2)

#### Extend `Sources/FlyingDutchmanContainers/VolumeManager.swift`
**Add**:
- `createVolume(name: String) async throws -> Volume`
- `deleteVolume(id: UUID) async throws`
- `inspectVolume(id: UUID) async throws -> Volume`
- `listVolumes() async throws -> [Volume]`

#### Extend `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`
**Add**:
- Support for `LinuxContainer.Configuration.mounts` binding
- Filesystem exposure to `~/FlyingDutchman/containers/{id}/rootfs`

#### Extend `Sources/FlyingDutchmanNetworking/Routes/VolumesRoutes.swift`
**Add**:
- `POST /volumes/create` → `VolumeManager.createVolume()`
- `DELETE /volumes/{id}` → `VolumeManager.deleteVolume()`
- `GET /volumes/{id}` → `VolumeManager.inspectVolume()`

#### Extend `Sources/FlyingDutchmanNetworking/Routes/ImagesRoutes.swift`
**Add**:
- `POST /images/build` → BuildKit integration (Phase 1.2 completion)

#### Create `Sources/FlyingDutchmanApp/Components/CommandPalette.swift`
**Purpose**: Implement ⌘K command palette (Phase 4.2, but foundational)
**Dependencies**: Use existing `CommandRegistry` from Shared

### 4.3 New Documentation Files (Sprint 1)

#### Create `README.md` (root)
**Sections**:
- Project overview (single-paragraph vision)
- Requirements (macOS 26+, Apple Silicon)
- Installation (`swift build`, `swift run FlyingDutchmanEngine`)
- Quick start (basic container workflow)
- Architecture overview (link to ARCHITECTURE.md)
- Phase roadmap (link to openspec/ROADMAP.md)

#### Create `ARCHITECTURE.md`
**Sections**:
- Module dependency graph (Mermaid diagram)
- Data flow (App → XPC → Engine → Runtime → Containerization)
- Persistence layer (GRDB schema, migrations)
- Communication protocols (XPC, HTTP, VSOCK)

#### Create `XPC_PROTOCOL.md`
**Sections**:
- `EngineXPCProtocol` contract
- Client usage (`EngineXPCClient`)
- Server implementation (`EngineXPCService`)
- Error handling, timeouts

---

## 5. Data Model / API / Interface Changes

### 5.1 Database Schema (No Changes Required)
**Status**: Schema already supports Phase 1.3
- `volumes` table exists (migration v3_networks_volumes)
- `blobMetadata` table exists (migration v7_blob_metadata)

**Future Migrations** (Phase 2+):
- Phase 2.1: Extend `networks` table with driver, gateway, IPAM
- Phase 3.1: Add `machines` table for Linux VMs

### 5.2 HTTP API Extensions (Sprint 2)

#### Volume Endpoints (Phase 1.3)
```
POST   /volumes/create        Body: { name, driver?, mountPath? }
DELETE /volumes/{id}           
GET    /volumes/{id}           → Volume details
GET    /volumes                → List all volumes
```

#### Image Build Endpoint (Phase 1.2)
```
POST   /images/build           Body: { context, dockerfile, tags[] }
                                → Stream build logs via SSE
```

#### Attach Endpoint (Docker compatibility)
```
POST   /containers/{id}/attach  WebSocket for stdin/stdout/stderr
```

#### Historical Logs Endpoint (Complement VSOCK)
```
GET    /containers/{id}/logs   Query params: since, until, tail, follow
                                → Stream logs from ContainerLogStore
```

### 5.3 XPC Protocol Extensions (Sprint 2)
**Add to `EngineXPCProtocol`**:
```swift
protocol EngineXPCProtocol {
    // Existing: fetchStatus()
    
    // New:
    func createVolume(name: String) async throws -> Volume
    func deleteVolume(id: UUID) async throws
    func listVolumes() async throws -> [Volume]
    func buildImage(context: URL, dockerfile: String, tags: [String]) async throws
}
```

### 5.4 ContainerConfig Extensions (Phase 1.3)
**Extend `Shared/Models/Container.swift`**:
```swift
public struct ContainerConfig: Codable, Sendable {
    public var ports: [String]?
    public var env: [String: String]?
    
    // NEW: Bind mounts and named volumes
    public var mounts: [Mount]?
    
    public struct Mount: Codable, Sendable {
        public enum MountType: String, Codable {
            case bind      // Host path → container path
            case volume    // Named volume → container path
        }
        
        public let type: MountType
        public let source: String      // Host path or volume name
        public let destination: String  // Container path
        public let readOnly: Bool
    }
}
```

---

## 6. Delivery Phases

### Phase 1: Sprint 1 - Foundation Stabilization (1-2 weeks)
**Goal**: Fix build, establish test baseline, complete Phase 1.3 Storage  
**Entry Criteria**: Build broken, 10% test coverage, Phase 1.3 incomplete  
**Exit Criteria**: Build succeeds, >20% test coverage, Phase 1 100% complete

**Tasks**:
1. **Build Fix** (1 day)
   - Create 4 missing test directories
   - Add placeholder test files (AppBootstrapTests, EngineServerTests, DoctorCommandTests, ContainerLifecycleTests)
   - Verify `swift build` and `swift test` succeed

2. **Integration Test Suite** (3 days)
   - `ContainerLifecycleTests.swift` - Create → Start → Stop → Delete via HTTP
   - `XPCContractTests.swift` - Client/server communication
   - `PersistenceRoundTripTests.swift` - All 7 stores
   - `VSOCKLogStreamingTests.swift` - End-to-end log streaming

3. **Complete Phase 1.3: Storage** (5 days)
   - Implement `VolumeManager` CRUD (create, delete, inspect, list)
   - Extend `ContainerConfig` with mounts array
   - Wire `VolumesRoutes` to VolumeManager
   - Update `ContainerizationRuntime.createContainer()` for volume mounting
   - Expose filesystems to `~/FlyingDutchman/containers/{id}/rootfs`
   - Add `VolumeManagerTests.swift` (already exists, extend)

4. **Documentation Baseline** (2 days)
   - Write `README.md` (installation, quick start, architecture overview)
   - Write `ARCHITECTURE.md` (module dependencies Mermaid diagram)
   - Write `XPC_PROTOCOL.md` (contract, usage, error handling)

**Success Metrics**:
- ✅ `swift build` exits 0
- ✅ `swift test` exits 0, >20% coverage
- ✅ All Phase 1 sub-phases checked off in ROADMAP.md
- ✅ `README.md` exists with <5 minute quick start

**Risks**:
- VolumeManager integration may uncover Containerization framework limitations
- Test infrastructure setup may take longer than estimated

---

### Phase 2: Sprint 2-3 - Docker API Parity & Performance (2-4 weeks)
**Goal**: Docker CLI compatibility, performance benchmarks, Phase 2 start  
**Entry Criteria**: Phase 1 complete, 20% test coverage  
**Exit Criteria**: Docker Compose works, <2s app launch, port forwarding works

**Tasks**:
1. **Docker API Compatibility** (4 days)
   - Implement `POST /containers/{id}/attach` (WebSocket)
   - Implement `POST /images/build` (BuildKit via ContainerizationBuild)
   - Implement `GET /containers/{id}/logs` (historical from ContainerLogStore)
   - Add API contract tests (compare with Docker Engine API 1.43)
   - Test with `docker-compose`, `lazydocker`
   - Document compatibility in `API.md`

2. **Performance Benchmarking** (3 days)
   - Add `PerformanceTests.swift` (app launch, container start, log streaming)
   - Profile with Instruments (Time Profiler, Allocations)
   - Load test 100/1000 containers
   - Load test 1M log entries
   - Document results in `PERFORMANCE.md`

3. **UI Polish** (3 days)
   - Implement `CommandPalette.swift` (⌘K, fuzzy search)
   - Add empty state cards (new user onboarding)
   - Add keyboard navigation (Tab, arrows, Enter)
   - Add engine status indicator to window titlebar

4. **Phase 2.1: Core Networking** (start) (5 days)
   - Implement bridge network driver (ContainerizationNetworking)
   - Port forwarding via VSOCK (`-p 8080:80`)
   - Add `NetworksRoutes` CRUD endpoints
   - Add `NetworkManagerTests.swift`

**Success Metrics**:
- ✅ `docker-compose up` works without modification
- ✅ App launch <2s, container start <500ms
- ✅ Command palette functional with all seeded commands
- ✅ Port forwarding works (`curl localhost:8080` → container:80)

**Risks**:
- BuildKit integration may require additional dependencies
- Port forwarding via VSOCK may have Apple framework limitations
- Performance targets may require optimization

---

### Phase 3: Sprint 4-6 - Networking Complete, Kubernetes Start (1-2 months)
**Goal**: Complete Phase 2 (Networking), start Phase 3 (Kubernetes)  
**Entry Criteria**: Docker API parity, performance baseline  
**Exit Criteria**: HTTPS works, K3s cluster provisions in <60s

**Tasks**:
1. **Phase 2.2: DNS & Domains** (5 days)
   - Local DNS resolver (DNSClient integration)
   - Zero-config domains (`container.fd.local`)
   - Compose service domains (`service.project.fd.local`)
   - Add `DNSResolverTests.swift`

2. **Phase 2.3: HTTPS** (4 days)
   - Local CA generation (swift-certificates)
   - Automatic cert provisioning per container
   - Reverse proxy via Hummingbird TLS
   - Test `curl https://myapp.fd.local` (zero-config)

3. **Phase 3.2: Kubernetes** (start) (7 days)
   - Single-node K3s cluster provisioning
   - kubectl integration (exec via Process)
   - Service exposure to host
   - `*.k8s.fd.local` domain routing
   - Add `KubernetesClientTests.swift`

4. **UI Test Suite** (3 days)
   - Add `UITests/` target to Package.swift
   - App launch smoke test
   - Container list navigation test
   - Logs streaming test
   - Snapshot tests for design system regression

**Success Metrics**:
- ✅ `curl https://myapp.fd.local` works (zero-config HTTPS)
- ✅ K3s cluster provisions in <60s
- ✅ kubectl commands work (`kubectl get pods`)
- ✅ UI tests prevent visual regressions

**Risks**:
- DNS resolver may conflict with system DNS
- HTTPS reverse proxy may have certificate trust issues
- K3s provisioning may exceed 60s target
- UI testing infrastructure may be complex to set up

---

### Phase 4: Future Phases (Out of Scope for Current Spec)
**Phase 3.1**: Linux Machines (VMs, file sharing, SSH)  
**Phase 3.3**: CLI/Headless (daemon management, shell completion)  
**Phase 4.1-4.4**: UX Polish (menu bar, debug shell, settings, accessibility)  
**1.0 Release**: Security audit, notarization, documentation

---

## 7. Verification Approach

### 7.1 Build Verification
**Command**: `swift build`  
**Expected**: Exit code 0, all targets compile  
**Current**: ❌ Exit code 1 (missing test directories)  
**Post-Sprint 1**: ✅ Exit code 0

### 7.2 Test Verification
**Command**: `swift test`  
**Expected**: All tests pass, >60% coverage (target), >20% coverage (Sprint 1)  
**Current**: ❌ Cannot run (build broken)  
**Post-Sprint 1**: ✅ >20% coverage

**Coverage Tracking**:
```bash
swift test --enable-code-coverage
xcrun llvm-cov report \
  .build/debug/FlyingDutchmanPackageTests.xctest/Contents/MacOS/FlyingDutchmanPackageTests \
  -instr-profile=.build/debug/codecov/default.profdata
```

### 7.3 Lint Verification
**Command**: `./scripts/lint.sh`  
**Tools**: SwiftFormat + SwiftLint  
**Expected**: 0 violations (100% pass rate)  
**Current**: Unknown (script exists, not verified in evaluation)

### 7.4 Integration Testing
**Engine Startup**:
```bash
swift run FlyingDutchmanEngine &
ENGINE_PID=$!
sleep 3
curl http://localhost:8080/health
# Expected: {"status":"ok"}
kill $ENGINE_PID
```

**Container Lifecycle**:
```bash
# Create container via HTTP API
curl -X POST http://localhost:8080/containers/create \
  -H 'Content-Type: application/json' \
  -d '{"name":"test","image":"alpine:latest"}'

# Start container
curl -X POST http://localhost:8080/containers/{id}/start

# Verify running
curl http://localhost:8080/containers/{id}
# Expected: {"status":"running"}

# Stop and delete
curl -X POST http://localhost:8080/containers/{id}/stop
curl -X DELETE http://localhost:8080/containers/{id}
```

**Docker CLI Compatibility** (Sprint 2):
```bash
export DOCKER_HOST=http://localhost:8080
docker ps
docker run -d --name nginx -p 8080:80 nginx:alpine
docker logs nginx
docker stop nginx
docker rm nginx
```

### 7.5 Performance Verification (Sprint 2)
**App Launch**:
```bash
time open -a FlyingDutchman
# Expected: <2s (from open to window visible)
```

**Container Start**:
```bash
time curl -X POST http://localhost:8080/containers/{id}/start
# Expected: <500ms (HTTP response time)
```

**Log Streaming Latency**:
```bash
# Measure time from container log write to UI display
# Expected: <100ms
```

### 7.6 Load Testing (Sprint 2)
**100 Containers**:
```bash
for i in {1..100}; do
  curl -X POST http://localhost:8080/containers/create \
    -d "{\"name\":\"load-$i\",\"image\":\"alpine:latest\"}" &
done
wait
# Measure: UI responsiveness, database query time
```

**1M Log Entries**:
```bash
# Generate 1M log entries via containers
# Measure: ContainerLogStore write performance, UI log viewer responsiveness
```

### 7.7 Accessibility Verification (Phase 4)
**Tools**:
- Accessibility Inspector (macOS built-in)
- VoiceOver (⌘F5)
- Keyboard navigation testing

**Criteria**:
- ✅ All actions accessible via keyboard
- ✅ VoiceOver announces all UI elements
- ✅ Accessibility Inspector score >90%
- ✅ Color contrast WCAG AA compliant

### 7.8 Documentation Verification
**README.md**:
- ✅ Quick start completes in <5 minutes
- ✅ All commands execute without errors
- ✅ Architecture diagram renders (Mermaid)

**API Documentation**:
- ✅ All public APIs documented with DocC (Phase 4)
- ✅ Code examples compile and run

---

## 8. Risk Assessment & Mitigation

### 8.1 Technical Risks

#### Platform Risk 🔴 HIGH
**Risk**: Apple Containerization framework is pre-1.0 (v0.21.1)  
**Impact**: Breaking API changes could require significant refactoring  
**Mitigation**:
- Pin to exact version in Package.swift (✅ already done)
- Monitor apple/containerization GitHub releases
- Abstract framework-specific code behind `ContainerRuntimeProtocol` (✅ already done)
- Maintain `StubContainerRuntime` as fallback

#### Dependency Risk 🟡 MEDIUM
**Risk**: 40+ transitive dependencies (SwiftNIO ecosystem)  
**Impact**: Version conflicts, supply chain vulnerabilities  
**Mitigation**:
- Use Swift Package Index for maintenance monitoring (✅ documented)
- Pin all dependencies with exact versions (consider)
- Schedule quarterly dependency audit
- Lock file versioning (Package.resolved)

#### Performance Risk ⚠️ LOW-MEDIUM
**Risk**: GRDB at scale (10k+ containers, 1M+ log entries)  
**Impact**: UI slowdowns, high memory usage  
**Mitigation**:
- Implement log pruning policy (e.g., keep 30 days, max 1M entries)
- Add database indices on frequently queried columns (✅ already indexed)
- Lazy loading + pagination in UI (implement in Sprint 2)
- Performance testing with load (Sprint 2)

#### BuildKit Integration Risk 🟡 MEDIUM
**Risk**: BuildKit may not integrate cleanly with Containerization framework  
**Impact**: Image build feature delayed or limited  
**Mitigation**:
- Research ContainerizationBuild APIs (Sprint 2 Phase 1)
- Fallback to `docker buildx` CLI wrapper if necessary
- Document limitations in API.md

### 8.2 Scope Risks

#### Scope Creep Risk 🟡 MEDIUM
**Risk**: Feature requests beyond core containerization  
**Impact**: Delays to 1.0 release, tech debt accumulation  
**Mitigation**:
- Enforce OpenSpec workflow (require change proposals)
- Reference Constitution 1.0.0 (no enterprise features, local-first)
- Phase 2-4 clearly scoped in ROADMAP.md

#### Test Coverage Risk 🔴 HIGH
**Risk**: Skipping tests to move faster  
**Impact**: Regressions, production bugs, low confidence in refactoring  
**Mitigation**:
- Gate each phase on test coverage thresholds (>20% Sprint 1, >40% Sprint 3, >60% Sprint 6)
- Pair feature development with test development
- Integration tests as acceptance criteria

### 8.3 UX Risks

#### Onboarding Risk 🟡 MEDIUM
**Risk**: New users don't know how to start  
**Impact**: High support burden, poor adoption  
**Mitigation**:
- Add empty state cards with CTAs (Sprint 2)
- First-launch wizard (Phase 4)
- Quick start in README.md (<5 minutes)

#### Accessibility Risk ⚠️ LOW-MEDIUM
**Risk**: VoiceOver, keyboard navigation not functional  
**Impact**: Accessibility complaints, compliance issues  
**Mitigation**:
- Accessibility audit in Sprint 6 (Phase 4 prep)
- Keyboard navigation implementation (Sprint 2)
- HIG compliance review

---

## 9. Success Criteria Summary

### Sprint 1 (Foundation Stabilization)
- ✅ `swift build` exits 0
- ✅ `swift test` exits 0, >20% coverage
- ✅ Phase 1.3 (Storage) 100% complete
- ✅ `README.md`, `ARCHITECTURE.md`, `XPC_PROTOCOL.md` exist

### Sprint 2-3 (Docker API Parity)
- ✅ `docker-compose up` works without modification
- ✅ App launch <2s, container start <500ms
- ✅ Command palette (⌘K) functional
- ✅ Port forwarding works

### Sprint 4-6 (Networking Complete)
- ✅ `curl https://myapp.fd.local` works (zero-config HTTPS)
- ✅ K3s cluster provisions in <60s
- ✅ UI tests prevent regressions
- ✅ >60% test coverage

### Phase 4 (Future - 1.0 Release)
- ✅ Accessibility score >90%
- ✅ Notarized + signed for distribution
- ✅ Feature parity with OrbStack core
- ✅ Public beta ready

---

## 10. Next Steps

### Immediate Actions (Post-Spec Approval)
1. **Review this spec** with stakeholders
2. **Create Sprint 1 tasks** in plan.md (next step in workflow)
3. **Start with build fix** (highest priority blocker)
4. **Establish test infrastructure** (IntegrationTests framework)
5. **Complete Phase 1.3** (Storage implementation)

### Long-Term Planning
- Update `openspec/ROADMAP.md` with Sprint 1-6 milestones
- Create change proposals for Phase 2-3 (per OpenSpec workflow)
- Schedule quarterly dependency audits
- Plan 1.0 release timeline (4-6 months from Sprint 1 start)

---

**Specification Status**: ✅ Ready for Planning Phase  
**Next Artifact**: `plan.md` (detailed task breakdown)  
**Approval Required**: Stakeholder sign-off on priorities and timeline
