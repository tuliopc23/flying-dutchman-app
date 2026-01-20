# Flying Dutchman - Technical Specification for Phase 1 Completion & Quality Baseline

**Based on**: [requirements.md](./requirements.md)  
**Date**: 2026-01-20  
**Current Phase**: 1.2 (Image Management) - 95% complete  
**Target**: Complete Phase 1.3 (Storage) + Establish Quality Baseline

---

## 1. Technical Context

**Language**: Swift 6.2  
**Platform**: macOS 26.0+ (Tahoe), Apple Silicon only  
**Build System**: Swift Package Manager  
**Architecture**: Multi-target (App + Engine + CLI + 6 libraries)  
**Key Dependencies**:
- Apple Containerization framework 0.21.1 (primary runtime)
- GRDB 7.8+ (persistence)
- Hummingbird 2.0+ (HTTP server)
- SwiftNIO 2.60+ (networking)

**Current LOC**: ~13,000 lines Swift across 105 files

---

## 2. Implementation Approach

### 2.1 Critical Path (Sprint 1: 1-2 weeks)

**Objective**: Fix build, complete Phase 1.3 (Storage), establish test baseline

#### 2.1.1 Fix Build System (Priority 1)
**Problem**: `swift build` fails with missing test directories error
```
error: invalid custom path 'Tests/FlyingDutchmanAppTests' for target 'FlyingDutchmanAppTests'
```

**Solution**:
- Create missing test directories with placeholder tests
- Verify build succeeds on clean checkout
- Update Package.swift if needed

**Files**:
- `Tests/FlyingDutchmanAppTests/` (create)
- `Tests/FlyingDutchmanEngineTests/` (create)
- `Tests/FlyingDutchmanCLITests/` (create)
- `Tests/IntegrationTests/` (create)

#### 2.1.2 Complete Phase 1.3: Storage (Priority 2)
**Requirements** (from `openspec/specs/container-storage/spec.md`):
1. Bind mount support
2. Named volumes (already exists in `VolumeManager.swift`)
3. Volume lifecycle via HTTP API
4. Filesystem exposure (`~/FlyingDutchman/containers/`, `~/FlyingDutchman/images/`)

**Implementation**:

**A. Bind Mounts**
- Modify `ContainerizationRuntime.createContainer()` to accept mount specifications
- Map macOS paths to container paths via Containerization framework APIs
- Add validation (path exists, permissions)

**Files**:
- `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift` (modify)
- `Sources/Shared/Models/Container.swift` (add mounts field)

**B. Volume HTTP Routes**
- Implement `POST /volumes/create`, `DELETE /volumes/{name}`
- Wire to existing `VolumeManager`

**Files**:
- `Sources/FlyingDutchmanNetworking/Routes/VolumesRoutes.swift` (enhance)

**C. Filesystem Exposure**
- Create symlinks or expose FUSE mount at `~/FlyingDutchman/containers/`
- Read-only exposure for debugging/inspection

**Files**:
- `Sources/FlyingDutchmanContainers/ImageFilesystemManager.swift` (enhance)

#### 2.1.3 Integration Test Suite (Priority 3)
**Coverage Targets**:
- Engine startup/shutdown (lifecycle)
- Container CRUD via HTTP API (round-trip)
- XPC client/server contract
- GRDB persistence (stores)

**Test Structure**:
```
Tests/IntegrationTests/
  EngineLifecycleTests.swift
  ContainerAPITests.swift
  XPCProtocolTests.swift
  PersistenceRoundTripTests.swift
```

**Approach**:
- Use in-memory GRDB database
- Mock or stub Containerization framework calls
- Test HTTP endpoints via `AsyncHTTPClient`

#### 2.1.4 Documentation Baseline (Priority 4)
**Required Files**:
- `README.md` - Installation, quick start, architecture overview
- Architecture diagram (Mermaid or ASCII) showing module dependencies

**Sections for README.md**:
1. Overview (what is Flying Dutchman)
2. Requirements (macOS 26+, Apple Silicon)
3. Installation (build from source)
4. Quick Start (run engine, CLI commands)
5. Architecture (3-layer: App/Engine/CLI + modules)
6. Development (build, test, lint)
7. Roadmap (link to `openspec/ROADMAP.md`)

