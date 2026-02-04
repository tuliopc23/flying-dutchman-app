# Plan: Feature Extraction (Phase 4.5)

**Status**: 🟡 Proposed
**Goal**: Break `Projects/Product/App` into 8 distinct Feature targets to enforce strict boundaries.

---

## 1. Feature Target Structure

We will create `Projects/Features/<FeatureName>` for each of the following.
Each feature will export an **Interface** (e.g., `ContainerFeatureInterface`) and an **Implementation**.

| Feature | Scope | Key Views | Dependencies |
| :--- | :--- | :--- | :--- |
| **Shell** | App Entry, Sidebar, Navigation, Command Palette | `MainWindow`, `SidebarView`, `MenuBarView` | All Features (via Interface) |
| **Containers** | Container Lifecycle & Listing | `ContainerListView`, `ContainerDetailView` | `ContainerKit` |
| **Stacks** | Docker Compose/Project Management | `StacksView`, `ProjectDetailView` | `ContainerKit` |
| **Images** | Image Pull/Tag/Remove | `ImageListView` | `ContainerKit` |
| **Volumes** | Volume Management | `VolumeListView` | `ContainerKit` |
| **Networks** | Network Management | `NetworkListView` | `NetworkKit` |
| **Diagnostics** | Logs & Event Streaming | `LogsView`, `EventsView` | `Core/Utils` |
| **Settings** | App Preferences | `SettingsView` | `Core/Persistence` |

---

## 2. Shared/Core Extraction (Prerequisite)

Before extracting features, we must move shared UI components to `Core`.

- [ ] **Move** `Product/App/Sources/DesignSystem` -> `Core/DesignSystem`.
    - Includes: `Colors.swift`, `Spacing.swift`, `GlassCard.swift`.
- [ ] **Move** `Product/App/Sources/Components` -> `Core/UIComponents`.
    - Includes: `StatusBadge`, `SectionHeader`.

## 3. Dependency Injection Strategy

To prevent `Shell` from depending on concrete Feature implementations (optional but recommended for scale), or to prevent Features from depending on each other:

1.  **AppState Refactoring**: `AppState` currently holds *all* ViewModels.
    *   *Change*: `AppState` remains in `Shell` (or `AppCore`).
    *   *Change*: Features accept a narrowed `Environment` object or simpler dependencies.

## 4. Execution Steps

1.  **Scaffold**: Create directories `Projects/Features/Shell`, `Projects/Features/Containers`, etc.
2.  **Core UI**: Move `DesignSystem` and `Components` to `Projects/Core`.
3.  **Migrate Features**: Move View files one by one.
    *   Start with `Settings` (Simplest).
    *   Then `Images`, `Volumes`, `Networks` (Low coupling).
    *   Then `Containers`, `Stacks` (High coupling).
    *   Finally `Shell` (Orchestrator).
4.  **Wiring**: Update `Product/App` to compose `Shell` + `Features`.

---

## 5. Tuist Updates

- Update `Workspace.swift` to include `Projects/Features/**`.
- Create `Projects/Features/Settings/Project.swift`, etc.

