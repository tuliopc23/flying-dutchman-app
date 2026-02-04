# Tech Debt: 2026 Modular Architecture Migration (Tuist TMA)

**Status**: 🔵 Planned
**Owner**: DevOps/Architecture
**Goal**: Migrate FlyingDutchman to a scalable, strictly modularized architecture using Tuist features (Module Caching, Registry, Explicit Boundaries).

---

## 1. The Vision: 2026 Modular Architecture (TMA)

We are moving from "Macro-Modules" (e.g., `FlyingDutchmanContainers` containing everything) to **The Modular Architecture (TMA)** with strict layering.

### Architecture Layers

| Layer | Responsibility | Dependencies Allowed | Example Targets |
| :--- | :--- | :--- | :--- |
| **4. Product** | Composition root. Wires features to the app/cli/engine. | Features, Domain, Core | `App`, `CLI`, `Engine` |
| **3. Feature** | User-facing UI or Workflows. | Domain (Interfaces), Core | `Dashboard`, `Terminal`, `Settings` |
| **2. Domain** | Business Logic & System Capabilities. Split into `Interface`, `Implementation`, `Testing`. | Core | `ContainerKit`, `MachineKit`, `NetworkKit` |
| **1. Core** | Shared utilities, models, helpers. No business logic. | None (System only) | `DesignSystem`, `Persistence`, `Utils` |

### Key Principles (Strict Boundaries)
1.  **Interface First**: Features depend *only* on `DomainInterface`, never on `DomainImplementation`.
2.  **Horizontal Isolation**: `FeatureA` cannot import `FeatureB`. They interact via Coordinator/Delegate patterns or Shared Domain.
3.  **Graph Optimization**: Shallow graphs enable better parallelization and caching.

---

## 2. Migration Plan

### Phase 1: Tuist Foundation Setup 🛠️
- [ ] **Config.swift**: Enable `tuist cache` and `cloud` (Registry) settings.
- [ ] **ProjectDescriptionHelpers**: Create `Target.feature`, `Target.domain`, `Target.core` helpers to enforce settings.
- [ ] **Workspace.swift**: Define the root workspace explicitly.

### Phase 2: Core Extraction (The Base) 🧱
- [ ] Extract `Shared` into specific Core modules:
    - `Core/Utils`: Logging, Extensions.
    - `Core/Models`: shared `Machine`, `Container` structs (DTOs).
    - `Core/DesignSystem`: Colors, Glass modifiers, Common Views.
- [ ] Extract `FlyingDutchmanPersistence` into `Core/Persistence`.

### Phase 3: Domain Splitting (The Engine) ⚙️
Refactor monolithic frameworks into granular domains with **Interface/Implementation** split.

**Example: ContainerKit**
- `ContainerKit` (Interface): Protocols (`ContainerRuntimeProtocol`), Models.
- `ContainerKit` (Implementation): Real logic (`ContainerizationRuntime`).
- `ContainerKit` (Testing): Mocks/Stubs.

**Targets:**
- [ ] `Domain/ContainerKit` (was `FlyingDutchmanContainers`)
- [ ] `Domain/MachineKit` (Virtualization logic)
- [ ] `Domain/NetworkKit` (DNS, Proxy, PortForwarding - was `FlyingDutchmanNetworking`)
- [ ] `Domain/KubeKit` (Kubernetes logic)

### Phase 4: Feature Extraction (The UI) 🖥️
Move SwiftUI Views from `FlyingDutchmanApp` into independent Feature targets.

- [ ] `Features/Dashboard`: Container List, Detail Views.
- [ ] `Features/Terminal`: Debug Shell, SSH Views.
- [ ] `Features/Settings`: App Preferences.
- [ ] `Features/MenuBar`: Menu Bar Applet.

### Phase 5: Product Composition (The Assembly) 📦
- [ ] Update `App`, `CLI`, `Engine` to depend on `Features` (UI) and `Domain` (Logic).
- [ ] Ensure `Engine` depends on *Implementations*.
- [ ] Ensure `App` (UI) depends primarily on *Interfaces* (injected via AppState).

---

## 3. Tuist Configuration Goals

### Module Caching
- **Binary Caching**: Enable for all `Core` and `Domain` modules.
- **Hash Stability**: Ensure stable interfaces to maximize cache hit rate.

### Registry
- **Tuist Cloud**: Authenticated and configured.
- **Dependencies**: Use `Tuist/Package.swift` or `Dependencies.swift` exclusively.

---

## 4. Execution Tracking

### Current Step: Analysis & Planning
- **Next**: Create `Tuist/Config.swift` and `ProjectDescriptionHelpers`.