---

## 3. Source Code Structure Changes

### 3.1 New Files
```
Tests/FlyingDutchmanAppTests/
  AppLaunchTests.swift               (smoke test)
  
Tests/FlyingDutchmanEngineTests/
  EngineStartupTests.swift           (smoke test)
  
Tests/FlyingDutchmanCLITests/
  CLIDoctorTests.swift               (smoke test)
  
Tests/IntegrationTests/
  EngineLifecycleTests.swift         (engine start/stop)
  ContainerAPITests.swift            (HTTP CRUD)
  XPCProtocolTests.swift             (XPC contract)
  PersistenceRoundTripTests.swift    (GRDB round-trips)
  
README.md                            (project documentation)
```

### 3.2 Modified Files
```
Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift
  - Add bind mount support in createContainer()
  
Sources/Shared/Models/Container.swift
  - Add mounts: [MountSpec] field
  
Sources/FlyingDutchmanNetworking/Routes/VolumesRoutes.swift
  - Implement POST /volumes/create
  - Implement DELETE /volumes/{name}
  
Sources/FlyingDutchmanContainers/ImageFilesystemManager.swift
  - Add filesystem exposure logic
```

---

## 4. Data Model Changes

### 4.1 Container Model Enhancement
**File**: `Sources/Shared/Models/Container.swift`

Add mount specification:
```swift
public struct MountSpec: Codable, Sendable {
    public let type: MountType  // bind, volume, tmpfs
    public let source: String   // host path or volume name
    public let destination: String  // container path
    public let readOnly: Bool
}

public enum MountType: String, Codable, Sendable {
    case bind
    case volume
    case tmpfs
}
```

Update `ContainerSummary`:
```swift
public struct ContainerSummary: Codable, Sendable {
    // ... existing fields ...
    public var mounts: [MountSpec]
}
```

### 4.2 Volume Model (Already Exists)
**File**: `Sources/Shared/Models/Volume.swift`

No changes required - already has:
```swift
public struct VolumeSummary: Codable, Sendable {
    public let name: String
    public let mountPath: String
}
```

---

## 5. API Changes

### 5.1 HTTP Endpoints (New/Enhanced)
**Base**: `http://localhost:8080`

**New**:
- `POST /volumes/create` - Create named volume
  - Body: `{ "name": "myvolume", "driver": "local" }`
  - Response: `VolumeSummary`
  
- `DELETE /volumes/{name}` - Delete volume
  - Response: `204 No Content`

**Enhanced**:
- `POST /containers/create` - Accept `mounts` array
  - Body: Add `"mounts": [{ "type": "bind", "source": "/Users/...", "destination": "/app", "readOnly": false }]`

### 5.2 XPC Protocol (No Changes)
Existing protocol remains stable.

---

## 6. Delivery Phases

### Phase 1: Fix Build (1 day)
- ✅ Create missing test directories
- ✅ Add placeholder tests
- ✅ Verify `swift build` succeeds
- ✅ Verify `swift test` runs

**Verification**:
```bash
swift build
swift test
```

### Phase 2: Complete Storage (3 days)
- ✅ Implement bind mount support in `ContainerizationRuntime`
- ✅ Add mount specs to `Container` model
- ✅ Implement volume HTTP routes
- ✅ Add filesystem exposure
- ✅ Test bind mount round-trip

**Verification**:
```bash
# Create container with bind mount
curl -X POST http://localhost:8080/containers/create \
  -d '{"name":"test","image":"alpine","mounts":[{"type":"bind","source":"/tmp","destination":"/data","readOnly":false}]}'

# Create volume
curl -X POST http://localhost:8080/volumes/create -d '{"name":"myvol"}'

# Verify filesystem exposure
ls ~/FlyingDutchman/containers/
ls ~/FlyingDutchman/images/
```

### Phase 3: Integration Tests (2 days)
- ✅ Engine lifecycle tests
- ✅ Container API tests
- ✅ XPC protocol tests
- ✅ Persistence round-trip tests
- ✅ Achieve >20% test coverage

**Verification**:
```bash
swift test --filter IntegrationTests
```

