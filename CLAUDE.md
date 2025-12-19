<!-- OPENSPEC:START -->
# OpenSpec Instructions

These instructions are for AI assistants working in this project.

Always open `@/openspec/AGENTS.md` when the request:
- Mentions planning or proposals (words like proposal, spec, change, plan)
- Introduces new capabilities, breaking changes, architecture shifts, or big performance/security work
- Sounds ambiguous and you need the authoritative spec before coding

Use `@/openspec/AGENTS.md` to learn:
- How to create and apply change proposals
- Spec format and conventions
- Project structure and guidelines

Keep this managed block so 'openspec update' can refresh the instructions.

<!-- OPENSPEC:END -->

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flying Dutchman is a macOS Tahoe-only (26.0+), Apple Silicon-only containerization management tool. Built entirely in Swift 6.2, it provides first-class integration with Apple's native Containerization framework. The project targets local-first development workflows with an "it just works" experience inspired by Orbstack.

**Platform Constraints (NON-NEGOTIABLE)**:
- macOS 26.0+ (Tahoe) exclusively - Containerization framework requires macOS 26+
- Apple Silicon (arm64) exclusively
- NO Intel (x86_64) support
- NO backward compatibility for pre-Tahoe (pre-26.0) macOS

## Essential Commands

### Build & Test
```bash
# Resolve dependencies
swift package resolve

# Generate Xcode workspace with Tuist
tuist generate

# Build specific targets
swift build --target FlyingDutchmanApp
swift build --target FlyingDutchmanEngine
swift build --target FlyingDutchmanCLI

# Run tests
swift test                                    # All tests
swift test --filter FlyingDutchmanAppTests   # Specific test target
swift test --filter IntegrationTests         # Integration tests only

# Build and run specific executables
swift run FlyingDutchmanEngine
swift run FlyingDutchmanCLI version
swift run FlyingDutchmanCLI doctor
swift run FlyingDutchmanCLI containers list
```

### Linting
```bash
# Lint code using SwiftFormat + SwiftLint
./scripts/lint.sh

# Format code (in-place)
swiftformat Sources/ Tests/ --config .swiftformat

# Lint with SwiftLint
swiftlint lint --config .swiftlint.yml
```

## Architecture

Flying Dutchman follows a **three-layer architecture** with strict separation of concerns:

