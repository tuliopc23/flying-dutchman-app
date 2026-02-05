# Tasks: Phase 4 UX Polish (Command Palette + Settings)

## 1) Command Palette UX
- Scope: `Projects/Features/Shell/Sources/Shell/CommandPalette.swift`
- Add auto-focus, keyboard navigation, and submit behavior.
- Acceptance: ⌘K opens palette, arrows move selection, Enter executes.
- Tests: App build + manual smoke.

## 2) Settings & Preferences
- Scope: `Shared/UIState`, `Persistence/UIStateStore`, `SettingsView`
- Add startup preferences and resource defaults.
- Add networking setup actions (open terminal for resolver + CA trust).
- Acceptance: values persist, and defaults flow into create sheets.
- Tests: App build + `swift test`.

## 3) Defaults Propagation
- Scope: `Machines` and `Kubernetes` create sheets
- Read defaults from `UIStateStore` on first render.
- Acceptance: create sheets prefill with saved defaults.
- Tests: Manual smoke.

## 4) Persistence Migration
- Scope: `Database.swift` migrations
- Add new `uiState` columns with defaults.
- Acceptance: app launches with existing DB.
- Tests: `swift test`.

## 5) Phase 4 Status Update
- Scope: `openspec/phases/phase-4/status.md`
- Mark Command Palette keyboard UX and settings items complete.
