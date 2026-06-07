# Proposal: Harden Machines for Experimental Release

## Problem
The Linux Machines feature runs VM guests on Apple's `Virtualization` framework, managing disk allocations, Cloud-Init metadata, SSH connectivity, and dynamic IP extraction. Due to the high risk of virtualization failures on older macOS versions or varied architectures, we must explicitly badge this capability as "Experimental" and ensure failure paths (like bad boots or cleanup) do not corrupt the host.

## Goal
Harden the Virtualization.framework wrappers to cleanly create, boot, stop, restart, and delete Linux machines, and ensure the UI and CLI explicitly label the feature as "Experimental."

## Non-goals
- No full-blown VM virtualization settings panel (e.g. CPU core or RAM sliders).
- No VM templates marketplace or remote OS distribution library (keep base Linux image).
- No direct Kubernetes configuration coupling here.

## User impact
Users can play with Linux VMs, but they will see clear "Experimental" warning labels. If a VM fails to boot, they will see detailed diagnostic logs and are able to remove the machine cleanly to reclaim disk space.

## Engineering impact
- Marks UI screens for Machines as experimental.
- Updates the CLI command descriptions with experimental badges.
- Audits and hardens virtualization file cleanup in the engine.

## Risk
High. Hypervisor operations require entitlements and specific hardware capabilities, which can easily panic the OS or leak gigabytes of storage if cleanups fail.

## Rollback
Optionally hide or remove the machine views entirely if virtualization issues block release.
