# Phase 3: Platform - Status

phase: 3
status: in-progress
started: 2026-01-29
updated: 2026-01-29
blockers: []

---

## Overview

Platform phase delivers Linux machines, Kubernetes development environment, and CLI/headless operation.

**Primary Modules**: `FlyingDutchmanKubernetes`, `FlyingDutchmanCLI`
**Capabilities**: `linux-machines`, `kubernetes-dev`, `cli-headless`

---

## Sub-phases

### 3.1 Linux Machines 🟡
- [x] 1. Machine models and data structures (Machine, MachineConfig, MachineStatus)
- [x] 2. Supported distros enum: Ubuntu, Debian, Fedora, Alpine, Arch
- [x] 3. MachineStore with GRDB persistence
- [x] 4. MachineRuntimeProtocol and VirtualizationRuntime foundation
- [x] 5. CLI commands: list, create, start, stop, restart, delete, ssh, exec
- [x] 6. HTTP API endpoints: GET /machines, POST /machines/create, etc.
- [x] 7. Engine integration (wired into FlyingDutchmanEngineMain)
- [x] 8. Machine resource limits (CPU, memory, disk in config)
- [ ] 9. Actual VM creation with Virtualization framework
- [ ] 10. File sharing (Mac → Linux via virtiofs `/mnt/mac/`)
- [ ] 11. File sharing (Linux → Mac via `~/FlyingDutchman/machines/`)
- [ ] 12. SSH server auto-configuration
- [ ] 13. Cloud-init provisioning (`-c user-data.yml`)
- [ ] 14. Disk image management (download/cache)

**Dependencies**: Apple Virtualization framework, Phase 0.3 ✅

**Progress**: Foundation complete (2026-01-29). Infrastructure ready for VM implementation.

### 3.2 Kubernetes ⚪
- [ ] 1. Single-node cluster provisioning (k3s or similar)
- [ ] 2. `kubectl` context integration
- [ ] 3. Service exposure to host (ClusterIP, NodePort, LoadBalancer)
- [ ] 4. `*.k8s.fd.local` domain routing
- [ ] 5. Ingress controller support
- [ ] 6. Persistent volume support
- [ ] 7. Cluster lifecycle (start, stop, reset)

**Dependencies**: 3.1 complete, SwiftkubeClient integration

### 3.3 CLI/Headless ⚪
- [ ] 1. `fd start` / `fd stop` commands
- [ ] 2. `fd run` (run container)
- [ ] 3. `fd machine create/start/stop/ssh`
- [ ] 4. `fd config get/set`
- [ ] 5. Headless daemon mode (no GUI required)
- [ ] 6. Shell completion (zsh, bash, fish)
- [ ] 7. JSON output mode for scripting

**Dependencies**: Phase 0.5 (Error Handling), ArgumentParser

---

## Entry Criteria

- [ ] Phase 1 complete (Container Core)
- [ ] Phase 2.1 complete (Core Networking)
- [ ] Virtualization framework entitlements

## Exit Criteria

Phase 3 is complete when:
- [ ] Linux machine boots with chosen distro
- [ ] File sharing works bidirectionally
- [ ] SSH connects without manual configuration
- [ ] Kubernetes cluster runs and `kubectl` works
- [ ] Services accessible via domain names
- [ ] CLI can control entire app without GUI

---

## Blockers

1. **Phase 1 incomplete**: Linux machines share infrastructure with containers.
2. **Virtualization entitlements**: Need proper signing for Virtualization.framework.

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
1. **k3s** - Lightweight, single-binary, good defaults
2. **minikube** - More features, heavier
3. **kind** - Container-based, fastest startup

**Recommendation**: k3s for production-like experience, kind as fallback.

---

## Notes

- Linux machines are the foundation for Kubernetes
- CLI should be fully featured for CI/CD and scripting use cases
- Consider `fd` as the CLI name (short for Flying Dutchman)
