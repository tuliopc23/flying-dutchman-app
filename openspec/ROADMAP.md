# Flying Dutchman Roadmap (Reality-Based)

> **Last Updated**: 2026-02-04
> **Purpose**: Single-page, reality-first roadmap. This document prioritizes clarity over phase ceremony.

---

## 1) Current Reality Snapshot

### Architecture & Tooling
- **Tuist is source of truth** for project generation.
- **Modularization complete**: Core → Domain → Features → Product (App/Engine/CLI).
- **Swift 6.2 + macOS 26+** enforced across targets.

### Runtime & Platform (Backend)
- **Containers**: Apple Containerization framework integrated, lifecycle, logs, events.
- **Images**: Pull + caching + registry auth.
- **Storage**: Bind mounts + named volumes.
- **Networking**: DNS resolver, `*.flyingdutchman.local` (legacy `*.fd.local`), HTTPS proxy + CA, port forwarding.
- **Linux Machines (VMs)**: **Implemented** via Virtualization.framework.
- **Kubernetes (k3s)**: Provisioning on VMs implemented; domain routing pending.

### CLI / Daemon
- **CLI (`fd`)**: covers containers, images, volumes, networks, machines, k8s, config.
- **Engine**: daemon mode supported; HTTP APIs for machines & container operations.

### macOS App UI (What Exists)
- **Shell**: Main window + sidebar + toolbar + menu bar extra.
- **Screens**: Containers (list + detail), Stacks (list + detail), Images (list + pull), Volumes (list), Networks (list), Logs, Events, Settings.
- **Command Palette**: placeholder only.
- **Diagnostics banners**: platform + containerization checks.

### macOS App UI (Missing)
- **Linux Machines UI**: not implemented.
- **Kubernetes UI**: not implemented.
- **Debug Shell UI**: not implemented.
- **Command Palette UX**: not implemented (placeholder only).

---

## 2) Feature Matrix (Backend / CLI / UI)

| Feature Area | Backend | CLI | macOS UI | Notes |
| --- | --- | --- | --- | --- |
| Containers | ✅ | ✅ | ✅ | List + detail, actions, logs via VSOCK |
| Images | ✅ | ✅ | ✅ | Pull + list; no build UI |
| Volumes | ✅ | ✅ | ✅ | List only |
| Networks | ✅ | ✅ | ✅ | List only |
| Diagnostics (Logs/Events) | ✅ | ✅ | ✅ | Events + Logs views |
| Linux Machines (VMs) | ✅ | ✅ | ❌ | Virtualization.framework implemented; no UI |
| Kubernetes (k3s) | ✅ | ✅ | ❌ | Domain routing pending |
| DNS + HTTPS | ✅ | ✅ | ❌ | No UI configuration |
| Command Palette | ❌ | n/a | ⚠️ Placeholder | No actions wired |
| Debug Shell (VSOCK) | ⚠️ Partial | ✅ (exec/ssh) | ❌ | UI not implemented |

Legend: ✅ implemented, ⚠️ partial, ❌ missing

---

## 3) Immediate Priorities (Ordered)

### P0 — macOS App Completeness
1. **Linux Machines UI**
   - list, create, start/stop, SSH, resource edits
2. **Kubernetes UI**
   - clusters list, create, kubeconfig export
3. **Command Palette**
   - real actions + search across entities
4. **Debug Shell UI**
   - local exec/attach over VSOCK (per spec)

### P1 — Networking Enhancements
1. `*.k8s.fd.local` routing
2. Compose service domains (`service.project.flyingdutchman.local`)

### P2 — Image & Build Workflow
1. BuildKit integration
2. Multi-platform builds

---

## 4) Workstreams (Concrete Next Steps)

### UI Workstream (App)
- Add **Machines** feature module + UI.
- Add **Kubernetes** feature module + UI.
- Replace command palette placeholder with functional palette.
- Add debug shell view (exec/attach).

### Platform Workstream
- Implement k8s domain routing.
- Harden HTTPS proxy + DNS resolver UX (UI + status).

---

## 5) Done Definition (for “Phase 4: UX Polish”)

The macOS app is “polished” when:
- Machines and Kubernetes are fully manageable from the UI.
- Command palette executes key actions.
- Debug shell is integrated.
- Settings cover resource limits and startup preferences.

---

## 6) Dependencies Snapshot

See `openspec/dependencies.md` for full registry and rationale.

Primary packages in use:
- `apple/containerization`
- `GRDB.swift`
- `swift-nio`
- `swift-argument-parser`
- `swift-log`
- `swiftkube/client`
- `hummingbird`
- `pointfreeco/swift-dependencies`