### 1. UX Layer (`FlyingDutchmanApp`)
- SwiftUI-based macOS application
- Implements Liquid Glass design system (Netherlands Orange #FF6200, Royal Blue #21468B)
- Communicates with Local Engine via XPC (low-latency) or HTTP/gRPC (external tools)
- Uses SwiftData for UI state persistence
- Command palette (⌘K) as primary power-user interface
- Sidebar navigation for projects, containers, images, volumes, networks

**Key Dependencies**: SwiftUI, SwiftNavigation, SwiftUINavigation, Dependencies (PointFree)

### 2. Local Engine (`FlyingDutchmanEngine`)
- Swift daemon for privileged/background operations
- Manages Apple Containers via Containerization framework
- Exposes XPC for fast, low-latency control
- Exposes HTTP endpoints via Hummingbird (Docker API compatibility layer)
- Managed via launchd for lifecycle
- Persistence via GRDB (SQLite)

**Key Dependencies**: Hummingbird, SwiftNIO, ServiceLifecycle, Containerization framework

### 3. CLI (`FlyingDutchmanCLI`)
- Command-line interface using ArgumentParser
- Communicates with engine via XPC/HTTP
- Commands: `version`, `doctor`, `containers {list|start|stop|restart}`, `images list`, `stacks list`

### Shared Modules
- **Shared**: Common types, models, logging (swift-log), config, event recording
- **FlyingDutchmanPersistence**: GRDB repositories, database abstraction, seed data
- **FlyingDutchmanContainers**: Containerization framework integration, runtime abstraction
- **FlyingDutchmanNetworking**: Hummingbird server, XPC service/client, HTTP routes, VSOCK connector
- **FlyingDutchmanKubernetes**: SwiftkubeClient integration (stubbed, future)
- **FlyingDutchmanAI**: AI insight generation (stubbed, future)

## Module Dependency Flow

```
FlyingDutchmanApp → FlyingDutchmanNetworking → FlyingDutchmanContainers → Shared
                  ↘ FlyingDutchmanPersistence ↗

FlyingDutchmanEngine → FlyingDutchmanNetworking
                     → FlyingDutchmanPersistence
                     → FlyingDutchmanContainers

FlyingDutchmanCLI → FlyingDutchmanNetworking
                  → FlyingDutchmanContainers
```

## Key Patterns

### Runtime Selection
Use environment variable `FD_RUNTIME` to select container runtime:
- `FD_RUNTIME=native` - Apple Containerization framework (default when available)
- `FD_RUNTIME=cli` - Falls back to `container` CLI tool
- Defaults to stub if neither available

### Communication Protocols
- **XPC**: Used for app ↔ engine communication (low-latency, privileged)
  - `EngineXPCProtocol`, `EngineXPCClient`, `EngineXPCService`, `EngineXPCListener`
- **HTTP/gRPC**: Engine exposes Docker-compatible API via Hummingbird
  - Routes: `ContainersRoutes`, `ImagesRoutes`, `VolumesRoutes`, `NetworksRoutes`, `StacksRoutes`

### Persistence
- **GRDB (SQLite)**: Engine metadata, container state, logs
  - Repositories: `ContainerStore`, `ImageStore`, `VolumeStore`, `NetworkStore`, `StackStore`, `ShimEventStore`, `ContainerLogStore`
- **SwiftData**: UI-specific state (selected section, appearance preferences)

### Design System
- Tokens defined in `Sources/FlyingDutchmanApp/DesignSystem/Tokens/`
  - `Colors.swift`, `Typography.swift`, `Spacing.swift`, `CornerRadius.swift`, `Shadows.swift`, `Animations.swift`
- Components: `GlassCard`, `StatusBadge`, `EmptyStateCard`, `SectionHeader`, `DiagnosticsBanner`
- View extensions: `View+Glass.swift`, `Image+Symbols.swift`
- Preview in `DesignSystemShowcase.swift` via Xcode Previews

## Specification Workflow

Flying Dutchman uses **OpenSpec** for spec-driven development. See `openspec/AGENTS.md` for complete instructions.

### Quick Reference

```bash
openspec list                      # List active changes
openspec list --specs              # List specifications
openspec show [change]             # Display change details
openspec validate [change] --strict # Validate change proposal
openspec archive <change-id> --yes # Archive completed change
```

### Workflow
1. **Create Proposal**: For new features/capabilities, create change in `openspec/changes/[change-id]/`
   - `proposal.md` - Why, what, impact
   - `tasks.md` - Implementation checklist
   - `specs/[capability]/spec.md` - Delta changes (ADDED/MODIFIED/REMOVED requirements)
   - `design.md` (optional) - Technical decisions for complex changes

2. **Validate**: Run `openspec validate [change-id] --strict` before implementation

3. **Implement**: Complete tasks sequentially, update checklist as you go

4. **Archive**: After deployment, run `openspec archive [change-id] --yes` to update specs

### Skip Proposal For
- Bug fixes (restore intended behavior)
- Typos, formatting, comments
- Dependency updates (non-breaking)
- Configuration changes

## Constitution Governance

**ALL design decisions, implementation plans, and code changes MUST align with the core principles below (version 1.0.0, ratified 2025-12-03).**

### Core Principles (Summary)
1. **Platform Constraints**: macOS 26.0+ (Tahoe), Apple Silicon only (NON-NEGOTIABLE) - Containerization framework requires 26.0+
2. **Native-First Architecture**: Prefer Apple frameworks over cross-platform alternatives
3. **Swift-Only Stack**: 100% Swift 6.2, strict concurrency checking
4. **Local-First Philosophy**: Optimize for single-developer workflows, not enterprise
5. **"It Just Works" Experience**: Zero-config defaults, fast, intuitive
6. **Minimal, Surgical Changes**: Change only what's necessary
7. **Opinionated Over Generic**: Guided workflows, not generic wrappers

### Constitution Check (Mandatory)
Before Phase 0 research and after Phase 1 design, verify:
- [ ] Platform constraints enforced (macOS 26.0+ Tahoe, Apple Silicon only)
- [ ] Native-first (Apple frameworks prioritized)
- [ ] Swift-only stack (Swift 6.2, strict concurrency)
- [ ] Local-first scope (no enterprise features)
- [ ] "It just works" (low-latency, clear errors)
- [ ] Minimal/surgical (foundation only, no scope creep)
- [ ] Opinionated (guided workflows, command palette)

### Complexity Tracking
If constitution principles are violated, document in `plan.md` with:
- What violation occurred
- Why it's needed
- Why simpler alternatives were rejected

## Important Development Notes

### Code Style
- **Enforce existing linter rules only** - Don't add new SwiftLint/SwiftFormat rules
- **Prefer Swift macros over Sourcery** - Use Sourcery only for Swift macro limitations
- **Use swift-log for structured logging** - OSLog for system-level diagnostics only

### Testing Philosophy
- Run only existing linters, builds, and tests unless task requires new ones
- Fix only test failures related to current task
- Ignore unrelated bugs or broken tests
- Maintain existing tests; add new tests only when explicitly required

### Avoid Over-Engineering
- Don't add features, refactor code, or make "improvements" beyond what was asked
- Don't add error handling for scenarios that can't happen
- Don't create helpers/utilities for one-time operations
- Don't design for hypothetical future requirements
- Three similar lines is better than a premature abstraction

### Performance Targets
- App launch: <2s
- Status/selection updates: <200ms
- CLI commands: <500ms
- Command palette invocation: <100ms

## Key Dependencies

### Native Apple Frameworks
- Containerization framework (container management)
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

## Explicit Non-Goals

Flying Dutchman does NOT:
- Support Intel Macs (Apple Silicon only)
- Support pre-Tahoe macOS (macOS 26.0+ only - Containerization framework requirement)
- Target enterprise infrastructure (no multi-tenancy, advanced RBAC, audit logs)
- Act as a VM manager (VMs are secondary; Apple Containers are primary)
- Reimplement existing excellent tools (integrate, don't rebuild)

## Additional Resources

- **README.md** - Project vision, status, design system overview
- **OpenSpec Guide** - `openspec/AGENTS.md` - Complete OpenSpec workflow instructions
- **Project Context** - `openspec/project.md` - Tech stack, conventions, current status
- **Active Changes** - `openspec/changes/` - Proposals and implementation tracking
