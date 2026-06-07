# Tasks: Harden Runtime Diagnostics and First-Run Setup

## Inspection
- [ ] Inspect the existing CLI `doctor` command implementation.
- [ ] Inspect how the app detects engine status and active runtime mode.
- [ ] Locate the codebase entry points for platform check alerts.

## Implementation
- [ ] Implement checks for host architecture and macOS version compatibility.
- [ ] Detect presence of required kernel and initfs files.
- [ ] Expose active runtime mode (native / cli / stub) via `FlyingDutchmanCLI doctor` and the App.
- [ ] Add explicit status checks for Engine connectivity, XPC, HTTP API, and GRDB database health.
- [ ] Prevent silent fallback to the stub runtime in release mode.
- [ ] Add user-facing remediation copy for missing virtual components or unauthorized state.

## Validation
- [ ] Validate `swift build` and `swift test` pass cleanly.
- [ ] Run `swift run FlyingDutchmanCLI doctor` and check for structured, actionable output.
- [ ] Verify the App displays the diagnostics panel and updates on state changes.
- [ ] Verify that forcing a native runtime failure displays a visible error instead of success.
