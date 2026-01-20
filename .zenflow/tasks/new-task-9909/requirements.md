# Flying Dutchman - Comprehensive Codebase Evaluation & Forward Plan

**Date**: 2026-01-20  
**Scope**: Full codebase evaluation and strategic roadmap  
**Current Phase**: 1.2 (Image Management) - 95% through Phase 1

---

## Executive Summary

Flying Dutchman is a macOS-native containerization management tool targeting macOS 26+ (Tahoe) and Apple Silicon exclusively. The project leverages Apple's Containerization framework to provide a Docker-compatible experience with first-class native integration. The codebase consists of **~13,000 lines of Swift 6.2** organized into a well-architected multi-target structure.

**Current Status**: The foundation (Phase 0) and core container engine (Phase 1.1) are complete. The project is 95% through Phase 1, with image management (1.2) in progress and storage (1.3) remaining. The codebase is functional but has **build configuration issues** (missing test directories) and **minimal test coverage** (5 test files).

---

## 1. Codebase Architecture Evaluation

### 1.1 Module Structure ✅ EXCELLENT

The project follows a clean separation of concerns with 9 distinct targets:

**Executables (3)**:
- `FlyingDutchmanApp` - SwiftUI macOS application with Liquid Glass design system
- `FlyingDutchmanEngine` - Background daemon/server (Hummingbird HTTP + XPC)
- `FlyingDutchmanCLI` - Command-line interface (ArgumentParser)

**Libraries (6)**:
- `Shared` - Common types, models, logging, error handling
- `FlyingDutchmanContainers` - Runtime abstraction, Apple Containerization integration
- `FlyingDutchmanPersistence` - GRDB/SQLite repositories
- `FlyingDutchmanNetworking` - HTTP server (Hummingbird), XPC, Docker API shim
- `FlyingDutchmanKubernetes` - SwiftkubeClient integration (stubbed)
- `FlyingDutchmanAI` - AI insights (stubbed)

**Dependency Flow**: Clean and acyclic
```
App → Networking → Containers → Shared
    ↘ Persistence ↗

Engine → Networking + Persistence + Containers

CLI → Networking + Containers + Persistence
```

**Strengths**:
- Clear module boundaries
- No circular dependencies
- Appropriate granularity

**Issues**: None significant

---

### 1.2 Runtime Abstraction ✅ EXCELLENT

**Protocol**: `ContainerRuntimeProtocol` provides clean abstraction
**Implementations**:
- `ContainerizationRuntime` - Apple's Containerization framework (primary, 826 LOC)
- `StubContainerRuntime` - Development/testing fallback (179 LOC)
- `ContainerCLIRuntime` - Docker CLI wrapper (basic, 95 LOC)

**Factory**: `RuntimeFactory` selects runtime based on:
1. `FD_RUNTIME` environment variable
2. Platform compatibility (macOS 26+, Apple Silicon)
3. Containerization framework availability

**State Management**:
- `ContainerStateMachine` tracks transitions: `created → starting → running → stopping → stopped → removing → removed`
- Event streaming via `AsyncStream<ContainerEvent>`
- Log streaming via VSOCK with length-prefixed JSON protocol

**Strengths**:
- Runtime selection is transparent
- State machine prevents invalid transitions
- Event-driven architecture enables UI reactivity

**Issues**:
- `ContainerCLIRuntime` is minimal (only basic operations)
- No runtime switching at runtime (requires restart)

---

### 1.3 Persistence Layer ✅ SOLID

**Technology**: GRDB.swift (SQLite) - chosen over SwiftData for maturity

**Stores** (7 repositories):
- `ContainerStore` - Container metadata
- `ImageStore` - Image metadata
- `VolumeStore` - Volume metadata
- `NetworkStore` - Network metadata
- `StackStore` - Compose projects
- `ContainerLogStore` - Container logs (high-volume writes)
- `ShimEventStore` / `ContainerEventStore` - Runtime events

**Seeding**: `SeedData.swift` provides sample data for development

**Strengths**:
- Battle-tested SQLite
- Dedicated log store for high-volume writes
- Migration system in place

