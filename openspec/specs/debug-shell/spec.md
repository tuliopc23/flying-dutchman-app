## Purpose
Provide powerful debugging capabilities for containers, including a pre-configured debug shell with common tools that works even with minimal or distroless images, and support for debugging containers on remote Docker hosts.

## Transport Strategy
### Local containers (default)
Local container shell access SHALL use **exec/attach over a runtime control channel (VSOCK)**, not SSH.

* Rationale: most container images do not run `sshd`; distroless images cannot support SSH-based shell access.
* Reference: `transport-decision.md` in this directory.

### Remote debugging (optional)
Remote container debugging MAY use SSH to reach the **remote host** (Docker context) and then execute/attach to containers via the remote engine.

## Requirements
### Requirement: Debug shell for containers
The system SHALL provide a debug shell with built-in tools for container debugging, including minimal and distroless containers.

#### Scenario: Start a debug shell from the UI
- **WHEN** a user clicks Debug on a container
- **THEN** the app opens the user's preferred terminal app and runs `fd shell <container>`

**Notes**:
- Until `libghostty` is embedded, the UI uses external terminal apps (Ghostty/iTerm/WezTerm/kitty/Terminal).
- The underlying execution is still `exec/attach` over the runtime control channel (VSOCK).

### Requirement: Remote container debugging
The system SHALL support debugging containers running on remote Docker hosts via Docker contexts.

#### Scenario: Connect to a remote host
- **WHEN** a user selects a Docker context configured with SSH credentials
- **THEN** the debug shell connects to the remote container
