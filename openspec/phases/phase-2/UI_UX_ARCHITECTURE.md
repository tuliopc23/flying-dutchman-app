# Phase 2 Spec: Tahoe UI/UX & Architecture

**Target**: macOS 26+ (Tahoe)
**Architecture**: Domain-Driven MVVM + Observation
**Design Language**: Liquid Glass / Unified Chrome

## 1. Architectural Vision

### 1.1 AppState (The Coordinator)
- **Centralized Logic**: Move orchestration from `RootContainerView` to a single `@Observable AppState`.
- **Lazy Initialization**: Feature ViewModels are loaded only when relevant to the current section.
- **SwiftData Integration**: `UIState` remains in SwiftData for persistence, but is mirrored/mapped to `AppState` at runtime.

### 1.2 Typed Navigation
- **NavigationPath**: Use a homogeneous path for detail drill-downs (e.g., Container Detail, Image Layers).
- **Sidebar Selection**: Enum-based routing for primary sections.

---

## 2. Design System (Tahoe Standard)

### 2.1 Materials & Materials
- **Liquid Glass**: Use native `.glass` semantic material + `.glassEffect()` refraction.
- **Unified Chrome**: Remove separators between Titlebar, Sidebar, and Content.
- **Mesh Gradients**: Subtle, animated brand-colored gradients in the window background.

### 2.2 Components
- **GlassCard**: Standard container for list items and metrics.
- **Floating Toolbar**: Contextual actions appearing on glass backgrounds.
- **Tahoe Sidebar**: Full-height, translucent sidebar with `.backgroundExtensionEffect()`.

---

## 3. MVP Acceptance Criteria

### 3.1 Functional
- [ ] App launches into a unified, glass-styled window.
- [ ] Sidebar navigation correctly switches between all 7 sections.
- [ ] Container list reflects real-time status updates via the engine.
- [ ] "Create Container" flow uses a Tahoe-styled sheet with validation.
- [ ] Logs and Events stream continuously without UI hangs.

### 3.2 Visual/UX
- [ ] All components use `DesignSystem` tokens (Typography, Spacing, Colors).
- [ ] Unified titlebar with inline title display.
- [ ] Adaptive layout that looks great from 1000x700 to full screen.
- [ ] Support for Light, Dark, and High Contrast system modes.

---

## 4. Implementation Steps

1. **Tokens & Extensions**: Fix `EdgeInsets`, update `View+Glass.swift` to use native Tahoe APIs.
2. **State Layer**: Implement `@Observable AppState`.
3. **Root Refactor**: Replace `RootContainerView` complexity with a clean `AppState` bootstrap.
4. **Layout Refactor**: Implement `NavigationSplitView` in `MainWindow`.
5. **Feature Cleanup**: Update each view (Containers, Images, etc.) to use the new glass components.
