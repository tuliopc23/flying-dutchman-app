# Plan: Full Tuist Modularization & Architecture Refactor

## TL;DR

> **Quick Summary**: Refactor the entire project into a strict **Tuist Modular Architecture (TMA)** with "Micro-features". Enable Tuist Cloud caching and configure strict dependency enforcement.
> 
> **Deliverables**:
> - `Tuist/Config.swift` with Cloud & Cache enabled
> - `Tuist/ProjectDescriptionHelpers` for Micro-feature generation
> - `Projects/Core/*` (Shared utilities, Design System)
> - `Projects/Features/*` (8 features: Shell, Containers, Settings, etc.)
> - `Projects/Product/App` (Thin composition layer)
> 
> **Estimated Effort**: Large (Architecture Refactor)
> **Parallel Execution**: YES - 3 Waves
> **Critical Path**: Config → Helpers → Core → Settings (Pilot) → Parallel Features → App Wiring

---

## Context

### Original Request
"Organize, modularize the project totally... strict strong boundaries... independent features... Tuist Cloud caching... Swift 6.2 / Xcode 26.2... seamless generation."

### Interview Summary
**Key Discussions**:
- **Registry**: Using **Tuist Cloud** for binary caching.
- **Enforcement**: **Strict** layering (Core < Domain < Features < App).
- **Structure**: **Full Micro-features** (Interface, Sources, Tests, Testing, Example).

### Metis Review
**Identified Gaps** (addressed):
- **Circular Dependencies**: Solved by `Interface` targets for every feature.
- **Resource Bundles**: Explicit `resources: ["Resources/**"]` in helpers; use `Bundle.module`.
- **Entitlements**: `Engine` and `Virtualization` entitlements must be preserved.

---

## Work Objectives

### Core Objective
Transform `FlyingDutchman` into a scalable, cache-optimized, modular codebase using Tuist.

### Concrete Deliverables
- [ ] `Tuist/Config.swift` configured for Cloud
- [ ] `Tuist/ProjectDescriptionHelpers/Feature+Template.swift`
- [ ] 8 Feature Modules (`Settings`, `Containers`, `Images`, etc.)
- [ ] 1 Core Module (`DesignSystem`, `UIComponents`)
- [ ] Fully generated `FlyingDutchman.xcworkspace`

### Must Have
- `COMPILATION_CACHE_ENABLE_CACHING = YES`
- Strict concurrency (`-Xfrontend -strict-concurrency=complete`)
- Independent "Example" apps for features (for isolated dev)

### Must NOT Have (Guardrails)
- Direct dependencies between Feature Implementations (Must use Interfaces)
- Legacy Swift 5 patterns
- Logic in Views (use MVVM/Observable)

---

## Verification Strategy (MANDATORY)

> **UNIVERSAL RULE: ZERO HUMAN INTERVENTION**
> ALL tasks in this plan MUST be verifiable WITHOUT any human action.

### Test Decision
- **Infrastructure exists**: YES (Tuist + XCTest/Swift Testing)
- **Automated tests**: YES (TDD for logic, Tests-after for UI refactor)
- **Framework**: `Testing` (Swift Testing) + `XCTest`

### Agent-Executed QA Scenarios (MANDATORY)

**Type 1: Build Verification (CLI)**
```
Scenario: Tuist generates valid project
  Tool: interactive_bash (tmux)
  Steps:
    1. tuist generate
    2. Assert: Exit code 0
    3. Assert: "Generating workspace FlyingDutchman" in output
    4. xcodebuild -workspace FlyingDutchman.xcworkspace -scheme FlyingDutchmanApp -configuration Debug clean build
    5. Assert: "** BUILD SUCCEEDED **"
```

**Type 2: Feature Isolation (CLI)**
```
Scenario: Feature Example app runs independently
  Tool: interactive_bash (tmux)
  Steps:
    1. tuist generate
    2. xcodebuild -workspace FlyingDutchman.xcworkspace -scheme FeatureSettingsExample -configuration Debug build
    3. Assert: "** BUILD SUCCEEDED **"
```

