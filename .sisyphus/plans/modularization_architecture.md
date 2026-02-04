# Plan: Modularization (Reality-Based) + Feature Extraction

This repo is already partially modularized with Tuist into `Core/`, `Domain/`, and `Product/` projects. The missing piece is `Features/` extraction (UI micro-features) plus a few config/consistency fixes.

## TL;DR

- Keep the existing macro-modules (`Projects/Core`, `Projects/Domain`, `Projects/Product`) as the foundation.
- Add `Projects/Features/*` using the existing 5-target micro-feature pattern (`Interface`, `Implementation`, `Testing`, `Tests`, `Example`).
- Extract 8 UI features out of `Projects/Product/App/Sources` (Shell, Containers, Stacks, Images, Volumes, Networks, Diagnostics, Settings).
- Make caching and strict concurrency configuration accurate for Tuist 4.x (config lives in `Tuist.swift`, not `Tuist/Config.swift`).

## Status (Verified 2026-02-04)

- [x] Workspace includes `Projects/Features/**` (`Workspace.swift`).
- [x] Strict concurrency settings applied in `.core(...)`, `.domain(...)`, `.feature(...)` helpers (`Tuist/ProjectDescriptionHelpers/Target+Helpers.swift`).
- [x] `Projects/Features/Settings` exists with `Project.swift` using `makeFeature(...)`.
- [x] `SettingsView` moved into `Projects/Features/Settings/Sources` and wired from the App.
- [x] Tuist caching config enabled in `Tuist.swift` (`generationOptions: .options(enableCaching: true)`).
- [x] `Projects/Product/App/Sources/DesignSystem/**` removed; Core `DesignSystem` is source of truth.
- [x] `Projects/Product/App/Sources/Components/**` duplicates removed; Core `UIComponents` is source of truth.
- [ ] Remaining feature extractions not started (Shell, Containers, Stacks, Images, Volumes, Networks, Diagnostics).

## Current Repo Reality (Verified Locally)

### Tuist entry points
- `Tuist.swift` is the Tuist config manifest (Tuist 4.x). There is no `Tuist/Config.swift`.
- `Workspace.swift` includes:
  - `Projects/Core/**`
  - `Projects/Domain/**`
  - `Projects/Product/**`

### Existing modules (already implemented)
- Core:
  - `Projects/Core/Shared/Project.swift`
  - `Projects/Core/Persistence/Project.swift`
  - `Projects/Core/DesignSystem/Project.swift`
  - `Projects/Core/UIComponents/Project.swift`
- Domain:
  - `Projects/Domain/ContainerKit/Project.swift`
  - `Projects/Domain/NetworkKit/Project.swift`
  - `Projects/Domain/KubeKit/Project.swift`
  - `Projects/Domain/AIKit/Project.swift`
- Product:
  - `Projects/Product/App/Project.swift`
  - `Projects/Product/Engine/Project.swift`
  - `Projects/Product/CLI/Project.swift`

### Micro-feature tooling (already implemented)
- `Tuist/ProjectDescriptionHelpers/Feature.swift` defines `makeFeature(name:dependencies:resources:)` that generates 5 targets with Swift 6.2 + strict concurrency.
- `Tuist/ProjectDescriptionHelpers/Target+Helpers.swift` defines `.core`, `.domain`, `.feature` convenience constructors.

### Known gaps (this plan addresses)
- `Projects/Features/**` does not exist yet and is not included in `Workspace.swift`.
- Strict concurrency settings are applied by `makeFeature(...)` but not by `.core(...)`/`.domain(...)` helpers.
- `Projects/Product/App/Sources/DesignSystem/**` and `Projects/Product/App/Sources/Components/**` still exist even though `Projects/Core/DesignSystem` and `Projects/Core/UIComponents` exist. This duplication needs consolidation.
- Tuist Cloud / caching setup in the plan was inaccurate. Config must be done in `Tuist.swift`.

## Goals / Non-goals

