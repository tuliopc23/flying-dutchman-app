# Implementation Plan: Flying Dutchman Foundation

**Branch**: `001-flying-dutchman-foundation` | **Date**: 2025-12-03 | **Spec**: specs/001-flying-dutchman-foundation/spec.md
**Input**: Feature specification from `/specs/001-flying-dutchman-foundation/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

Deliver the base macOS Tahoe app + engine shell: SwiftUI Liquid Glass window with engine status, sidebar for projects, command palette, and baseline CLI (version/doctor/containers list). Architecture is Swift-only, Tahoe/Apple Silicon-only, with launchd-managed engine, XPC + HTTP surface, and GRDB + SwiftData persistence.

## Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the project. The structure here is presented in advisory capacity to guide
  the iteration process.
-->

**Language/Version**: Swift 6.2  
**Primary Dependencies**: SwiftUI, Containerization (runtime), SwiftNIO, Hummingbird, AsyncHTTPClient, GRDB, SwiftData, swift-log, swift-service-lifecycle, swift-argument-parser  
**Storage**: SQLite via GRDB (engine metadata), SwiftData (UI state)  
**Testing**: XCTest (unit + integration); manual UI smoke for Liquid Glass and command palette  
**Target Platform**: macOS Tahoe 26+, Apple Silicon only  
**Project Type**: macOS app + launchd daemon + CLI  
**Performance Goals**: App launch <2s; status/selection updates <200ms; CLI commands <500ms; palette invocation <100ms  
**Constraints**: Tahoe/Apple Silicon-only; native-first (no heavy VM); clear platform gating; minimal latency  
**Scale/Scope**: Local-first developer app with mock data for P1/P2 flows

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- Platform constraints enforced (Tahoe, Apple Silicon).
- Native-first (SwiftUI, Containerization, SwiftNIO) and Swift-only stack.
- Local-first scope (no enterprise features).
- “It just works”: low-latency UI, clear errors when engine unavailable.
- Minimal/surgical: foundation only, no extra features beyond spec stories.
- Opinionated: sidebar + command palette as primary flows.

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
├── FlyingDutchmanApp/
├── FlyingDutchmanEngine/
├── FlyingDutchmanPersistence/
├── FlyingDutchmanNetworking/
├── FlyingDutchmanCLI/
└── Shared/

Tests/
├── FlyingDutchmanAppTests/
├── FlyingDutchmanEngineTests/
├── FlyingDutchmanCLITests/
└── IntegrationTests/
```

**Structure Decision**: SPM + Tuist workspace with module-per-domain; shared types across app/engine/CLI; launchd plist and lifecycle in FlyingDutchmanEngine; networking in FlyingDutchmanNetworking; persistence in FlyingDutchmanPersistence.

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
