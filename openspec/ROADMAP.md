# Flying Dutchman Roadmap

> **Current Phase**: 2 (Networking)
> **Last Updated**: 2026-01-27
> **Status**: 🟡 In Progress

---

## Quick Navigation

| Phase | Name | Status | Progress |
|-------|------|--------|----------|
| 0 | Foundation | ✅ Complete | 100% |
| 1 | Container Core | ✅ Complete | 100% |
| 2 | Networking | 🟡 In Progress | 20% |
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
- [x] SQLiteData selected for UI (Point-Free, built on GRDB)
- [ ] SQLiteData integration (deferred to Phase 2-3)

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

## Phase 1: Container Core ✅

**Goal**: Docker-compatible container engine with full lifecycle support.
**Capabilities**: `container-engine`, `container-storage`, `image-management`
**Primary Module**: `FlyingDutchmanContainers`
**Status**: Complete (2026-01-10)

### 1.1 Container Engine ✅
- [x] Container state machine
- [x] Container event streaming
- [x] Container logs streaming (VSOCK protocol implemented)
- [x] VSOCK communication (dial + length-prefixed JSON protocol)
- [x] Compose project support (YAML parsing implemented)

### 1.2 Image Management ✅
- [x] Kernel download automation (symlink to expected location implemented)
- [x] Image layer caching (ImageCacheManager wired to runtime)
- [x] Registry authentication (Docker Hub OAuth, GitHub PAT, Keychain storage)
- [x] Auth integration in pullImage (Bearer tokens + 401 retry)
- [ ] BuildKit integration (deferred)
- [ ] Multi-platform builds (deferred)
- [x] Image filesystem exposure (`~/FlyingDutchman/images/`) - placeholder

### 1.3 Storage ✅
- [x] Bind mount support (virtiofs sharing implemented)
- [x] Named volumes (VolumeManager)
- [x] Volume lifecycle management
- [x] Environment variables applied to containers
- [x] Working directory applied to containers
- [x] Filesystem exposure (`~/FlyingDutchman/containers/`) - placeholder with README

### 1.4 CLI Commands ✅
- [x] `fd login [registry]` - Interactive authentication
- [x] `fd logout [registry]` - Remove credentials

### 1.5 HTTP API ✅
- [x] `/auth/login` - Registry authentication endpoint
- [x] `/auth/logout` - Credential removal endpoint

---

## Phase 2: Networking

**Goal**: Full container networking with zero-config domains and HTTPS.
**Capabilities**: `container-networking`
**Primary Module**: `FlyingDutchmanNetworking`

### 2.1 Core Networking ✅
- [x] Bridge network driver (NetworkManager + IPAllocator)
- [x] Port forwarding (`-p` flag + PortForwardManager)
- [x] Container IP allocation (CIDR)
- [ ] Fix NetworkError & Module Ownership (Stabilization)
- [ ] Host networking mode (`--net host`)
- [ ] IPv6 and ICMP support

### 2.2 DNS & Domains
- [ ] Local DNS resolver (UDP 5353)
- [ ] Resolver file (/etc/resolver/fd.local)
- [ ] Zero-config domains (`*.fd.local`)
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
