# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Quick Start

**Platform Requirements**: macOS 15.0+ (Tahoe), Apple Silicon only. Swift 6.2 required.

### Essential Commands

**Build**:
```bash
swift build
```

**Run the main app**:
```bash
swift run FlyingDutchmanApp
```

**Run the engine daemon**:
```bash
swift run FlyingDutchmanEngine
```

**Run the CLI**:
```bash
swift run FlyingDutchmanCLI [command]
```

**Run all tests**:
```bash
swift test
```

**Run tests for a specific target** (e.g., Engine tests):
```bash
swift test --filter FlyingDutchmanEngineTests
```

**Run a single test by name**:
```bash
swift test --filter FlyingDutchmanEngineTests.SomeTestClass.testSomething
```

**Lint code**:
```bash
./scripts/lint.sh
```
This runs both SwiftFormat (format lint) and SwiftLint, enforcing rules defined in `.swiftlint.yml` and `.swiftformat`.

**Format code** (if needed):
```bash
swiftformat Sources Tests --config .swiftformat
```

## Architecture Overview

Flying Dutchman is a **three-layer, Swift-only architecture** for containerization management on macOS.

### Layer 1: UX (FlyingDutchmanApp)
- SwiftUI-based macOS application
- Core UI components: `Sources/FlyingDutchmanApp/Components/` (badges, cards, glass UI)
- Content views: `Sources/FlyingDutchmanApp/Content/` (containers, images, networks, volumes, logs)
- State management: `Sources/FlyingDutchmanApp/State/` (UIState.swift, AppSection.swift)
- Command palette: `Sources/FlyingDutchmanApp/Commands/CommandPalette.swift` (⌘K interface)
- Sidebar navigation: `Sources/FlyingDutchmanApp/Sidebar/` with ViewModel pattern
- Communicates with Local Engine via XPC or gRPC (FlyingDutchmanNetworking)

### Layer 2: Local Engine (FlyingDutchmanEngine)
- Background daemon managing Apple Containers via Containerization.framework
- Core startup: `Sources/FlyingDutchmanEngine/main.swift`
- Launchd integration: `Sources/FlyingDutchmanEngine/Launchd/` (plist generation for persistent background service)
- Orchestrates container lifecycle, persistence, networking
- Exposes HTTP/gRPC endpoints via FlyingDutchmanNetworking

### Layer 3: Integration & CLI (FlyingDutchmanCLI, Networking, Containers)

**Networking** (`Sources/FlyingDutchmanNetworking/`):
- Server: HTTP/gRPC endpoint handler
- XPC bridge: `XPC/` directory (EngineXPCClient, EngineXPCProtocol, EngineXPCService, EngineXPCListener) for privileged control
- Client: HTTP client for external integrations
- Routes: API endpoints organized by resource (containers, images, networks, volumes, stacks)

**Container Runtime** (`Sources/FlyingDutchmanContainers/`):
- `ContainerRuntime.swift` & `ContainerCLIRuntime.swift`: Abstract container operations
- `RuntimeFactory.swift`: Factory pattern for creating runtime implementations
- `ContainerizationClient.swift`: Direct Apple Containerization.framework integration
- `DockerShimServer.swift`: Docker API compatibility layer (translation, not emulation)

**CLI** (`Sources/FlyingDutchmanCLI/`):
- Entry point: `Sources/FlyingDutchmanCLI/main.swift`
- Argument parsing via swift-argument-parser
- Communicates with Engine via networking layer

**Kubernetes** (`Sources/FlyingDutchmanKubernetes/`):
- SwiftkubeClient integration for K8s API calls
- Stub implementation ready for expansion

**AI Integration** (`Sources/FlyingDutchmanAI/`):
- InsightGenerator.swift: Placeholder for AI-driven features

### Shared Layer (Sources/Shared/)
- **Models**: Container, Image, Network, Volume, Stack, Project, UIState, DockerEvent (domain types)
- **Config**: Configuration management (Config.swift)
- **Design tokens**: UI constants and theming (DesignTokens.swift)
- **Runtime checks**: Platform/capability detection (RuntimeChecks.swift)
- **Event recording**: EventRecorder.swift for system events
- **Command registry**: CommandRegistry.swift for ⌘K palette

### Persistence Layer (FlyingDutchmanPersistence)
- GRDB-based SQLite database
- Repositories: `Sources/FlyingDutchmanPersistence/Repositories/` 
  - ContainerStore, ImageStore, NetworkStore, VolumeStore, StackStore
  - ContainerLogStore, ShimEventStore
