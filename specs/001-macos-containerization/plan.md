# Implementation Plan: macOS Containerization

**Branch**: `001-macos-containerization` | **Date**: 2025-12-03 | **Spec**: specs/001-macos-containerization/spec.md
**Input**: Feature specification from `/specs/001-macos-containerization/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

Deliver a native macOS Tahoe containerization experience using Apple Containerization as the primary runtime, with a Swift daemon (FlyingDutchmanEngine) exposed via XPC + HTTP, SwiftUI UI, and a Docker HTTP compatibility shim. Integrate GRDB persistence, SwiftNIO/Hummingbird networking, SwiftkubeClient for dev-cluster flows, and optional Podman/VM fallback for unsupported Docker semantics. Priority is low-latency container lifecycle, image pulls, stacks, logs/metrics, and a K3s-based dev cluster.

## Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the project. The structure here is presented in advisory capacity to guide
  the iteration process.
-->

**Language/Version**: Swift 6.2 (strict concurrency)  
**Primary Dependencies**: containerization, SwiftNIO, Hummingbird 2, AsyncHTTPClient, SwiftkubeClient, GRDB, swift-log, swift-service-lifecycle, swift-argument-parser, SwiftData (UI state), Optional: SwiftAI/Stakpak, SwiftFormat/SwiftLint (dev)  
**Storage**: SQLite via GRDB for engine metadata; SwiftData for UI state  
**Testing**: XCTest (unit/integration), potential contract tests for Docker shim and HTTP API  
**Target Platform**: macOS Tahoe 26+, Apple Silicon only  
**Project Type**: macOS app + launchd daemon + CLI + internal HTTP/XPC services  
**Performance Goals**: Shim responses <1s; container list/start/stop <500ms; UI 60fps; image pulls with sub-second progress updates; dev cluster up in <2 minutes  
**Constraints**: Tahoe-only, Apple Silicon-only; native-first (Containerization, Virtualization.framework); minimal VM usage; graceful degradation when engine unavailable; clear unsupported-feature errors in shim  
**Scale/Scope**: Local-first developer machine; dozens to hundreds of containers, single dev cluster, low concurrency

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- Platform constraints: macOS Tahoe + Apple Silicon only → adhered to (no Intel, no pre-Tahoe).
- Native-first: Apple Containerization, Virtualization.framework, SwiftUI, SwiftNIO → adhered to (no non-native runtime).
- Swift-only stack: all components in Swift 6.2; optional FFI only if unavoidable → adhered to.
- Local-first: local dev focus, Docker shim for compatibility, no enterprise features → adhered to.
- “It just works”: prioritize low-latency, clear errors, zero heavy VM by default → adhered to.
- Minimal, surgical changes: modular SPM/Tuist, narrow scope per story → adhered to.
- Opinionated over generic: app-centric views, guided stacks, explicit unsupported-feature messaging → adhered to.

## Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── plan.md              # This file (/speckit.plan command output)
├── research.md          # Phase 0 output (/speckit.plan command)
├── data-model.md        # Phase 1 output (/speckit.plan command)
├── quickstart.md        # Phase 1 output (/speckit.plan command)
├── contracts/           # Phase 1 output (/speckit.plan command)
└── tasks.md             # Phase 2 output (/speckit.tasks command - NOT created by /speckit.plan)
```

### Source Code (repository root)
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths (e.g., apps/admin, packages/something). The delivered plan must
  not include Option labels.
-->

```text
Sources/
├── FlyingDutchmanApp/               # SwiftUI macOS app
├── FlyingDutchmanEngine/            # Daemon entry + lifecycle
├── FlyingDutchmanContainers/        # Containerization integration + Docker shim
├── FlyingDutchmanPersistence/       # GRDB schemas + SwiftData store
├── FlyingDutchmanNetworking/        # Hummingbird/SwiftNIO HTTP API
├── FlyingDutchmanKubernetes/        # SwiftkubeClient integration
├── FlyingDutchmanAI/                # Optional AI/agent bridges (feature-flagged)
└── FlyingDutchmanCLI/               # swift-argument-parser CLI

Tests/
├── FlyingDutchmanAppTests/
├── FlyingDutchmanEngineTests/
├── FlyingDutchmanContainersTests/
├── FlyingDutchmanCLITests/
└── ContractTests/            # Docker shim + HTTP contract tests
```

**Structure Decision**: SPM + Tuist workspace with module-per-domain (App, Engine, Containers, Persistence, Networking, Kubernetes, AI, CLI). Launchd plist and socket paths live in EngineCore; shim socket under `/var/run/flyingdutchman-docker.sock`.

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