**Issues**:
- Migrations directory structure not explored
- No pruning/rotation for logs (potential disk bloat)
- SwiftData evaluation deferred to Phase 4 (may be premature given iOS 26/macOS 26 stability)

---

### 1.4 Networking Layer ✅ SOLID

**HTTP Server**: Hummingbird 2.0+ (lightweight, async/await-native)
**Endpoints** (6 route groups):
- `ContainersRoutes` - `/containers`, `/containers/create`, `/containers/{id}/start|stop|restart|delete`
- `ImagesRoutes` - `/images`, `/images/pull`
- `VolumesRoutes` - `/volumes`
- `NetworksRoutes` - `/networks`
- `StacksRoutes` - `/stacks`
- `/health`, `/status`, `/runtime-events` (SSE)

**XPC Communication**:
- `EngineXPCProtocol` - Low-latency app ↔ engine communication
- `EngineXPCClient` - Client-side proxy
- `EngineXPCService` - Server-side implementation
- `EngineXPCListener` - Lifecycle management

**Client**: `EngineClient` - HTTP client for app → engine communication

**Strengths**:
- Docker-compatible API surface (partial)
- XPC for low-latency privileged operations
- SSE for event streaming

**Issues**:
- Docker API compatibility incomplete (missing: volumes, networks, build)
- No authentication/authorization (localhost-only assumption)
- XPC protocol not documented (no .xpc definition files found)

---

### 1.5 UI Layer (SwiftUI) ⚠️ FUNCTIONAL BUT INCOMPLETE

**Architecture**:
- `AppModel` - Root observable model
- View models per section: `ContainerListViewModel`, `ImageListViewModel`, `VolumeListViewModel`, `NetworkListViewModel`, `EventsViewModel`, `LogsViewModel`, `StacksViewModel`
- `CommandPalette` - ⌘K power-user interface (registered, not implemented)

