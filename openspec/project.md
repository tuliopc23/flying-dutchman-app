# Project Context

## Purpose

Flying Dutchman is a macOS Tahoe-only (26.0+), Apple Silicon-only containerization management tool providing first-class integration with Apple's native Containerization framework. The project targets local-first development workflows with an "it just works" experience inspired by Orbstack.

## Tech Stack

- **Language**: Swift 6.2 (strict concurrency mode)
- **Build System**: Swift Package Manager + Tuist (workspace generation)
- **UI Framework**: SwiftUI + SwiftData (Liquid Glass design system)
- **Daemon Framework**: swift-service-lifecycle + launchd
- **HTTP Server**: Hummingbird 2.0+ (Docker API compatibility)
- **IPC**: XPC (low-latency app ↔ engine communication)
- **Persistence**: GRDB 7.8+ (SQLite for engine), SwiftData (UI state)
- **Container Runtime**: Apple Containerization framework (primary), CLI fallback
- **Networking**: SwiftNIO 2.60+, AsyncHTTPClient 1.20+
- **CLI**: ArgumentParser 1.3+
- **Logging**: swift-log 1.6+ (structured logging), OSLog (system diagnostics)
- **Navigation**: Swift Navigation (PointFree) 2.0+
- **DI**: Dependencies (PointFree) 1.0+

## Project Conventions

### Code Style
- **Linting**: SwiftLint + SwiftFormat (enforce existing rules only)
- **Logging**: Use swift-log for structured logging; OSLog for system-level diagnostics
- **Macros**: Prefer Swift macros over Sourcery; use Sourcery only for macro limitations
- **No emojis**: Avoid emojis in code unless explicitly requested

### Architecture Patterns

**Three-Layer Architecture** (NON-NEGOTIABLE):

```
FlyingDutchmanApp (UX Layer)
├── SwiftUI + Liquid Glass design system
├── Command palette (⌘K) as primary power-user interface
├── Communicates via XPC (low-latency) or HTTP
└── SwiftData for UI state persistence

FlyingDutchmanEngine (Local Engine)
├── Swift daemon managed by launchd
├── Apple Containerization framework integration
├── Exposes XPC for fast control
├── Exposes HTTP/gRPC for Docker API compatibility
└── GRDB (SQLite) for metadata persistence

FlyingDutchmanCLI
├── ArgumentParser-based interface
├── Communicates with engine via XPC/HTTP
└── Commands: version, doctor, containers {list|start|stop|restart}
```

**Module Dependencies**:
```
FlyingDutchmanApp → FlyingDutchmanNetworking → FlyingDutchmanContainers → Shared
                  ↘ FlyingDutchmanPersistence ↗

FlyingDutchmanEngine → FlyingDutchmanNetworking
                     → FlyingDutchmanPersistence
                     → FlyingDutchmanContainers

FlyingDutchmanCLI → FlyingDutchmanNetworking
                  → FlyingDutchmanContainers
```

### Testing Strategy

- **Philosophy**: Run existing tests only; add tests when explicitly required
- **Test Types**: XCTest (unit + integration); manual UI smoke tests for design system
- **Scope**: Fix only test failures related to current task; ignore unrelated broken tests
- **Avoid over-testing**: Don't add error handling or tests for scenarios that can't happen

### Git Workflow

- **Branching**: Feature branches for specifications (e.g., `001-flying-dutchman-foundation`)
- **Commits**: Use OpenSpec change proposals for non-trivial features
- **Skip proposals for**: Bug fixes, typos, formatting, non-breaking dependency updates

## Domain Context

### Platform Constraints (NON-NEGOTIABLE)

**CRITICAL**: These are immutable project boundaries defined by the constitution:

- **macOS 26.0+ (Tahoe) ONLY** - Containerization framework requires macOS 26+
- **Apple Silicon (arm64) ONLY** - No Intel (x86_64) support
- **NO backward compatibility** for pre-Tahoe (pre-26.0) macOS
- **Swift 6.2 ONLY** - No other languages except for external tool integration

### Constitution Principles

All design decisions MUST align with `.specify/memory/constitution.md` (version 1.0.0):

1. **Platform Constraints**: macOS 26.0+ Tahoe, Apple Silicon only (NON-NEGOTIABLE)
2. **Native-First Architecture**: Prefer Apple frameworks over cross-platform alternatives
3. **Swift-Only Stack**: 100% Swift 6.2, strict concurrency checking
4. **Local-First Philosophy**: Optimize for single-developer workflows, not enterprise
5. **"It Just Works" Experience**: Zero-config defaults, fast, intuitive
6. **Minimal, Surgical Changes**: Change only what's necessary
7. **Opinionated Over Generic**: Guided workflows, not generic wrappers

### Design System: Liquid Glass