### Goals
- Introduce `Projects/Features/<FeatureName>` for 8 UI features with strict boundaries.
- Make `Projects/Product/App` a thin composition layer.
- Enforce (as much as practical) layering: Core -> Domain -> Features -> Product.
- Enable Tuist cache configuration in a way that does not block headless verification.

### Non-goals
- Rewriting Core/Domain into interface/implementation splits (already in progress elsewhere; out of scope here).
- Changing product behavior, UX, or adding new app capabilities.

## Boundary Rules

- Features MUST NOT depend on other feature implementations.
- Shell is the orchestrator feature; it may depend on other features via Interfaces only.
- Features may depend on Domain frameworks and Core frameworks.
- Product targets (`App`, `Engine`, `CLI`) are the only composition roots that wire implementations.

## Feature List (Target Outcomes)

Reference mapping already exists in `openspec/plans/feature_extraction.md`.

| Feature | Extract From | Primary Domain Dependencies |
| --- | --- | --- |
| Shell | `MainWindow`, `SidebarView`, `MenuBarView`, commands | Feature Interfaces |
| Containers | `ContainerListView`, `ContainerDetailView` | `ContainerKit` |
| Stacks | `StacksView`, `ProjectDetailView` | `ContainerKit` |
| Images | `ImageListView` | `ContainerKit` |
| Volumes | `VolumeListView` | `ContainerKit` |
| Networks | `NetworkListView` | `NetworkKit` |
| Diagnostics | `LogsView`, `EventsView` | Core (UIComponents/Shared) |
| Settings | `SettingsView` | `Persistence` |

## Verification Strategy

### What must be headless-verifiable
- All extraction steps: `tuist generate` and `xcodebuild ... build`.

### What is optional / may require credentials
- Tuist Cloud auth (`tuist auth login`) and remote cache. These are kept optional so the plan can complete without a Tuist Cloud account.

### Recommended commands
```bash
tuist generate
xcodebuild -list -workspace FlyingDutchman.xcworkspace
# Then build the relevant scheme(s) discovered above.
```

## Execution Plan

### Wave 0: Baseline + Safety Nets

0.1 Baseline generation/build
- Run `tuist generate`.
- List schemes: `xcodebuild -list -workspace FlyingDutchman.xcworkspace`.
- Build the main product schemes (App, Engine, CLI).

Acceptance criteria
- `tuist generate` exit code 0.
- `xcodebuild ... build` succeeds for all three products.

0.2 Freeze architecture assumptions in docs
- Ensure this plan stays aligned with OpenSpec constraints (macOS 26+, Swift 6.2, Tuist is source of truth).

### Wave 1: Tuist Foundation (Small, Mechanical)

1.1 Workspace includes Features
- Update `Workspace.swift` to also include `Projects/Features/**`.

Acceptance criteria
- `tuist generate` still succeeds.

1.2 Normalize strict Swift settings across Core/Domain/Feature helpers
- Update `Tuist/ProjectDescriptionHelpers/Target+Helpers.swift` so `.core(...)`, `.domain(...)`, `.feature(...)` apply the same Swift 6.2 + strict concurrency settings used in `Tuist/ProjectDescriptionHelpers/Feature.swift`.

Acceptance criteria
- `tuist generate` succeeds.
- Product builds still succeed.

1.3 Caching config (optional, non-blocking)
- Update `Tuist.swift` to:
  - Keep `swiftVersion: "6.2"`.
  - Enable Xcode caching generation option (`enableCaching: true`) as an opt-in.
  - Keep `cloud: .cloud(...)` commented unless credentials/project id are available.

Acceptance criteria
- `tuist generate` succeeds with no auth.

Notes
- Remote cache is intentionally NOT required to proceed.
- If Cloud is enabled later, capture required values (fullHandle, projectId) in this plan.

### Wave 2: Consolidate Core UI (Remove Duplicates Safely)

2.1 DesignSystem duplication cleanup
- Compare:
  - `Projects/Core/DesignSystem/Sources/**`
  - `Projects/Product/App/Sources/DesignSystem/**`
