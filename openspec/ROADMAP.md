# Flying Dutchman Roadmap

> **Current Phase**: 1.1 (Container Engine)
> **Last Updated**: 2025-12-27
> **Status**: 🟡 In Progress

---

## Quick Navigation

| Phase | Name | Status | Progress |
|-------|------|--------|----------|
| 0 | Foundation | ✅ Complete | 100% |
| 1 | Container Core | 🟡 In Progress | 80% |
| 2 | Networking | ⚪ Not Started | 0% |
| 3 | Platform | ⚪ Not Started | 0% |
| 4 | UX Polish | ⚪ Not Started | 0% |

---

## Phase 0: Foundation ✅

**Goal**: Core infrastructure that all other phases depend on.
**Status**: Complete (2025-12-27)

### 0.1 Project Structure ✅
- [x] Multi-target Package.swift setup
- [x] Module boundaries defined
- [x] Shared utilities module
- [x] OpenSpec system initialized

### 0.2 Persistence Layer ✅
- [x] GRDB integration
- [x] Database schema foundation
- [x] Migration system (basic)
- [ ] SwiftData evaluation (deferred to Phase 4)

### 0.3 Container Runtime Abstraction ✅
- [x] `ContainerRuntime` protocol defined
- [x] `ContainerCLIRuntime` implementation (Docker CLI wrapper)
- [x] Apple `Containerization` framework integration
- [x] Runtime factory with environment detection
- [x] Container state models (Sendable)
- [x] Lifecycle management (start/stop/restart/delete)

### 0.4 Logging & Observability ✅
- [x] Structured logging (swift-log)
- [x] Log persistence and rotation
- [x] Performance metrics collection

### 0.5 Error Handling ✅
- [x] Domain error types per module
- [x] Error recovery strategies
- [x] User-facing error messages

---

## Phase 1: Container Core 🟡

**Goal**: Docker-compatible container engine with full lifecycle support.
**Capabilities**: `container-engine`, `container-storage`, `image-management`
**Primary Module**: `FlyingDutchmanContainers`

### 1.1 Container Engine 🟡
- [x] Container state machine
- [x] Container event streaming
- [x] Container logs streaming (Step 3 complete)
- [x] VSOCK communication (dial + length-prefixed JSON protocol)
- [x] Compose project support (YAML parsing implemented)

### 1.2 Image Management ⚪
- [x] Kernel download automation (symlink to expected location implemented)
- [x] Image layer caching (ImageCacheManager exists, not wired to runtime)
- [ ] BuildKit integration
- [ ] Multi-platform builds
- [x] Image filesystem exposure (`~/FlyingDutchman/images/`)

### 1.3 Storage ⚪
- [ ] Bind mount support
- [ ] Named volumes
- [ ] Volume lifecycle management
- [ ] Filesystem exposure (`~/FlyingDutchman/containers/`)

---

## Phase 2: Networking

**Goal**: Full container networking with zero-config domains and HTTPS.
**Capabilities**: `container-networking`
**Primary Module**: `FlyingDutchmanNetworking`

### 2.1 Core Networking
- [ ] Bridge network driver
- [ ] Port forwarding (`-p` flag)
- [ ] Host networking mode (`--net host`)
- [ ] IPv6 and ICMP support

### 2.2 DNS & Domains
- [ ] Local DNS resolver
- [ ] Zero-config domains (`container.fd.local`)
- [ ] Compose service domains (`service.project.fd.local`)

### 2.3 HTTPS
- [ ] Local CA generation
- [ ] Automatic certificate provisioning
- [ ] Reverse proxy for HTTPS termination

---

## Phase 3: Platform

**Goal**: Linux machines and Kubernetes development environment.
**Capabilities**: `linux-machines`, `kubernetes-dev`, `cli-headless`
**Primary Modules**: `FlyingDutchmanKubernetes`, `FlyingDutchmanCLI`

### 3.1 Linux Machines
- [ ] Machine creation (multi-distro)
- [ ] Machine lifecycle management
- [ ] File sharing (Mac ↔ Linux)
- [ ] SSH access (built-in server)
- [ ] Cloud-init provisioning

### 3.2 Kubernetes
- [ ] Single-node cluster provisioning
- [ ] kubectl integration
- [ ] Service exposure to host
- [ ] `*.k8s.fd.local` domain routing
- [ ] Ingress controller support

### 3.3 CLI/Headless
- [ ] `fd start/stop` commands
- [ ] `fd config` management
- [ ] Headless daemon mode
- [ ] Shell completion

---

## Phase 4: UX Polish

**Goal**: Premium macOS-native user experience.
**Capabilities**: `menu-bar`, `command-palette`, `debug-shell`, `settings-efficiency`
**Primary Module**: `FlyingDutchmanApp`

### 4.1 Menu Bar
- [ ] Menu bar applet
- [ ] Container/machine quick actions
- [ ] Status indicators
- [ ] Web service shortcuts

### 4.2 Command Palette
- [ ] Global palette (⌘K)
- [ ] Fuzzy search across all entities
- [ ] Action execution
- [ ] Recent items

### 4.3 Debug Shell
- [ ] Terminal emulator integration
- [ ] Debug tools injection
- [ ] Distroless container support
- [ ] Remote Docker context support

### 4.4 Settings & Efficiency
- [ ] Resource limits (CPU, memory)
- [ ] Rosetta toggle
- [ ] Idle resource optimization
- [ ] Startup preferences

---

## Dependencies

See [dependencies.md](./dependencies.md) for full package registry.

### Candidates (In Use)
| Package | Purpose | Status |
|---------|---------|--------|
| apple/containerization | Container runtime | ✅ Integrated |
| GRDB.swift | Persistence | ✅ Integrated |
| swift-nio | Async networking | ✅ Integrated |
| swift-argument-parser | CLI framework | ✅ Integrated |
| swift-log | Logging | ✅ Integrated |
| swiftkube/client | Kubernetes API | ✅ Integrated |
| hummingbird | HTTP server | ✅ Integrated |

### Planned (Evaluated & Selected)
| Package | Purpose | Status |
|---------|---------|--------|
| libghostty-vt | Terminal emulation | ✅ Selected (Phase 4.3) |
| Citadel | SSH client | ✅ Selected (Phase 3.1, 4.3) |
| DNSClient | DNS resolution | ✅ Selected (Phase 2.2) |
| swift-certificates | HTTPS/CA | ✅ Selected (Phase 2.3) |

---

## How to Resume

1. Check this file for current phase
2. Read the phase's status file: `openspec/phases/[phase]/status.md`
3. Review blockers and incomplete tasks
4. Continue from the first incomplete checkbox

## How to Update

After completing a task:
1. Check off the item in this file
2. Update the status file in the phase directory
3. If phase complete, update the Quick Navigation table
4. Commit with message: `spec: complete [phase.subphase] [description]`
