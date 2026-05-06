# Phase 4: UX Polish - Status

phase: 4
status: in-progress
started: 2026-02-03
updated: 2026-02-04
blockers: []

---

## Overview

Focus on premium macOS-native user experience, bringing the app out of the "developer tool" bucket and into "daily driver" territory.

**Primary Module**: `FlyingDutchmanApp`
**Capabilities**: `menu-bar`, `command-palette`, `debug-shell`, `settings-efficiency`

---

## Sub-phases

### 4.0 Tahoe Modernization ✅
- [x] Refactor `MainWindow` to `NavigationSplitView`
- [x] Implement `SidebarView` with Tahoe styling
- [x] Implement Unified Chrome (titlebar/toolbar)
- [x] Add `MeshGradient` background
- [x] Architecture: Centralized `@Observable AppState`

### 4.1 Menu Bar Applet ✅
- [x] Implement `MenuBarExtra` in App entry point
- [x] Create `MenuBarView` with status and container list
- [x] Wire up "Open Dashboard" and "Quit" actions
- [x] Connect to `AppState` for live engine status

### 4.2 Command Palette ⚪
- [x] Global shortcut (⌘K)
- [x] Fuzzy search implementation
- [x] Action registry (Start/Stop containers, Navigation)
- [x] UI overlay

### 4.3 Debug Shell ⚪
- [x] Embedded terminal session surface
- [ ] Native terminal renderer integration (`libghostty` or similar)
- [x] External terminal launcher (Ghostty/iTerm/WezTerm/kitty/Terminal)
- [x] `exec` support for Containers via VSOCK
- [x] `ssh` support for Machines via Citadel
- [ ] Theme matching (Dark/Light mode)

### 4.4 Settings & Efficiency ⚪
- [x] Resource configuration UI (CPU/RAM slider)
- [x] Startup behavior preferences
- [x] Sparkle update wiring and UI actions
- [ ] Release feed/signing rollout

---

## Entry Criteria

- [x] Phase 3 mostly complete (Platform)
- [x] UI Foundation (4.0) complete

## Exit Criteria

Phase 4 is complete when:
- [ ] App feels "native" and responsive
- [ ] Users rarely need to open the main window for simple tasks (Menu Bar covers it)
- [ ] Power users can navigate via keyboard (Command Palette)
- [x] Debugging is built-in (embedded session surface + external terminal fallback)

---

## Notes

- The Menu Bar applet is the primary interface for many users.
- Command Palette should be fast and keyboard-centric.
