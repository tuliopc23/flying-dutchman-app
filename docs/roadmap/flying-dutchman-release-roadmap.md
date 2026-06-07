# Flying Dutchman 0.1 Release Roadmap

## Product Goal
Flying Dutchman should ship first as a native macOS Tahoe Apple Containerization workbench.

The 0.1 release should prove the core loop:
1. Install app
2. Start engine
3. Verify local environment
4. Pull/create/start/stop/remove containers
5. Inspect logs
6. Open terminal into local shell / container / machine
7. Recover cleanly after restart

Do not ship 0.1 as a full OrbStack replacement yet. The repository is advanced, but the release needs a hardening pass, not a scope expansion.

## Release Philosophy
The 0.1 release prioritizes:
1. **Truthful runtime state**: Never confuse the user about which runtime or mode is active.
2. **Reliable native container lifecycle**: Hardened pull, create, start, stop, remove, log extraction, and networking.
3. **Good diagnostics**: Rich user-facing error reporting and diagnostic CLI commands.
4. **Real terminal integration**: A robust, interactive PTY-backed terminal using GhosttyKit.
5. **Clean install/update/uninstall path**: Sign, notarize, and package the app correctly.
6. **Experimental labeling**: Keep Machines (VMs) and Kubernetes workflows marked as Experimental/unavailable until fully proven.

---

## Roadmap Milestones

### Milestone 0: Release Truth Baseline
- **Goal**: Establish the real current state of the repository before resume.
- **OpenSpec change**: [openspec/changes/release-0-1-baseline/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/release-0-1-baseline/)
- **Scope**: Run package resolve, build, test, and diagnostics. Document build/test/runtime statuses for all modules.

### Milestone 1: Runtime Diagnostics and First-Run Setup
- **Goal**: Make the app and CLI brutally clear about which runtime mode (native, CLI fallback, stub) is active.
- **OpenSpec change**: [openspec/changes/harden-runtime-diagnostics/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/harden-runtime-diagnostics/)
- **Scope**: Surface architecture checks, OS checks, virtualization framework availability, engine state, and prevent silent stub fallback in release.

### Milestone 2: Native Container Lifecycle Validation
- **Goal**: Validate and fix the core container lifecycle paths under the native Containerization runtime.
- **OpenSpec change**: [openspec/changes/validate-native-container-lifecycle/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/validate-native-container-lifecycle/)
- **Scope**: Verify alpine/busybox/hello-world and nginx HTTP mapping; audit mounts, volume cleanup, log extraction, and state transitions.

### Milestone 3: GhosttyKit Terminal Integration
- **Goal**: Replace the interim terminal renderer with a real terminal emulator using GhosttyKit.
- **OpenSpec change**: [openspec/changes/integrate-ghosttykit-terminal/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/integrate-ghosttykit-terminal/)
- **Scope**: Integrate SwiftPM GhosttyKit, target local shells, container shells, and machines SSH. Ensure proper resize and focus handling.

### Milestone 4: App UX Stabilization
- **Goal**: Stabilize the SwiftUI app layout, adding appropriate empty/unavailable/loading/mutation states.
- **OpenSpec change**: [openspec/changes/stabilize-app-ux/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/stabilize-app-ux/)
- **Scope**: Prevent dead actions, ensure sidebar selection stability, add confirmation dialogs, and make diagnostics copyable.

### Milestone 5: CLI Doctor and Command Parity
- **Goal**: Make the CLI a reliable, structured support tool with core container command parity.
- **OpenSpec change**: [openspec/changes/cli-doctor-and-parity/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/cli-doctor-and-parity/)
- **Scope**: Normalize CLI output, format error messages, add `--json` where useful, and label experimental features.

### Milestone 6: Persistence and Crash Recovery
- **Goal**: Ensure database and engine restart reconciliation works reliably without corrupting state.
- **OpenSpec change**: [openspec/changes/crash-recovery-persistence/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/crash-recovery-persistence/)
- **Scope**: Audit transient states, handle killed engine/app recovery, and verify port allocation release on crash.

### Milestone 7: Machines Experimental Hardening
- **Goal**: Harden the Machines feature using Virtualization.framework enough to ship as experimental.
- **OpenSpec change**: [openspec/changes/harden-machines-experimental/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/harden-machines-experimental/)
- **Scope**: Verify boot, delete, disk cleanup, IP detection, SSH fallback, and add "Experimental" badges.

### Milestone 8: Kubernetes Experimental Hardening
- **Goal**: Keep Kubernetes useful but clearly scoped under experimental status.
- **OpenSpec change**: [openspec/changes/harden-kubernetes-experimental/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/harden-kubernetes-experimental/)
- **Scope**: Verify cluster creation, listing, cleanup, and generate kubeconfig safely without affecting core workloads.

### Milestone 9: Release Packaging
- **Goal**: Ship a signed, notarized, and clean macOS installer.
- **OpenSpec change**: [openspec/changes/package-oss-release/](file:///Users/tuliopinheirocunha/Developer/flying-dutchman-app/openspec/changes/package-oss-release/)
- **Scope**: Configure Sparkle or remove update UI, verify bundle identifiers, test clean install/uninstall, and publish known limitations.