- Choose one source of truth (Core). Move any missing tokens/extensions into Core, then delete the duplicate in Product.

2.2 UIComponents duplication cleanup
- Compare:
  - `Projects/Core/UIComponents/Sources/**`
  - `Projects/Product/App/Sources/Components/**`
- Same approach: migrate missing pieces to Core, then delete duplicates from Product.

Acceptance criteria
- `tuist generate` succeeds.
- App builds successfully and imports Core modules for DesignSystem/UIComponents.

### Wave 3: Pilot Feature Extraction (Settings)

3.1 Create `Projects/Features/Settings`
- Add `Projects/Features/Settings/Project.swift` that uses `makeFeature(name: "Settings", ...)`.
- Move `Projects/Product/App/Sources/Content/SettingsView.swift` into the Settings implementation target.
- Define the public interface types in the Interface target (minimal surface): types needed by Shell/App to present Settings.

3.2 Example app
- Implement `SettingsExample` entry point for isolated compilation/runtime smoke tests.

Acceptance criteria
- `tuist generate` succeeds.
- `xcodebuild ... build` succeeds for SettingsExample (if a scheme is generated) OR an explicit scheme is added.
- Product App builds and still shows Settings.

### Wave 4: Parallel Feature Extractions (Images / Volumes / Networks / Diagnostics)

Repeat the Settings playbook for:
- `Images` (from `Projects/Product/App/Sources/Content/ImageListView.swift`)
- `Volumes` (from `Projects/Product/App/Sources/Content/VolumeListView.swift`)
- `Networks` (from `Projects/Product/App/Sources/Content/NetworkListView.swift`)
- `Diagnostics` (from `Projects/Product/App/Sources/Content/LogsView.swift`, `Projects/Product/App/Sources/Content/EventsView.swift`)

Acceptance criteria (per feature)
- Feature Example builds OR the feature is included in App build successfully.
- No new feature-to-feature imports.

### Wave 5: Complex Feature Extractions (Containers / Stacks)

- `Containers` (from `ContainerListView.swift`, `ContainerDetailView.swift`)
- `Stacks` (from `StacksView.swift`, `ProjectDetailView.swift`)

Acceptance criteria
- App builds and navigation remains intact.
- Domain dependencies remain in Domain modules (no Domain logic moved into Features).

### Wave 6: Shell (Orchestrator) + Final Wiring

6.1 Extract Shell
- Move:
  - `MainWindow.swift`
  - `SidebarView.swift`
  - `MenuBarView.swift`
  - `AppCommands.swift`, `CommandPalette.swift`
  - `AppSection.swift`
- Decide staged approach for `AppState`:
  - Stage A: keep `AppState` in Product/App while Shell is extracted (minimize blast radius).
  - Stage B: move `AppState` into Shell implementation once all feature surfaces are stable.

6.2 Composition root stays in Product/App
- `Projects/Product/App/Project.swift` depends on:
  - `Shell` implementation
  - all other Feature implementations
  - Core + Domain
- `Projects/Product/App/Sources/FlyingDutchmanAppMain.swift` becomes wiring only.

Acceptance criteria
- `tuist generate` succeeds.
- App builds and runs.
- No feature imports another feature implementation.

## Risks / Watchouts

- Schemes: if automatic schemes are disabled, Example targets will need explicit Scheme definitions.
- Duplication cleanup: deleting Product copies of DesignSystem/UIComponents must be preceded by a reconciliation pass.
- Strict concurrency: applying strict concurrency settings to all targets may surface latent warnings/errors; treat as part of the migration.
- Cloud caching: enabling Tuist Cloud requires project/account setup (fullHandle/projectId). Keep optional.

## Done Definition

- `Workspace.swift` includes `Projects/Features/**`.
- 8 features exist under `Projects/Features/*` with Interface/Implementation/Testing/Tests/Example targets.
- `Projects/Product/App` contains only composition/wiring and minimal glue.
- No duplicate DesignSystem/UIComponents code remains in Product/App.
- `tuist generate` and product builds succeed headlessly.