**Type 3: Caching (CLI)**
```
Scenario: Caching is active (Local)
  Tool: interactive_bash (tmux)
  Steps:
    1. tuist clean
    2. tuist generate
    3. tuist build FlyingDutchmanApp
    4. tuist build FlyingDutchmanApp (second run)
    5. Assert: "Cached" or significantly faster time in output
```

---

## Execution Strategy

### Parallel Execution Waves

```
Wave 1 (Foundation):
├── Task 1: Tuist Config & Cloud Setup
└── Task 2: ProjectDescriptionHelpers (Micro-feature Factory)

Wave 2 (Core & Pilot):
├── Task 3: Extract Core (DesignSystem, Utils)
└── Task 4: Pilot Feature "Settings" (Simplest)

Wave 3 (Parallel Features):
├── Task 5: Feature "Images"
├── Task 6: Feature "Volumes"
├── Task 7: Feature "Networks"
└── Task 8: Feature "Diagnostics"

Wave 4 (Complex Features):
├── Task 9: Feature "Containers" (High coupling)
└── Task 10: Feature "Stacks"

Wave 5 (Shell & App):
├── Task 11: Feature "Shell" (Orchestrator)
└── Task 12: Wiring "Product/App"
```

---

## TODOs

- [ ] 1. **Tuist Config & Cloud Setup**

  **What to do**:
  - Update `Tuist/Config.swift`
  - Enable `cloud` (placeholder URL if no account, prioritized local cache for verification)
  - Enable `generationOptions` with `.lastKnownGood`
  - Set `swiftVersion` to "6.2"

  **Recommended Agent Profile**:
  - **Category**: `quick`
  - **Skills**: [`axiom-build-performance`]

  **Acceptance Criteria**:
  - [ ] `tuist generate` runs successfully
  - [ ] Config includes `cloud` block (can be commented out)
  - [ ] `COMPILATION_CACHE_ENABLE_CACHING` is enabled in `Settings` dictionary

  **Commit**: `chore(tuist): enable cloud and caching`

- [ ] 2. **Project Helpers (Micro-feature Factory)**

  **What to do**:
  - Create `Tuist/ProjectDescriptionHelpers/Feature.swift`
  - Implement `makeFeature(name:dependencies:)` function
  - Function must generate 5 targets:
    - `name`: The implementation (Sources)
    - `nameInterface`: The protocol (Sources)
    - `nameTests`: Unit tests
    - `nameTesting`: Test helpers/mocks
    - `nameExample`: Example app
  - Apply strict concurrency settings to all

  **Recommended Agent Profile**:
  - **Category**: `ultrabrain`
  - **Skills**: [`axiom-build-performance`]

  **Acceptance Criteria**:
  - [ ] Helper compiles (verified via `tuist edit` or `tuist generate`)
  - [ ] Supports `Interface` target generation
  - [ ] Supports `Example` app generation

  **Commit**: `feat(tuist): add feature factory helper`

- [ ] 3. **Extract Core Module**

  **What to do**:
  - Move `Projects/Product/App/Sources/DesignSystem` -> `Projects/Core/DesignSystem/Sources`
  - Move `Projects/Product/App/Sources/Components` -> `Projects/Core/UIComponents/Sources`
  - Create `Projects/Core/Project.swift`
  - Update `Projects/Core/Project.swift` to export these as a framework

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`axiom-swiftui-architecture`]

  **Acceptance Criteria**:
  - [ ] `tuist generate` succeeds
  - [ ] `Core` target builds independently
  - [ ] Files are physically moved

  **Commit**: `refactor(core): extract design system and components`

