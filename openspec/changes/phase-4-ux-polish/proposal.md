# Proposal: Phase 4 UX Polish (Command Palette + Settings)

## Why
- Make keyboard navigation a first-class experience via the command palette.
- Provide default resource settings and startup preferences in the UI.
- Improve networking setup UX (resolver + CA trust) without leaving the app.

## What Changes
- Command palette adds keyboard focus + arrow navigation + submit behavior.
- Settings adds startup preferences and resource defaults (Machines/Kubernetes).
- Settings adds quick actions to open terminal for resolver install + CA trust.
- Persist new preferences in `UIState` with DB migration.

## Impact
- Modules: `Shared`, `Persistence`, `Settings`, `Shell`, `Machines`, `Kubernetes`.
- DB schema: `uiState` gains preference columns.
- Specs: Phase 4 status updated.

## Risks
- Preference schema migration must remain backward compatible.
- Terminal actions rely on external CLI (`fd`) and `sudo` permissions.