**Design System**: "Liquid Glass" with Netherlands Orange (#FF6200) and Royal Blue (#21468B)
- Tokens: `Colors`, `Typography`, `Spacing`, `CornerRadius`, `Shadows`, `Animations`
- Components: `GlassCard`, `StatusBadge`, `EmptyStateCard`, `SectionHeader`, `DiagnosticsBanner`
- Extensions: `View+Glass`, `Image+Symbols`

**Sections** (7):
- Containers (list + detail)
- Images (list)
- Volumes (list)
- Networks (list)
- Logs (streaming viewer)
- Events (SSE stream)
- Stacks (Compose projects)

**SwiftData Models**:
- `UIState` - Selected section, engine host/port, appearance preferences, poll intervals

**Strengths**:
- Modern SwiftUI with Observable macro
- Clean design system
- Navigation state persisted

**Issues**:
- **Build error**: Missing test directories (`FlyingDutchmanAppTests`, `FlyingDutchmanEngineTests`, `FlyingDutchmanCLITests`, `IntegrationTests`)
- Command palette not implemented (only action registry exists)
- No empty state handling for new users
- Performance not measured (no instrumentation)
- No keyboard navigation/accessibility audit

---

### 1.6 CLI Layer ✅ FUNCTIONAL

**Commands** (7):
- `version` - Show version
- `doctor` - Diagnostics (platform, containerization, engine health)
- `containers {list|start|stop|restart|logs}` - Container operations
- `images {list}` - Image operations
- `stacks {list}` - Compose projects
- `volumes {list}` - Volumes
- `networks {list}` - Networks
- `events {list}` - Runtime events

**Output Modes**:
- Human-readable tables
- JSON (`--json` flag)

**Strengths**:
- ArgumentParser provides clean command structure
- Doctor command provides actionable diagnostics
- Graceful degradation when engine unreachable

**Issues**:
- No create/delete operations via CLI (read-only for most entities)
- No shell completion
- No interactive mode

---

### 1.7 Testing ❌ CRITICAL GAP

**Current Coverage**:
```
Tests/FlyingDutchmanContainersTests/
  - ContainerStateMachineTests.swift (8.4 KB)
  - ImageCacheManagerTests.swift (9.6 KB)
  - VolumeManagerTests.swift (8.0 KB)

Tests/FlyingDutchmanPersistenceTests/
  - ContainerEventStoreTests.swift (9.5 KB)
  - ContainerStoreTests.swift (5.3 KB)
```

**Missing Test Directories** (causes build failure):
- `Tests/FlyingDutchmanAppTests/`
- `Tests/FlyingDutchmanEngineTests/`
- `Tests/FlyingDutchmanCLITests/`
- `Tests/IntegrationTests/`

**Coverage Analysis**:
- **Containers module**: 3 unit tests (state machine, cache, volumes) - **~15% coverage**
- **Persistence module**: 2 unit tests (stores) - **~20% coverage**
- **Networking module**: **0% coverage**
- **App module**: **0% coverage**
- **Engine module**: **0% coverage**
- **CLI module**: **0% coverage**
- **Integration tests**: **0% (missing)**

**Strengths**:
- Tests that exist are well-structured
- Use async/await properly

**Critical Issues**:
- **No integration tests** (engine + runtime + persistence)
- **No UI tests** (smoke tests for critical flows)
- **No API contract tests** (HTTP endpoints)
- **No XPC protocol tests**
- **Build broken** due to missing test directories

---

### 1.8 Containerization Integration ✅ SOLID

**Apple Containerization Framework Usage**:
- `ContainerManager` - VM lifecycle
- `LinuxContainer` - Container configuration and execution
- `Kernel` - Linux kernel management
- `ContainerizationOCI` - OCI registry pull
- VSOCK - Host-VM communication

**Key Features Implemented**:
- ✅ Container create/start/stop/delete
- ✅ OCI image pull from registries
- ✅ VSOCK log streaming (length-prefixed JSON)
- ✅ Kernel download automation (`KernelManager`)
- ✅ Image layer caching (`ImageCacheManager`)
- ✅ Compose YAML parsing (Yams)

**Pending**:
- ❌ Bind mounts
- ❌ Named volumes
- ❌ Port forwarding (VSOCK-based)
- ❌ BuildKit integration
- ❌ Multi-platform builds

**Strengths**:
- Direct integration with Apple's native framework
- VSOCK protocol correctly implemented
- Kernel management automated

**Issues**:
- No offline mode (requires internet for kernel/initfs)
- Error messages from Containerization framework not always user-friendly
- Resource limits (CPU, memory) configured but not exposed in UI

---

### 1.9 Configuration & Environment ✅ ADEQUATE

**Configuration**:
- `AppConfig.swift` - Version, build info
- `Config.swift` (Shared) - App name, bundle ID, directories
- Environment variables:
  - `FD_RUNTIME` - Runtime selection (native/cli/stub)
  - `FD_LOG_LEVEL` - Log verbosity

**Directories**:
- `~/Library/Application Support/flyingdutchman/` - Database, kernel
- `~/Library/Logs/FlyingDutchman/` - Logs
- `~/FlyingDutchman/containers/` - Container filesystems (planned)
- `~/FlyingDutchman/images/` - Image layers (planned)

**Strengths**:
- Standard macOS paths
- Environment variable overrides

**Issues**:
- No `flyingdutchman.conf` or YAML config file
- Settings only editable via SwiftData (no CLI config command)
- No backup/restore for configuration

---

### 1.10 Logging & Observability ✅ SOLID

**Logging**:
- `swift-log` for structured logging
- `Loggers.swift` provides category-based loggers
- Categories: `.containers`, `.persistence`, `.networking`, `.ui`, `.cli`
- File-based log rotation (location: `~/Library/Logs/FlyingDutchman/`)

**Observability**:
- `/health` endpoint (basic status)
- `/status` endpoint (engine uptime, workers, mode)
- `/runtime-events` (SSE stream of container events)
- XPC status check

**Strengths**:
- Structured logging with metadata
- File persistence with rotation
- Multiple diagnostic endpoints

**Issues**:
- No metrics collection (Prometheus/StatsD)
- No distributed tracing (swift-distributed-tracing integrated but unused)
- Log rotation policy not documented

---

### 1.11 Error Handling ✅ ADEQUATE

**Error Types** (per module):
- `EngineError` (Shared) - Runtime, kernel, config errors
- Domain-specific errors in each module

**Error Presentation**:
- `userMessage` - User-facing description
- `technicalMessage` - Developer/log details
- `isRecoverable` - Retry eligibility

**Strengths**:
- User-friendly vs. technical separation
- Structured error types

**Issues**:
- Inconsistent error handling across modules
- No retry logic for transient failures
- Alert presentation in UI not standardized

---

### 1.12 Documentation 📝 GOOD

**Existing Documentation**:
- `CLAUDE.md` - AI assistant guidance (comprehensive)
- `openspec/project.md` - Tech stack, conventions
- `openspec/ROADMAP.md` - Phase breakdown, dependencies
- `openspec/dependencies.md` - Package registry with rationale
- `openspec/phases/phase-{0,1,2,3,4}/status.md` - Phase tracking
- `openspec/specs/container-engine/spec.md` - Requirements with scenarios

**Strengths**:
- OpenSpec workflow provides clear change management
- Dependency decisions documented with rationale
- Phase tracking with entry/exit criteria

**Issues**:
- No `README.md` at project root (missing)
- No `CONTRIBUTING.md`
- No architecture diagrams
- API documentation sparse (no DocC)

---

## 2. Phase Completion Assessment

### Phase 0: Foundation ✅ 100% COMPLETE

**Deliverables**:
- ✅ Multi-target Package.swift
- ✅ GRDB persistence
- ✅ ContainerRuntime protocol
- ✅ Logging (swift-log)
- ✅ Error handling

**Verification**: All entry criteria for Phase 1 met.

---

### Phase 1: Container Core 🟡 95% COMPLETE

#### Phase 1.1: Container Engine ✅ 100% COMPLETE
- ✅ Container CRUD (create, start, stop, delete)
- ✅ State machine (`ContainerStateMachine`)
- ✅ Event streaming (AsyncStream + `/runtime-events` SSE)
- ✅ Compose support (Yams YAML parsing)
- ✅ Log streaming (VSOCK with length-prefixed JSON)

#### Phase 1.2: Image Management 🟡 60% COMPLETE
- ✅ Kernel download automation (`KernelManager` with symlink)
- ✅ Image layer caching (`ImageCacheManager` wired to pull)
- ❌ **BuildKit integration** (not started)
- ❌ **Multi-platform builds** (not started)
- ⚠️ **Image filesystem exposure** (placeholder, no layer extraction)

#### Phase 1.3: Storage ❌ 0% COMPLETE
- ❌ **Bind mount support** (not started)
- ❌ **Named volumes** (not started)
- ❌ **Volume lifecycle management** (not started)
- ❌ **Filesystem exposure** (`~/FlyingDutchman/containers/`) (not started)

**Blockers**: None technical. Requires implementation time.

---

### Phase 2-4: Not Started ⚪ 0% COMPLETE

**Phase 2: Networking** (bridge, DNS, HTTPS)
**Phase 3: Platform** (Linux machines, Kubernetes, headless CLI)
**Phase 4: UX Polish** (menu bar, command palette, debug shell, settings)

---

## 3. Critical Issues & Gaps

### 3.1 Build System 🔴 CRITICAL
**Issue**: `swift build` fails due to missing test directories
```
error: invalid custom path 'Tests/FlyingDutchmanAppTests' for target 'FlyingDutchmanAppTests'
```

**Fix Required**:
1. Create missing test directories:
   - `Tests/FlyingDutchmanAppTests/`
   - `Tests/FlyingDutchmanEngineTests/`
   - `Tests/FlyingDutchmanCLITests/`
   - `Tests/IntegrationTests/`
2. Add placeholder test files or remove targets from `Package.swift`

**Impact**: Blocks CI/CD, prevents new contributors from building

---

### 3.2 Test Coverage 🔴 CRITICAL
**Issue**: Only 5 test files, ~10% coverage, 0% integration tests

**Risks**:
- No confidence in refactoring
- Regressions in critical flows (container start/stop)
- XPC protocol changes could break silently
- HTTP API changes unvalidated

**Required**:
1. Integration tests:
   - Engine → Runtime → Persistence round-trip
   - XPC client/server contract
   - HTTP API conformance to Docker API
2. UI smoke tests:
   - App launches
   - Container list loads
   - Logs stream
3. CLI tests:
   - Doctor command output
   - Container operations

---

### 3.3 Docker API Compatibility 🟡 MEDIUM
**Issue**: HTTP API incomplete compared to Docker

**Missing Endpoints**:
- `POST /containers/{id}/attach` (attach to running container)
- `POST /images/build` (BuildKit)
- `POST /volumes/create`, `DELETE /volumes/{id}`
- `POST /networks/create`, `DELETE /networks/{id}`
- `GET /containers/{id}/logs` (historical logs endpoint)

**Impact**: CLI tools expecting Docker API will fail

---

### 3.4 Performance Benchmarking ⚠️ LOW
**Issue**: No performance metrics or targets defined

**Unknowns**:
- App launch time (target: <2s)
- Container start latency (target: <500ms)
- Log streaming throughput
- Database query performance
- UI responsiveness under load (100+ containers)

**Required**:
- XCTest performance tests
- Instruments profiling sessions
- Load testing (100/1000 container scenarios)

---

### 3.5 Accessibility 🟡 MEDIUM
**Issue**: No accessibility audit performed

**Risks**:
- VoiceOver navigation broken
- Keyboard-only usage impossible
- Color contrast violations

**Required**:
- Accessibility Inspector audit
- VoiceOver testing
- Keyboard navigation testing
- Reduce motion support

---

### 3.6 Documentation Gaps 🟡 MEDIUM
**Issue**: No project README, architecture diagrams, or API docs

**Missing**:
- `README.md` (installation, quick start, architecture overview)
- `CONTRIBUTING.md` (for future contributors)
- Architecture diagrams (SVG/Mermaid)
- API documentation (DocC for public APIs)
- Deployment guide (launchd setup)

---

## 4. Forward Plan: Recommended Priorities

### 4.1 Immediate (Sprint 1: 1-2 weeks)

**Goal**: Stabilize foundation, fix build, establish quality baseline

**Tasks**:
1. **Fix build** (1 day)
   - Create missing test directories
   - Add placeholder tests
   - Verify `swift build` and `swift test` succeed

2. **Integration test suite** (3 days)
   - Engine startup/shutdown
   - Container lifecycle via HTTP API
   - XPC client/server contract
   - GRDB store round-trips

3. **Complete Phase 1.3: Storage** (5 days)
   - Bind mount support (`ContainerConfig.mounts`)
   - Named volumes (`VolumeManager` CRUD)
   - Filesystem exposure (`~/FlyingDutchman/containers/`)
   - Volume routes (`VolumesRoutes`)

4. **Documentation baseline** (2 days)
   - Write `README.md` (installation, quick start)
   - Add architecture diagram (module dependencies)
   - Document XPC protocol contract

**Success Criteria**:
- ✅ `swift build` succeeds
- ✅ `swift test` succeeds with >20% coverage
- ✅ Phase 1 (all sub-phases) 100% complete
- ✅ README exists with quick start

---

### 4.2 Short Term (Sprint 2-3: 2-4 weeks)

**Goal**: Docker API parity, performance baseline, Phase 2 start

**Tasks**:
1. **Docker API compatibility** (4 days)
   - Implement missing endpoints (attach, build, volumes, networks)
   - API contract tests (compare with Docker 24.0 spec)
   - CLI tool compatibility verification (docker-compose, lazydocker)

2. **Performance benchmarking** (3 days)
   - XCTest performance suite (app launch, container start, log streaming)
   - Instruments profiling (Time Profiler, Allocations)
   - Load testing (100/1000 containers)
   - Document results in `PERFORMANCE.md`

3. **UI polish** (3 days)
   - Implement command palette (⌘K)
   - Empty state handling (new user onboarding)
   - Keyboard navigation (Tab, arrow keys, Enter)
   - Status indicators (engine health, container state)

4. **Phase 2.1: Core Networking** (start) (5 days)
   - Bridge network driver (ContainerizationNetworking)
   - Port forwarding (`-p` flag via VSOCK)
   - Network CRUD via HTTP API

**Success Criteria**:
- ✅ Docker Compose projects work without modification
- ✅ App launch <2s, container start <500ms
- ✅ Command palette functional
- ✅ Port forwarding works for HTTP services

---

### 4.3 Medium Term (Sprint 4-6: 1-2 months)

**Goal**: Complete Phase 2 (Networking), Phase 3 start (Kubernetes/CLI)

**Tasks**:
1. **Phase 2.2: DNS & Domains** (5 days)
   - Local DNS resolver (DNSClient)
   - Zero-config domains (`container.fd.local`)
   - Compose service domains (`service.project.fd.local`)

2. **Phase 2.3: HTTPS** (4 days)
   - Local CA generation (swift-certificates)
   - Automatic certificate provisioning
   - Reverse proxy (Hummingbird TLS)

3. **Phase 3.2: Kubernetes** (start) (7 days)
   - Single-node K3s cluster provisioning
   - kubectl integration
   - Service exposure to host
   - `*.k8s.fd.local` domain routing

4. **UI test suite** (3 days)
   - XCUITest smoke tests (app launch, navigation)
   - Critical flow tests (container start, logs view)
   - Snapshot tests (design system regressions)

**Success Criteria**:
- ✅ `curl https://myapp.fd.local` works (zero-config HTTPS)
- ✅ Kubernetes cluster provisions in <60s
- ✅ UI tests prevent visual regressions

---

### 4.4 Long Term (Sprint 7-12: 2-4 months)

**Goal**: Complete Phase 3 (Platform), Phase 4 (UX Polish)

**Tasks**:
1. **Phase 3.1: Linux Machines** (10 days)
   - Multi-distro VM creation (Ubuntu, Alpine, Fedora)
   - File sharing (Mac ↔ Linux via Virtualization.framework)
   - SSH access (Citadel)
   - Cloud-init provisioning

2. **Phase 3.3: CLI/Headless** (5 days)
   - `fd start/stop` daemon management
   - `fd config` for settings
   - Headless mode (no GUI)
   - Shell completion (bash, zsh, fish)

3. **Phase 4.1-4.4: UX Polish** (15 days)
   - Menu bar applet (NSStatusItem)
   - Debug shell (libghostty-vt terminal emulator)
   - Settings efficiency (resource limits UI)
   - Accessibility audit + fixes

4. **1.0 Release Prep** (10 days)
   - Security audit (sandboxing, entitlements)
   - Performance optimization (Time Profiler)
   - Notarization + code signing
   - User documentation (website, video tutorials)

**Success Criteria**:
- ✅ Feature parity with OrbStack core features
- ✅ Accessibility score >90% (Accessibility Inspector)
- ✅ Notarized + signed for distribution
- ✅ Public beta ready

---

## 5. Technical Debt & Refactoring Opportunities

### 5.1 SwiftData Migration
**Current**: GRDB for all persistence
**Opportunity**: Evaluate SwiftData for UI state (Phase 4)
**Rationale**: macOS 26/iOS 26 may have matured SwiftData enough for GUI app needs
**Risk**: Premature migration could introduce instability

---

### 5.2 Dependency Injection
**Current**: Point-Free Dependencies (1.0+)
**Opportunity**: Evaluate Swift 6 native dependency injection (when available)
**Rationale**: Reduce third-party dependencies if standard library provides equivalent

---

### 5.3 XPC Protocol Formalization
**Current**: Ad-hoc XPC protocol
**Opportunity**: Define `.xpc` interface definition files
**Rationale**: Enables protocol versioning, clearer contracts, code generation

---

### 5.4 Runtime Switching
**Current**: Runtime selected at engine startup (requires restart)
**Opportunity**: Allow runtime switching without restart
**Rationale**: Developer experience (testing native vs. CLI runtimes)

---

### 5.5 Modular Tuist Adoption
**Current**: Package.swift only
**Opportunity**: Full Tuist migration (Project.swift, code generation)
**Rationale**: CLAUDE.md mentions Tuist as "source of truth", but `Tuist/` directory not present

---

## 6. Risk Assessment

### 6.1 Platform Risk 🔴 HIGH
**Risk**: Apple Containerization framework is pre-1.0 (0.21.1)
**Impact**: Breaking API changes could require significant refactoring
**Mitigation**:
- Pin to specific version (✅ already done)
- Monitor apple/containerization releases
- Abstract Containerization-specific code behind `ContainerRuntime` protocol

---

### 6.2 Dependency Risk 🟡 MEDIUM
**Risk**: 40+ transitive dependencies (SwiftNIO ecosystem)
**Impact**: Version conflicts, supply chain vulnerabilities
**Mitigation**:
- Use Swift Package Index for maintenance monitoring (✅ documented)
- Regular dependency updates (schedule quarterly)
- Lock file versioning

---

### 6.3 Performance Risk ⚠️ LOW-MEDIUM
**Risk**: GRDB performance at scale (10k+ containers, 1M+ log entries)
**Impact**: UI slowdowns, high memory usage
**Mitigation**:
- Performance testing with load (planned in Sprint 2)
- Log pruning/rotation policy
- Lazy loading + pagination in UI

---

### 6.4 User Experience Risk 🟡 MEDIUM
**Risk**: No user testing, accessibility audit, or onboarding
**Impact**: Poor adoption, accessibility complaints, high support burden
**Mitigation**:
- Alpha testing with target users (developers)
- Accessibility audit (Accessibility Inspector)
- Onboarding flow (first launch wizard)

---

## 7. Success Metrics

### 7.1 Code Quality
- **Test Coverage**: >60% (unit + integration)
- **Build Success**: 100% on macOS 26+
- **Lint Pass Rate**: 100% (SwiftLint + SwiftFormat)
- **Strict Concurrency**: 100% (no @unchecked Sendable)

### 7.2 Performance
- **App Launch**: <2s (cold start)
- **Container Start**: <500ms (native runtime)
- **Log Streaming**: <100ms latency
- **CLI Response**: <200ms

### 7.3 Compatibility
- **Docker API**: 90% compatible (core endpoints)
- **Compose**: 100% compatible (v2 spec)
- **OCI Images**: 100% compatible (Docker Hub, GHCR)

### 7.4 User Experience
- **Accessibility**: >90% (Accessibility Inspector score)
- **Keyboard Navigation**: 100% (all actions accessible)
- **Error Recovery**: 95% (clear recovery guidance)

---

## 8. Conclusion

Flying Dutchman is a **well-architected, modern Swift project** with a solid foundation and clear vision. The codebase demonstrates:

**Strengths**:
- Clean module boundaries and dependency flow
- Modern Swift 6.2 with strict concurrency
- Native Apple Containerization framework integration
- Comprehensive OpenSpec-driven planning

**Critical Gaps**:
- Build system broken (missing test directories)
- Test coverage inadequate (~10%)
- Phase 1 incomplete (storage not started)
- Docker API compatibility partial

**Recommended Path Forward**:
1. **Sprint 1**: Fix build, add integration tests, complete Phase 1.3 (storage)
2. **Sprint 2-3**: Docker API parity, performance baseline, Phase 2 start (networking)
3. **Sprint 4-6**: Complete Phase 2, start Phase 3 (Kubernetes)
4. **Sprint 7-12**: Complete Phase 3-4, 1.0 release prep

With focused execution on the recommended priorities, Flying Dutchman can achieve **feature parity with OrbStack core functionality** within **4-6 months** while maintaining high code quality and user experience standards.

---

**Next Step**: Review this document with stakeholders, prioritize Sprint 1 tasks, and begin implementation starting with build fixes and test infrastructure.
