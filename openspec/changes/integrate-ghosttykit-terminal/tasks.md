# Tasks: Integrate GhosttyKit Terminal Backend

## Inspection
- [ ] Inspect the current terminal layout in the SwiftUI views.
- [ ] Determine the installation path and integration model of `GhosttyKit`.
- [ ] Confirm how the CLI handles interactive execution via the `shell` command.

## Implementation
- [ ] Add the `GhosttyKit` SwiftPM package dependency to the project structure (isolated to the `Terminal` feature target).
- [ ] Define feature interface types: `TerminalTarget`, `TerminalLaunchRequest`, `TerminalSessionClient`, `TerminalCapabilities`.
- [ ] Implement `GhosttyTerminalView` using a `NSViewRepresentable` bridge.
- [ ] Replace the placeholder `EmbeddedTerminalSession` with `GhosttyTerminalSession`.
- [ ] Add a target picker UI in the app featuring:
  - Local shell (`/bin/zsh -il`)
  - Container shell (`flyingdutchman shell <container-id-or-name>`)
  - Machine SSH shell (`flyingdutchman machines ssh <machine-id-or-name>`)
- [ ] Ensure terminal sessions are cleanly disposed of and terminated when the window or tab is closed.
- [ ] Map and handle terminal resize actions correctly.
- [ ] Verify keyboard focus shifts properly into the terminal view upon selection.

## Validation
- [ ] Verify that `swift build` compiles the new terminal module successfully.
- [ ] Write unit tests for command construction and target picker mappings.
- [ ] Test the terminal session lifecycle manually (open/close/exit).
- [ ] Verify external terminal launch fallback option remains functional.
