# Research Notes: macOS Containerization

## Decisions
- Runtime: Apple Containerization as primary; container CLI only for bootstrap/diagnostics/fallback.
- Networking/API: SwiftNIO + Hummingbird 2 for internal HTTP; XPC for privileged control; AsyncHTTPClient for registries.
- Docker compatibility: Implement Docker HTTP subset over Unix socket, backed by Containerization; explicit errors for unsupported semantics; optional Podman/VM fallback later.
- Dev cluster: K3s in Apple container or micro-VM; SwiftkubeClient for app-centric views; kubeconfig published.
- Persistence: SQLite/GRDB for engine metadata; SwiftData for UI state; migrations required; corruption handling with user recovery.
- Logging/lifecycle: swift-log + OSLog backend; swift-service-lifecycle for daemon start/stop; launchd-managed.
- VM path: Virtualization.framework; “promote container → VM” reuse of volumes; micro-VM optional.
- AI/DevOps: Optional SwiftAI + Stakpak via ACP, feature-flagged; pipelines as YAML/Swift DSL executed by engine.

## Open Items
- Shim coverage: exact Docker API endpoints to support in v1 (ps/create/start/stop/logs/pull?).
- Dev cluster footprint: choose Apple container vs micro-VM default; resource limits.
- Security: socket permissions for shim and engine HTTP; auth model if any (local-only vs token).
- UX copy: unsupported-feature messaging for shim/Podman fallback.