### Phase 4: Documentation (1 day)
- ✅ Write `README.md`
- ✅ Add architecture diagram
- ✅ Document XPC protocol contract

**Verification**:
- README renders correctly on GitHub
- Architecture diagram is clear

---

## 7. Verification Approach

### 7.1 Build & Test Commands
```bash
# Clean build
swift package clean
swift build

# Run all tests
swift test

# Run specific test suite
swift test --filter IntegrationTests
swift test --filter FlyingDutchmanContainersTests

# Lint (if linter configured)
./scripts/lint.sh
```

### 7.2 Manual Verification
**Engine**:
```bash
swift run FlyingDutchmanEngine
```

**CLI**:
```bash
swift run FlyingDutchmanCLI doctor
swift run FlyingDutchmanCLI containers list
swift run FlyingDutchmanCLI volumes list
```

**App**:
```bash
swift run FlyingDutchmanApp
```

### 7.3 Integration Tests
**HTTP API**:
```bash
# Health check
curl http://localhost:8080/health

# Create container with bind mount
curl -X POST http://localhost:8080/containers/create \
  -H "Content-Type: application/json" \
  -d '{"name":"test","image":"alpine:latest","mounts":[{"type":"bind","source":"/tmp","destination":"/data","readOnly":false}]}'

# Start container
curl -X POST http://localhost:8080/containers/{id}/start

# Create volume
curl -X POST http://localhost:8080/volumes/create \
  -H "Content-Type: application/json" \
  -d '{"name":"myvol","driver":"local"}'
```

**Filesystem**:
```bash
# Verify directories exist
ls -la ~/FlyingDutchman/
ls -la ~/FlyingDutchman/containers/
ls -la ~/FlyingDutchman/images/
```

### 7.4 Success Criteria
- ✅ `swift build` succeeds with no errors
- ✅ `swift test` runs with >20% coverage
- ✅ All Phase 1.3 requirements implemented
- ✅ README.md exists with quick start
- ✅ Bind mounts work for at least one test case
- ✅ Named volumes can be created/deleted via API
- ✅ Filesystem exposure accessible from Finder

---

## 8. Risks & Mitigation

### 8.1 Containerization Framework API
**Risk**: Apple's framework may not support bind mounts as expected  
**Mitigation**: Review official Apple Containerization docs; fall back to volume-only if needed

### 8.2 Filesystem Exposure Performance
**Risk**: FUSE overhead or symlink complexity  
**Mitigation**: Start with read-only symlinks; defer FUSE to Phase 2 if needed

### 8.3 Test Flakiness
**Risk**: Integration tests may be flaky due to async operations  
**Mitigation**: Use proper async/await patterns; add timeouts; retry on transient failures

---

## 9. Out of Scope

**Deferred to Phase 2+**:
- BuildKit integration (Phase 1.2 - deferred)
- Multi-platform builds (Phase 1.2 - deferred)
- Networking (Phase 2)
- Kubernetes (Phase 3)
- UI polish (Phase 4)
- Command palette implementation (Phase 4)
- Performance benchmarking (Sprint 2)
- Accessibility audit (Sprint 2-3)

---

## 10. Constitution Compliance

**Verification** (per `CLAUDE.md`):
- ✅ Platform constraints: macOS 26.0+ Tahoe, Apple Silicon only (enforced)
- ✅ Native-first: Using Apple Containerization framework
- ✅ Swift-only: 100% Swift 6.2, strict concurrency
- ✅ Local-first: Single-developer workflow, no enterprise features
- ✅ "It just works": Zero-config volume creation, auto-directories
- ✅ Minimal/surgical: Only completing Phase 1.3, no scope creep
- ✅ Opinionated: Guided workflows via CLI/HTTP API

**No violations** - all work aligns with constitution principles.

---

## 11. Next Steps After This Spec

1. Review this spec with stakeholders
2. Begin implementation in order:
   - Phase 1: Fix Build (1 day)
   - Phase 2: Complete Storage (3 days)
   - Phase 3: Integration Tests (2 days)
   - Phase 4: Documentation (1 day)
3. Mark Phase 1 as 100% complete in `openspec/ROADMAP.md`
4. Begin Sprint 2 planning (Phase 2: Networking)
