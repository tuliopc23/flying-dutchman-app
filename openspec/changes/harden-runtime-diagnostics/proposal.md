# Proposal: Harden Runtime Diagnostics and First-Run Setup

## Problem
In the current workspace, the app supports three runtimes: native containerization, CLI fallback, and a stub/demo runtime. If the native runtime fails or is unsupported, the system may fall back silently to the stub mode, causing confusion. The user needs clear visibility into the system status and why containers can or cannot run.

## Goal
Harden diagnostics so that both the SwiftUI application and the CLI (`fd doctor`) explicitly report the active runtime mode (native, cli, or stub) and check system environment pre-requisites (macOS version, CPU architecture, Apple Containerization framework, database health, engine connectivity, XPC status, and port availability).

## Non-goals
- No changes to container lifecycle logic.
- No visual redesign of the app shell outside of adding diagnostics displays.
- No advanced Kubernetes diagnostics (simply report Kubernetes as experimental/unavailable).

## User impact
Users will see a dedicated diagnostics panel on launch or in settings, showing precise health indicators and clear instructions if dependencies (like kernel files or framework permissions) are missing.

## Engineering impact
- Modifies `Diagnostics` feature and UI views.
- Modifies CLI doctor commands and output formatting.
- Improves pre-flight checks in `Shared` or `FlyingDutchmanContainers`.

## Risk
Low. Only diagnostic telemetry and user-facing warning banners are updated, with no changes to virtualization or container execution paths.

## Rollback
Standard git revert of the diagnostics code modifications.
