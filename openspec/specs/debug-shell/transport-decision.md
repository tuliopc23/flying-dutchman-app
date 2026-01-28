# Debug Shell Transport Decision: Exec/VSOCK First, SSH Optional

## Status
Accepted

## Context
Flying Dutchman targets macOS 26+ and uses Apple's Containerization framework for VM-backed containers. The product needs an "access container shell" experience from both the UI and CLI.

A common question is whether container shell access should be implemented via SSH.

## Decision
1. **Primary mechanism for container shell access SHALL be `exec/attach` over a runtime control channel (VSOCK)**.
2. **SSH SHALL NOT be the default mechanism for local container shell access**.
3. **SSH (via Citadel) MAY be supported as an optional feature** for:
    * remote hosts (Docker contexts / remote engines),
    * Linux machines / dev clusters (VM nodes),
    * explicitly "SSH-enabled" containers (opt-in images that run `sshd` and expose port 22).

## Rationale
### Why not SSH by default
SSH requires the container environment to provide and maintain:
* a running `sshd`, users, and authentication material (keys/passwords),
* a reachable network path to port 22 (port forwards/NAT),
* hardening and lifecycle management (key rotation, config drift),
* image modifications that break assumptions for minimal/distroless images.

Most container images do **not** run `sshd`, and distroless images intentionally do not include shells.

### Why exec/attach over VSOCK
* Works for typical container shells without requiring `sshd`.
* Aligns with Docker/Podman UX (`docker exec -it ...`).
* Fits the existing architecture: the engine already uses VSOCK for log streaming.
* Provides a foundation for advanced debugging features (PTY, streaming, multiplexing).

## Consequences
### Positive
* Container shell UX works for the common case without modifying images.
* Enables "debug shell" workflows for minimal and distroless images by launching a helper/debug environment.
* Clear separation of concerns:
    * VSOCK for local runtime control
    * SSH for remote host connectivity

### Negative / Tradeoffs
* Requires implementing an exec/attach protocol (PTY, stdin/stdout/stderr streaming).
* Some remote debugging scenarios will still require SSH to the host (not the container).

## Implementation Notes
### Local containers (Apple Containerization)
* Engine exposes an API to open a shell session:
    * Create PTY session
    * Start process (e.g. `/bin/sh` or configured shell)
    * Stream bytes bidirectionally
* Transport between Engine and container uses VSOCK.

### UI integration
* Terminal UI uses libghostty-vt (planned dependency) to render PTY streams.

### CLI integration
* `fd shell <container>` attaches stdin/stdout to the session.

### SSH optional path
* For remote hosts: use Citadel to connect to the remote machine and then invoke `docker exec` (or the remote engine API) as appropriate.

## References
* `openspec/specs/debug-shell/spec.md`
* `openspec/project.md`
