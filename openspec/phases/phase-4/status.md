# Phase 4: UX Polish - Status

phase: 4
status: not-started
started: null
updated: 2025-12-24
blockers:
  - Phase 1 (Container Core) should complete first for meaningful UX

---

## Overview

UX Polish phase delivers premium macOS-native user experience with menu bar, command palette, debug shell, and efficiency settings.

**Primary Module**: `FlyingDutchmanApp`
**Capabilities**: `menu-bar`, `command-palette`, `debug-shell`, `settings-efficiency`

---

## Sub-phases

### 4.1 Menu Bar ⚪
- [ ] 1. Menu bar applet (NSStatusItem or MenuBarExtra)
- [ ] 2. Container list with status indicators
- [ ] 3. Machine list with status indicators
- [ ] 4. Quick actions: Start, Stop, Restart, Remove
- [ ] 5. Logs shortcut
- [ ] 6. Terminal shortcut
- [ ] 7. Open web service (detect exposed ports)
- [ ] 8. Resource usage summary

**Dependencies**: Phase 1.1 (Container Engine)

### 4.2 Command Palette ⚪
- [ ] 1. Global palette trigger (⌘K)
- [ ] 2. Fuzzy search implementation
- [ ] 3. Entity search: containers, images, volumes, machines
- [ ] 4. Action search: Start, Stop, Restart, Delete, Logs, Shell
- [ ] 5. Settings search
- [ ] 6. Recent items
- [ ] 7. Keyboard navigation

**Dependencies**: UI framework foundation

### 4.3 Debug Shell ⚪
- [ ] 1. Terminal emulator integration (SwiftTerm or libghosted)
- [ ] 2. `sh`/`bash` shell in containers
- [ ] 3. Debug tools injection for minimal images
- [ ] 4. Distroless container support
- [ ] 5. Remote Docker context support
- [ ] 6. Multiple terminal tabs
- [ ] 7. Copy/paste support
- [ ] 8. Font and theme settings

**Dependencies**: Terminal library evaluation complete

### 4.4 Settings & Efficiency ⚪
- [ ] 1. Resource limits UI (CPU cores, memory GB)
- [ ] 2. Rosetta toggle (Apple Silicon)
- [ ] 3. Startup preferences (launch at login, start runtime)
- [ ] 4. Idle optimization (pause when inactive)
- [ ] 5. Disk usage management
- [ ] 6. Network settings (DNS, proxy)
- [ ] 7. About and updates

**Dependencies**: Phase 0.4 (Observability for metrics)

---

## Entry Criteria

- [ ] Phase 1.1 complete (meaningful entities to display)
- [ ] Terminal library selected
- [ ] Design system established

## Exit Criteria

Phase 4 is complete when:
- [ ] Menu bar provides full quick access
- [ ] Command palette finds and executes all actions
- [ ] Debug shell works for any container
- [ ] Settings control all runtime behavior
- [ ] App feels native and responsive

---

## Blockers

1. **Phase 1 incomplete**: Need running containers for meaningful UX testing.
2. **Terminal library**: Must evaluate libghosted vs SwiftTerm.

---

## Design Decisions

### Menu Bar Approach

Use SwiftUI `MenuBarExtra` (macOS 13+) for:
- Native SwiftUI views in menu
- Automatic dark mode support
- Accessibility built-in

### Command Palette

Implementation approach:
1. Global keyboard shortcut via `NSEvent.addGlobalMonitorForEvents`
2. Floating panel window
3. Fuzzy matching via custom algorithm or `fuse-swift`
4. Actions as `Sendable` closures

### Terminal Emulator

Evaluation criteria:
- xterm compatibility (ANSI escape codes)
- Performance (60fps scrolling)
- macOS integration (fonts, colors)
- Async I/O support

### SwiftData Evaluation

Consider migrating from GRDB to SwiftData in this phase:
- [ ] Performance benchmarks
- [ ] Migration path from GRDB
- [ ] CloudKit sync potential (future)

---

## Notes

- This phase is about polish, not features
- Performance is critical—the app must feel instant
- Accessibility: VoiceOver, keyboard navigation, Dynamic Type
- Test with real workflows: dev environment setup, debugging, deployment
