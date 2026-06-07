# Proposal: Integrate GhosttyKit Terminal Backend

## Problem
The current terminal implementation is a rudimentary text placeholder using standard Process pipes. It lacks proper PTY virtualization, color rendering, cursor movement, resize behavior, and interactive keyboard handling required for a release-grade developer terminal.

## Goal
Replace the placeholder terminal session with a real, high-performance terminal backend using the `GhosttyKit` framework. Wrap it inside a strict interface that target-picks local shell processes, container shells, and VM machines.

## Non-goals
- No custom terminal emulator written from scratch.
- No visual terminal theme builder or customization editor.
- No Kubernetes exec terminal capabilities (restricted to local, container, and machine targets).
- No multi-tab/split pane UI layout in this phase.

## User impact
Users will be able to click a button in the app to open a fully featured, GPU-accelerated terminal directly into their local shell (`/bin/zsh`), a running container, or a Virtual Machine, with correct keybindings, color support, and resizing.

## Engineering impact
- Creates new `Terminal` feature module under `Projects/Features/Terminal/`.
- Introduces `GhosttyKit` as a dependency isolated strictly inside the terminal implementation target.
- Replaces/deprecates `EmbeddedTerminalSession` in the core shell.

## Risk
High. Linking third-party binary frameworks or complex SwiftPM packages can cause compilation/linking issues, especially on Apple Silicon/Intel architectures and during codesigning.

## Rollback
Retain an option to fall back to an external terminal app (like Terminal.app or iTerm2) or revert to the placeholder.
