# Proposal: Machines/Kubernetes/Debug Shell UI + K8s Domains

## Why
- Ship UI parity with the existing CLI for Machines and Kubernetes.
- Provide an immediate, low-risk debug shell path while libghostty is pending.
- Make k3s clusters reachable via stable, user-friendly domains.

## What Changes
- Add `Machines`, `Kubernetes`, and `DebugShell` feature modules (UI + interface).
- Wire new features into the Shell navigation and command palette registry.
- Add a terminal launcher helper that opens user-preferred terminal apps and runs `fd shell`.
- Add Kubernetes domain routing for VM and containerized clusters.
- Extend DNS resolver/HTTPS proxy support for `*.k8s.flyingdutchman.local` and legacy `*.k8s.fd.local`.
- Add CLI `fd shell` command for container exec.

## Impact
- Modules: `Shared`, `ContainerKit`, `NetworkKit`, `Shell`, `App`, `CLI`, new `Features/*`.
- Specs: `debug-shell`, `kubernetes-dev`, `container-networking`, `ROADMAP`, Phase 3/4 status.
- Tests: Integration DNS test for k8s domains.

## Risks
- Terminal automation differs across apps; fallback is open + clipboard.
- K3s detection by image name is heuristic; could misclassify custom images.
- Additional DNS suffixes may conflict with local resolver policies; keep legacy suffixes and document.