- [ ] 4. **Pilot Feature: Settings**

  **What to do**:
  - Create `Projects/Features/Settings`
  - Use `makeFeature(name: "Settings")` in `Project.swift`
  - Move `SettingsView` and related logic from `Projects/Product/App` to `Projects/Features/Settings/Sources`
  - Create `SettingsFeatureInterface`
  - Create `SettingsExample` app entry point

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`
  - **Skills**: [`axiom-swiftui-architecture`]

  **Acceptance Criteria**:
  - [ ] `tuist generate` succeeds
  - [ ] `SettingsExample` scheme builds and runs
  - [ ] `Settings` implementation depends on `Core`
  - [ ] `Settings` interface is public

  **Commit**: `refactor(settings): extract settings feature`

- [ ] 5. **Feature: Images** (Wave 3)

  **What to do**:
  - Extract `ImageListView` and logic
  - Move to `Projects/Features/Images`
  - Dependency: `ContainerKit` (Domain)

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`

  **Acceptance Criteria**:
  - [ ] `ImagesExample` builds
  - [ ] Tests run green

  **Commit**: `refactor(images): extract images feature`

- [ ] 6. **Feature: Volumes** (Wave 3)

  **What to do**:
  - Extract `VolumeListView`
  - Move to `Projects/Features/Volumes`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`

  **Acceptance Criteria**:
  - [ ] `VolumesExample` builds

  **Commit**: `refactor(volumes): extract volumes feature`

- [ ] 7. **Feature: Networks** (Wave 3)

  **What to do**:
  - Extract `NetworkListView`
  - Move to `Projects/Features/Networks`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`

  **Acceptance Criteria**:
  - [ ] `NetworksExample` builds

  **Commit**: `refactor(networks): extract networks feature`

- [ ] 8. **Feature: Diagnostics** (Wave 3)

  **What to do**:
  - Extract `LogsView`, `EventsView`
  - Move to `Projects/Features/Diagnostics`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`

  **Acceptance Criteria**:
  - [ ] `DiagnosticsExample` builds

  **Commit**: `refactor(diagnostics): extract diagnostics feature`

- [ ] 9. **Feature: Containers** (Wave 4)

  **What to do**:
  - Extract `ContainerListView`, `ContainerDetailView`
  - Move to `Projects/Features/Containers`
  - Dependency: `ContainerKit`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`

  **Acceptance Criteria**:
  - [ ] `ContainersExample` builds

  **Commit**: `refactor(containers): extract containers feature`

- [ ] 10. **Feature: Stacks** (Wave 4)

  **What to do**:
  - Extract `StacksView`, `ProjectDetailView`
  - Move to `Projects/Features/Stacks`

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`

  **Acceptance Criteria**:
  - [ ] `StacksExample` builds

  **Commit**: `refactor(stacks): extract stacks feature`

- [ ] 11. **Feature: Shell** (Wave 5)

  **What to do**:
  - Extract `MainWindow`, `SidebarView`, `MenuBarView`
  - Move to `Projects/Features/Shell`
  - Dependency: All Feature **Interfaces** (NOT implementations)
  - This is the "Orchestrator" or "App Core"

  **Recommended Agent Profile**:
  - **Category**: `visual-engineering`

  **Acceptance Criteria**:
  - [ ] `ShellExample` builds (might need mock implementations of features)
  - [ ] Depends only on Interfaces

  **Commit**: `refactor(shell): extract shell feature`

- [ ] 12. **Wiring: Product App** (Wave 5)

  **What to do**:
  - Update `Projects/Product/App/Project.swift`
  - Depend on `Shell` + All Feature **Implementations**
  - Wire implementations to interfaces (Dependency Injection) in `App` entry point
  - Verify full app build

  **Recommended Agent Profile**:
  - **Category**: `ultrabrain`

  **Acceptance Criteria**:
  - [ ] `FlyingDutchmanApp` scheme builds and runs
  - [ ] All features accessible
  - [ ] Caching works

  **Commit**: `refactor(app): wire all features`

---

## Success Criteria

### Verification Commands
```bash
tuist generate
xcodebuild -workspace FlyingDutchman.xcworkspace -scheme FlyingDutchmanApp -configuration Debug clean build
```

### Final Checklist
- [ ] Tuist Cloud configured
- [ ] 8 Features extracted with Interface/Implementation
- [ ] Core module extracted
- [ ] No circular dependencies
- [ ] Swift 6.2 strict concurrency enabled
