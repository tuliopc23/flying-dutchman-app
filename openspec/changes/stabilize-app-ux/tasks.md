# Tasks: Stabilize App UX for Release

## Inspection
- [ ] Review all feature views (Containers, Images, Volumes, Networks, Machines, Kubernetes, Diagnostics) for empty or loading states.
- [ ] Inspect sidebar navigation code and detail view bindings.
- [ ] Inspect actions available in the command palette.

## Implementation
- [ ] Add explicit, user-friendly empty states for:
  - Containers list
  - Images list
  - Volumes list
  - Networks list
  - Machines list
  - Clusters list
  - Logs view
  - Terminal target picker
- [ ] Implement explicit error/unavailable screens for:
  - Engine offline
  - Native runtime unavailable (with manual fallback toggle)
  - Stub mode active warning
  - Unsupported macOS version
  - Missing kernel or initfs files
- [ ] Implement loading and mutation indicators:
  - `creating` / `pulling` / `starting` / `stopping` / `removing` states on items
- [ ] Disable impossible actions (e.g. starting an already running container, pulling when offline).
- [ ] Force list refreshes in UI after running start, stop, or delete mutations.
- [ ] Ensure the command palette filters out invalid actions based on current runtime state.
- [ ] Resolve sidebar selection crashes: fallback cleanly to dashboard if the selected container or machine is removed.
- [ ] Add destructive action confirmation dialogs before deleting volumes, containers, networks, or machines.
- [ ] Add copyable diagnostic report utility and "Open engine logs" links.

## Validation
- [ ] Verify `swift build` compiles.
- [ ] Manually test UI empty states by starting with clean DB.
- [ ] Simulate engine failures and verify that the app shows the "Engine offline" view clearly.
- [ ] Verify that deleting selected container changes navigation selection cleanly without crash.
