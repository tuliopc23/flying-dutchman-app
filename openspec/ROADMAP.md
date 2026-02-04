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
- **Kubernetes (k3s)**: Provisioning on VMs implemented; domain routing active (`*.k8s.flyingdutchman.local`, legacy `*.k8s.fd.local`).

### CLI / Daemon
- **CLI (`fd`)**: covers containers, images, volumes, networks, machines, k8s, config.
- **Engine**: daemon mode supported; HTTP APIs for machines & container operations.

### macOS App UI (What Exists)
- **Shell**: Main window + sidebar + toolbar + menu bar extra.
- **Screens**: Containers, Stacks, Images, Volumes, Networks, Logs, Events, Settings, Machines, Kubernetes, Debug Shell.
- **Command Palette**: functional search + actions (global shortcut pending).
- **Diagnostics banners**: platform + containerization checks.

### macOS App UI (Missing)
- **Command Palette UX**: global shortcut + polish still pending.
- **Debug Shell UI**: embedded terminal (libghostty) still pending.

---

## 2) Feature Matrix (Backend / CLI / UI)

| Feature Area | Backend | CLI | macOS UI | Notes |
| --- | --- | --- | --- | --- |
| Containers | ✅ | ✅ | ✅ | List + detail, actions, logs via VSOCK |
| Images | ✅ | ✅ | ✅ | Pull + list; no build UI |
| Volumes | ✅ | ✅ | ✅ | List only |
| Networks | ✅ | ✅ | ✅ | List only |
| Diagnostics (Logs/Events) | ✅ | ✅ | ✅ | Events + Logs views |
| Linux Machines (VMs) | ✅ | ✅ | ✅ | UI list/detail + actions |
| Kubernetes (k3s) | ✅ | ✅ | ✅ | UI list/create + kubeconfig |
| DNS + HTTPS | ✅ | ✅ | ❌ | No UI configuration |
| Command Palette | ❌ | n/a | ⚠️ Partial | UI + actions wired; global shortcut pending |
| Debug Shell (VSOCK) | ⚠️ Partial | ✅ (exec/ssh) | ⚠️ Partial | External terminal launcher; embedded VT pending |

Legend: ✅ implemented, ⚠️ partial, ❌ missing

---

## 3) Immediate Priorities (Ordered)

### P0 — macOS App Completeness
1. **Command Palette**
   - global shortcut + refined UX
2. **Debug Shell UI**
   - embedded terminal (libghostty) + theming
3. **Settings & Preferences**
   - resource limits and startup behavior

### P1 — Networking Enhancements
1. Compose service domains (`service.project.flyingdutchman.local`)

### P2 — Image & Build Workflow
1. BuildKit integration
2. Multi-platform builds

---

## 4) Workstreams (Concrete Next Steps)

### UI Workstream (App)
- Finish Command Palette (global shortcut + polish).
- Embed terminal via `libghostty` for Debug Shell.
- Add Settings screens for resource limits + startup preferences.

### Platform Workstream
- Harden HTTPS proxy + DNS resolver UX (UI + status).
- Compose service domain routing (`service.project.flyingdutchman.local`).

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