- Database schema: `Sources/FlyingDutchmanPersistence/Database.swift`

## Key Design Patterns

**Module Boundaries**: Each target (App, Engine, Networking, Containers, Persistence) is independently testable and has minimal coupling via the Shared layer.

**Communication**: 
- App ↔ Engine: XPC (fast, privileged) or gRPC (external tools)
- Engine ↔ Containers: Direct Apple Containerization.framework
- Engine ↔ Persistence: GRDB SQLite

**Shared Types**: All models (Container, Image, etc.) in `Shared/Models/` are used across layers, ensuring type safety.

## Code Standards & Linting

- **Swift version**: 6.2 with strict concurrency checking
- **Max line length**: 120 (warning), 200 (error)
- **Max type body**: 300 lines (warning), 500 (error)
- **Max file length**: 600 lines (warning), 900 (error)
- **Format rules**: SwiftFormat with 4-space indentation, argument wrapping, explicit self
- **Disabled rules**: trailing_whitespace, todo, identifier_name; redundantSelf, nestedTernary, redundantType disabled in format
- **Tools**: SwiftLint + SwiftFormat both required (see `.swiftlint.yml` and `.swiftformat`)

## Project Governance

See `.specify/memory/constitution.md` for core principles:
- macOS Tahoe + Apple Silicon only (no Intel, no backward compatibility)
- Native-first: Apple frameworks over third-party alternatives
- 100% Swift 6.2 (app, engine, CLI, shared types)
- Local-first philosophy (developer tools, not enterprise)
- Zero-config defaults, guided workflows, ⌘K command palette
- Minimal, surgical changes; opinionated over generic

## Testing

- Unit tests per target: `Tests/FlyingDutchmanAppTests/`, `Tests/FlyingDutchmanEngineTests/`, etc.
- Integration tests: `Tests/IntegrationTests/`
- Run tests with `swift test` or filtered by target/test name
- Maintain existing tests; add new tests only when explicitly required

## Dependencies

Key external packages:
- **Hummingbird 2.0+**: HTTP/gRPC server framework
- **async-http-client 1.20+**: HTTP client
- **swift-argument-parser 1.3+**: CLI argument parsing
- **swift-log 1.6+**: Structured logging
- **swift-service-lifecycle 2.0+**: Service initialization lifecycle
- **GRDB 7.8+**: SQLite ORM/query builder
- **swift-nio 2.60+**: Async concurrency primitives
- **swiftkube/client 0.20+**: Kubernetes client

## Deployment & CI/CD

- **CI**: GitHub Actions workflow (`/.github/workflows/lint.yml`) runs on macOS 15 for lint checks
- **Launchd**: Engine runs as background service via plist generation (see FlyingDutchmanEngine/Launchd/)
- **Schemes**: Tuist disables automatic scheme generation (see `Tuist/Project.swift`)
- **Deployment target**: macOS 15.0 enforced across all targets

## Common Workflows

**Add a new container view**:
1. Create view in `FlyingDutchmanApp/Content/`
2. Add to AppSection enum in `FlyingDutchmanApp/State/AppSection.swift`
3. Wire up in SidebarView or MainWindow
4. Ensure state flows via Shared models (Container, etc.)

**Add a new API route**:
1. Create route handler in `FlyingDutchmanNetworking/Routes/`
2. Register in Server.swift
3. Implement backend logic in appropriate Engine or Containers layer
4. Write tests in `Tests/IntegrationTests/`

**Extend container runtime**:
1. Add method to abstract ContainerRuntime
2. Implement in ContainerCLIRuntime or Containerization client
3. Ensure tests verify both implementations
4. Update CLI command if needed

## File Structure Reference

```
Sources/
  Shared/               # Domain models, config, events (used across layers)
    Models/
    Commands/
  FlyingDutchmanApp/    # SwiftUI UX layer
    Components/
    Content/
    Sidebar/
  FlyingDutchmanEngine/ # Background engine daemon
  FlyingDutchmanNetworking/ # XPC, gRPC, HTTP routes
    Routes/
    XPC/
  FlyingDutchmanContainers/ # Container runtime abstraction
  FlyingDutchmanPersistence/ # GRDB + SQLite
    Repositories/
  FlyingDutchmanCLI/    # CLI entry point
  FlyingDutchmanKubernetes/ # K8s integration (pluggable)
  FlyingDutchmanAI/     # AI features (pluggable)

Tests/
  FlyingDutchmanAppTests/
  FlyingDutchmanEngineTests/
  FlyingDutchmanCLITests/
  IntegrationTests/
```
