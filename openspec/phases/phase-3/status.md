# Phase 3: Platform - Status

phase: 3
status: in-progress
started: 2026-01-29
updated: 2026-02-03
blockers: []

---

## Overview

Platform phase delivers Linux machines, Kubernetes development environment, and CLI/headless operation.

**Primary Modules**: `FlyingDutchmanKubernetes`, `FlyingDutchmanCLI`
**Capabilities**: `linux-machines`, `kubernetes-dev`, `cli-headless`

---

## Sub-phases

### 3.1 Linux Machines ✅
- [x] 1. Machine models and data structures (Machine, MachineConfig, MachineStatus)
- [x] 2. Supported distros enum: Ubuntu, Debian, Fedora, Alpine, Arch
- [x] 3. MachineStore with GRDB persistence
- [x] 4. MachineRuntimeProtocol and VirtualizationRuntime foundation
- [x] 5. CLI commands: list, create, start, stop, restart, delete, ssh, exec
- [x] 6. HTTP API endpoints: GET /machines, POST /machines/create, etc.
- [x] 7. Engine integration (wired into FlyingDutchmanEngineMain)
- [x] 8. Machine resource limits (CPU, memory, disk in config)
- [x] 9. Actual VM creation with Virtualization framework
- [x] 10. File sharing (Mac → Linux via virtiofs)
- [x] 11. SSH server auto-configuration (`SSHConfigurator`, `SSHClient`)
- [x] 12. Cloud-init provisioning (`-c user-data.yml`)
- [x] 13. Disk image management (download/cache via `VMResourceManager`)
- [x] 14. IP Detection (`ARPScanner`) and SSH Command Execution (`Citadel`)

**Dependencies**: Apple Virtualization framework, Phase 0.3 ✅

**Progress**: Feature complete (2026-02-03). VMs are functional with networking and SSH.

### 3.2 Kubernetes 🟡
- [x] 1. Single-node cluster provisioning (k3s via cloud-init on VM)
- [x] 2. `kubectl` context integration (`fd k8s kubeconfig --save`)
- [x] 3. Service exposure (via direct IP access)
- [ ] 4. `*.k8s.fd.local` domain routing
- [ ] 5. Ingress controller support
- [ ] 6. Persistent volume support
- [x] 7. Cluster lifecycle (create --vm, start, stop, delete)

**Dependencies**: 3.1 complete, SwiftkubeClient integration

### 3.3 CLI/Headless ✅
- [x] 1. `fd start` / `fd stop` commands
- [x] 2. `fd run` (run container)
- [x] 3. `fd machine create/start/stop/ssh/exec`
- [x] 4. `fd config get/set`
- [x] 5. Headless daemon mode (Engine runs as service)
- [x] 6. Shell completion (zsh, bash, fish)
- [x] 7. JSON output mode

**Dependencies**: Phase 0.5 (Error Handling), ArgumentParser

---

## Entry Criteria

- [x] Phase 1 complete (Container Core)
- [x] Phase 2.1 complete (Core Networking)
- [x] Virtualization framework entitlements

## Exit Criteria

Phase 3 is complete when:
- [x] Linux machine boots with chosen distro
- [x] File sharing works bidirectionally
- [x] SSH connects without manual configuration
- [x] Kubernetes cluster runs and `kubectl` works
- [ ] Services accessible via domain names (`*.k8s.fd.local`)
- [x] CLI can control entire app without GUI

---

## Blockers

None.

---

## Technical Considerations

### Linux Machine Implementation

Use Apple's Virtualization.framework with:
- Linux kernel (bundled or downloaded)
- Root filesystem from distro cloud images
- virtio-net for networking
- virtio-fs or virtiofs for file sharing

### Kubernetes Distribution

Options:
1. **k3s** - Lightweight, single-binary, good defaults (Selected)
2. **minikube** - More features, heavier
3. **kind** - Container-based, fastest startup

**Recommendation**: k3s for production-like experience, kind as fallback.

---

## Notes

- Linux machines are the foundation for Kubernetes
- CLI should be fully featured for CI/CD and scripting use cases
- Consider `fd` as the CLI name (short for Flying Dutchman)