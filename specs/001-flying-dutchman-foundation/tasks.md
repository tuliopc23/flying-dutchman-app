# Tasks: Flying Dutchman Foundation

**Input**: `specs/001-flying-dutchman-foundation/` (spec + plan + research)  
**Prerequisites**: plan.md (structure), spec.md (user stories), research.md (tech choices)

## Phase 1: Setup (Shared Infrastructure)

- [x] T001 [P] Initialize Tuist/SwiftPM workspace with modules `FlyingDutchmanApp`, `FlyingDutchmanEngine`, `FlyingDutchmanCLI`, `FlyingDutchmanPersistence`, `FlyingDutchmanNetworking` in `Package.swift`
- [ ] T002 [P] Configure tooling (SwiftLint, SwiftFormat, swift-log) and CI lint target
- [ ] T003 Create `Tuist/Project.swift` and workspace targets mirroring the SPM modules

## Phase 2: Foundational (Blocking Prerequisites)

- [x] T010 Scaffold launchd-managed engine target with swift-service-lifecycle hooks (`Sources/FlyingDutchmanEngine/EngineService.swift`)
- [x] T011 Implement internal control surfaces: XPC stub plus Hummingbird HTTP stub (`Sources/FlyingDutchmanNetworking/Server.swift`, `Sources/FlyingDutchmanNetworking/XPC/*`)
- [x] T012 Set up persistence: GRDB database bootstrap for engine metadata and SwiftData container for UI state (`Sources/FlyingDutchmanPersistence/`)
- [x] T013 Wire structured logging across app/engine/CLI (`Sources/*/Logging+Factory.swift`)

## Phase 3: User Story 1 – Launch Application and View Status (P1)

- [x] T020 Build SwiftUI Tahoe window with Liquid Glass surfaces and SF Symbols 7 status indicator (`Sources/FlyingDutchmanApp/Content/MainWindow.swift`)
- [x] T021 Implement engine status fetch via networking layer and bind to UI (running/stopped states)
- [ ] T022 Support appearance changes (light/dark) and validate glass materials adapt correctly

## Phase 4: User Story 2 – Browse Container Projects (P2)

- [x] T030 Create sidebar view model with mock project data backed by persistence (`Sources/FlyingDutchmanApp/Sidebar/SidebarViewModel.swift`)
- [x] T031 Render sidebar list with status chips and empty state (`Sources/FlyingDutchmanApp/Sidebar/SidebarView.swift`, `Sources/FlyingDutchmanApp/Sidebar/EmptyStateView.swift`)
- [x] T032 Implement selection flow to update main content placeholder (`Sources/FlyingDutchmanApp/Content/ProjectDetailView.swift`)

## Phase 5: User Story 3 – Execute Basic CLI Commands (P2)

- [ ] T040 Implement CLI scaffolding with swift-argument-parser (`Sources/FlyingDutchmanCLI/main.swift`)
- [ ] T041 Add `version` and `doctor` commands; route to engine HTTP/XPC endpoints for diagnostics
- [ ] T042 Add stub `containers list` command returning mock data; ensure clear error handling on failure

## Phase 6: User Story 4 – Invoke Command Palette (P3)

- [ ] T050 Build shared command registry model reused by UI and CLI (`Sources/FlyingDutchmanApp/Commands/CommandRegistry.swift`)
- [ ] T051 Implement ⌘K palette UI with Liquid Glass and fuzzy search (`Sources/FlyingDutchmanApp/Commands/CommandPaletteView.swift`)
- [ ] T052 Wire palette actions to engine stubs (open status, toggle appearance, focus sidebar)

## Phase 7: Polish & Cross-Cutting

- [ ] T060 Add quickstart.md instructions for building/running app, engine, and CLI
- [ ] T061 Add diagnostics for missing Containerization framework and platform gating (Tahoe/Apple Silicon)
- [ ] T062 Smoke-test end-to-end: launch app → view status → sidebar selection → CLI version/doctor

## Dependencies & Execution Order

- Phases 1–2 block all user-story work; user stories can proceed in parallel after Phase 2.
- Command palette (Phase 6) depends on command registry (T050) and basic engine status wiring (T021).
- CLI tasks (Phase 5) depend on networking/XPC stubs (T011) and logging (T013).