- **Palette**: Netherlands Orange (#FF6200), Royal Blue (#21468B), White
- **Material**: Native Liquid Glass via `.glassEffect()`
- **Typography**: SF Pro Display (Headings), SF Pro Text (Body), SF Mono (Code)
- **Icons**: SF Symbols 7 with draw animations and variable states
- **Tokens**: `Sources/FlyingDutchmanApp/DesignSystem/Tokens/`
- **Components**: GlassCard, StatusBadge, EmptyStateCard, SectionHeader, DiagnosticsBanner
- **Showcase**: `DesignSystemShowcase.swift` (Xcode Previews)

### Runtime Selection

Environment variable `FD_RUNTIME` controls container runtime:
- `FD_RUNTIME=native` - Apple Containerization framework (default when available)
- `FD_RUNTIME=cli` - Fallback to `container` CLI tool
- Defaults to stub if neither available

## Important Constraints

### Performance Targets (NON-NEGOTIABLE)

- App launch: <2s
- Status/selection updates: <200ms
- CLI commands: <500ms
- Command palette invocation (⌘K): <100ms

### Explicit Non-Goals

Flying Dutchman does NOT:
- Support Intel Macs (Apple Silicon only)
- Support pre-Tahoe macOS (macOS 26.0+ only)
- Target enterprise infrastructure (no multi-tenancy, advanced RBAC, audit logs)
- Act as a VM manager (VMs are secondary; Apple Containers are primary)
- Reimplement existing excellent tools (integrate, don't rebuild)

### Avoid Over-Engineering

- Don't add features beyond what's requested
- Don't add error handling for scenarios that can't happen
- Don't create helpers/utilities for one-time operations
- Don't design for hypothetical future requirements
- Three similar lines is better than a premature abstraction

## External Dependencies

### Native Apple Frameworks (Primary)
- Containerization framework (container management) - **Requires macOS 26.0+**
- SwiftUI (all UI)
- SwiftData (UI state)
- Combine/async-await (concurrency)

### Third-Party (Swift Server)
- Hummingbird 2.0+ (HTTP server, Docker API compatibility)
- AsyncHTTPClient 1.20+ (HTTP client)
- SwiftNIO 2.60+ (networking primitives)
- swift-service-lifecycle 2.0+ (daemon lifecycle)

### Third-Party (Data & Tools)
- GRDB 7.8+ (SQLite persistence)
- ArgumentParser 1.3+ (CLI parsing)
- swift-log 1.6+ (structured logging)
- SwiftkubeClient 0.20+ (Kubernetes integration, future)
- Swift Navigation (PointFree) 2.0+ (UI navigation)
- Dependencies (PointFree) 1.0+ (dependency injection)

## Development Commands

```bash
# Build & Test
swift package resolve              # Resolve dependencies
tuist generate                     # Generate Xcode workspace
swift build --target [target]      # Build specific target
swift test                         # Run all tests
swift test --filter [target]Tests  # Run specific tests

# Run Executables
swift run FlyingDutchmanEngine     # Launch engine daemon
swift run FlyingDutchmanCLI [cmd]  # Run CLI commands
swift run FlyingDutchmanApp        # Launch app (or use Xcode)

# Linting
./scripts/lint.sh                  # Run SwiftFormat + SwiftLint
swiftformat Sources/ Tests/ --config .swiftformat
swiftlint lint --config .swiftlint.yml

# OpenSpec
openspec list                      # List active changes
openspec list --specs              # List specifications
openspec validate [change] --strict # Validate change
openspec archive <change-id> --yes # Archive completed change
```

## Current Implementation Status

### Phase A.1: Foundation (✅ COMPLETED - 2025-12-10)

**What's Built**:
- ✅ SwiftUI Liquid Glass window with engine status display
- ✅ Sidebar navigation (projects, containers, images, volumes, networks)
- ✅ Command palette (⌘K) with fuzzy search and appearance toggles
- ✅ Engine daemon scaffold with launchd + XPC + HTTP stubs
- ✅ GRDB persistence layer with repositories (containers, images, volumes, networks, stacks)
- ✅ CLI with `version`, `doctor`, `containers list` commands
- ✅ Design system tokens and showcase components
- ✅ Mock data for UI development

**Reference**:
- Spec: `specs/001-flying-dutchman-foundation/spec.md`
- Tasks: `specs/001-flying-dutchman-foundation/tasks.md` (all checked)
- Quickstart: `specs/001-flying-dutchman-foundation/quickstart.md`

### Phase A.2: Engine-Runtime Integration (✅ COMPLETED - 2025-12-19)

**What's Built**:
- ✅ Engine instantiates runtime via `RuntimeFactory` with GRDB stores
- ✅ HTTP routes wired: `/containers` (list/create/start/stop/remove/logs), `/images` (list)
- ✅ XPC service methods: `listContainers()`, `startContainer()`, `stopContainer()`, `fetchStatus()`
- ✅ CLI commands integrated: `containers list/start/stop`, `doctor` shows runtime mode
- ✅ State synchronization: runtime changes persist to GRDB via `persist()`
- ✅ Event recording: all lifecycle transitions logged to `ShimEventStore`
- ✅ Error handling: HTTP 404/409/500, XPC NSError codes

**Quick Test**:
```bash
# Terminal 1: Start engine
swift run FlyingDutchmanEngine

# Terminal 2: Test CLI
swift run FlyingDutchmanCLI containers list
swift run FlyingDutchmanCLI doctor
```

**Runtime Selection**:
- `FD_RUNTIME=stub` - In-memory mock runtime (default)
- `FD_RUNTIME=cli` - Falls back to `container` CLI tool
- `FD_RUNTIME=native` - Apple Containerization framework (requires macOS 26+)

### What's Next (TBD)

**Options for Next Phase**:
1. **Apple Containerization Framework Integration** - Replace stub with real container lifecycle
2. **Docker API Compatibility** - Full Docker HTTP/Unix socket compatibility
3. **Kubernetes Integration** - SwiftkubeClient wiring for local K8s clusters
4. **OCI Image Pulling** - Real registry integration for pulling container images
