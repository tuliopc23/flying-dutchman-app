# Feature Specification: Flying Dutchman - macOS Native Containerization Tool

**Feature Branch**: `001-macos-containerization`  
**Created**: 2025-12-03  
**Status**: Draft  
**Input**: User description: "Create a specification for Flying Dutchman, a next-generation macOS containerization and orchestration tool for macOS Tahoe."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Launch and View Container Status (Priority: P1)

A macOS developer opens Flying Dutchman and immediately sees the status of their local development containers through a clean, native macOS interface with Liquid Glass aesthetics.

**Why this priority**: Core value proposition - native macOS container visibility. Without this, the application provides no basic functionality.

**Independent Test**: Can be fully tested by launching the app, viewing the main window with Liquid Glass effects, and seeing container list (even if empty) with proper SF Symbol 7 icons showing status states.

**Acceptance Scenarios**:

1. **Given** Flying Dutchman is installed, **When** user launches the application, **Then** main window appears with native Liquid Glass visual treatment and sidebar navigation
2. **Given** the app is running, **When** user views the containers section, **Then** all containers are listed with SF Symbol 7 status indicators (running/stopped/paused)
3. **Given** containers are listed, **When** container state changes, **Then** SF Symbol variable effects animate the transition smoothly

---

### User Story 2 - Manage Individual Containers (Priority: P1)

A developer interacts with containers using native macOS controls to start, stop, and inspect containers without touching command-line tools.

**Why this priority**: Essential container lifecycle management. Delivers immediate value for daily development workflows.

**Independent Test**: Can be tested by selecting a container and performing start/stop operations through UI controls, verifying state changes reflected in real-time.

**Acceptance Scenarios**:

1. **Given** a stopped container exists, **When** user clicks start action, **Then** container starts and UI updates to show running state with animated transition
2. **Given** a running container exists, **When** user clicks stop action, **Then** container stops gracefully and status updates
3. **Given** any container is selected, **When** user views details pane, **Then** container metadata displays (image, ports, volumes, creation time) without implementation details
4. **Given** container is starting, **When** operation is in progress, **Then** SF Symbol 7 draw effect shows progress indicator

---

### User Story 3 - Pull and Manage Container Images (Priority: P2)

A developer pulls container images from registries through the Flying Dutchman interface, seeing real-time progress with native macOS visual feedback.

**Why this priority**: Required for creating containers, but less critical than managing existing ones. Users may already have images from CLI workflows.

**Independent Test**: Can be tested by initiating an image pull from a registry, observing progress indicators, and verifying image appears in images list.

**Acceptance Scenarios**:

1. **Given** user is in images section, **When** user specifies image name and registry, **Then** pull operation begins with progress visualization
2. **Given** image is pulling, **When** layers download, **Then** SF Symbol 7 variable effects show download progress per layer
3. **Given** pull completes, **When** image is available, **Then** image appears in list with metadata (size, creation date, tags)
4. **Given** pull fails, **When** network or authentication error occurs, **Then** user sees clear error message with suggested remediation

---

### User Story 4 - Execute Commands via CLI (Priority: P2)

A power user executes container operations through a native Swift-based CLI that communicates with the Flying Dutchman engine, enabling scriptable workflows.

**Why this priority**: Critical for automation and CI/CD integration, but GUI users don't depend on it.

**Independent Test**: Can be tested by running `flyingdutchman version` and `flyingdutchman containers list` commands, verifying output and communication with engine daemon.

**Acceptance Scenarios**:

1. **Given** CLI is installed, **When** user runs `flyingdutchman version`, **Then** current version and build information displays
2. **Given** CLI is configured, **When** user runs `flyingdutchman containers list`, **Then** running containers display in table format
3. **Given** engine is running, **When** CLI communicates with daemon, **Then** commands execute with sub-second response time for simple queries

---

### User Story 5 - Organize Containers in Projects/Stacks (Priority: P3)

A developer groups related containers into logical projects (stacks) for managing multi-container applications as cohesive units.

**Why this priority**: Valuable for complex multi-service apps, but single-container workflows are viable without it.

**Independent Test**: Can be tested by creating a project definition with multiple containers, starting/stopping the entire stack, and verifying all containers operate together.

**Acceptance Scenarios**:

1. **Given** user creates a new project, **When** user defines multiple related containers, **Then** project appears in sidebar with all member containers
2. **Given** a project exists, **When** user starts the project, **Then** all containers start in dependency order
3. **Given** project is running, **When** user stops the project, **Then** all containers stop gracefully in reverse order

---

### User Story 6 - Access Container Logs and Metrics (Priority: P3)

A developer views real-time logs and resource metrics for running containers to troubleshoot issues and monitor performance.

**Why this priority**: Important for debugging, but not essential for basic container management. Developers can fall back to CLI tools initially.

**Independent Test**: Can be tested by selecting a running container, viewing logs panel, and observing streaming log entries with timestamp and filtering capabilities.

**Acceptance Scenarios**:

1. **Given** a container is running and producing logs, **When** user opens logs view, **Then** logs stream in real-time with timestamps
2. **Given** logs are visible, **When** user applies text filter, **Then** only matching log entries display
3. **Given** container is using resources, **When** user views metrics panel, **Then** CPU and memory usage display with visual indicators

---

### User Story 7 - Docker API Compatibility Shim (Priority: P2)

Existing Docker/Compose tooling should work against Flying Dutchman without a heavy Docker VM by exposing a subset of the Docker Engine HTTP API backed by Apple Containerization.

**Why this priority**: Keeps developer muscle memory and CI scripts working, reducing adoption friction while showcasing the Apple Containers runtime.

**Independent Test**: Point `DOCKER_HOST=unix:///var/run/flyingdutchman-docker.sock` and verify `docker ps`, `docker run` (basic), `docker pull`, and `docker logs` operate through Flying Dutchman with clear messaging for unsupported features.

**Acceptance Scenarios**:

1. **Given** docker CLI is installed and DOCKER_HOST points to Flying Dutchman, **When** the user runs `docker ps`, **Then** container list reflects Apple Containerization-backed instances
2. **Given** the user runs a supported Docker API call (create/start/logs), **When** the operation completes, **Then** results match the Flying Dutchman engine state with sub-second latency
3. **Given** the user invokes an unsupported Docker API feature, **When** the request is processed, **Then** Flying Dutchman returns a clear "unsupported" error with suggested alternatives or Podman fallback
4. **Given** the shim is running, **When** it cannot reach FlyingDutchmanEngine, **Then** it surfaces a clear connectivity error without hanging docker CLI

---

### User Story 8 - Flying Dutchman Dev Cluster (Priority: P3)

Developers can spin up a lightweight K3s-based dev cluster backed by Apple Containerization or a micro-VM and view apps as high-level units.

**Why this priority**: Extends container workflows into orchestration with minimal setup, matching the PRD vision for local clusters.

**Independent Test**: Create a dev cluster, deploy a sample app, and observe status/logs via SwiftkubeClient-powered views without leaving Flying Dutchman.

**Acceptance Scenarios**:

1. **Given** Flying Dutchman is installed, **When** the user creates a dev cluster, **Then** K3s boots using Apple Containerization or a dedicated micro-VM and exposes kubeconfig
2. **Given** a dev cluster is running, **When** the user deploys a sample app, **Then** app-level cards show pods/services with live status and logs
3. **Given** cluster health degrades, **When** the user views the cluster, **Then** Flying Dutchman surfaces diagnostics and remediation guidance
4. **Given** the user requests teardown, **When** the cluster shuts down, **Then** resources (containers/VMs/networks) are cleaned up and state persisted

---

### Edge Cases

- What happens when Apple Containerization framework is unavailable and system falls back to `container` CLI?
- How does the system handle registry authentication failures or expired credentials?
- What occurs when user attempts to start a container with conflicting port mappings?
- How does the app behave when Flying Dutchman engine daemon is not running?
- What happens when user pulls an image during network interruption or timeout?
- How does the system handle containers created outside Flying Dutchman (via CLI or other tools)?
- What occurs when user attempts operations on containers during macOS system sleep/wake cycle?
- How does the app respond when disk space is insufficient for image pulls or container storage?
- How does the Docker API shim respond to unsupported API semantics (e.g., custom volume drivers, privileged containers)?
- What happens when the shim socket is present but FlyingDutchmanEngine is unreachable?
- How does the dev cluster recover from partial K3s startup or node/container drift?

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST provide native macOS application with SwiftUI interface compliant with macOS Tahoe HIG
- **FR-002**: System MUST integrate with Apple Containerization framework as primary container runtime
- **FR-003**: System MUST fall back to `container` CLI when Containerization framework is unavailable
- **FR-004**: System MUST display all local containers with current state (running, stopped, paused)
- **FR-005**: System MUST allow users to start, stop, and restart containers through UI controls
- **FR-006**: System MUST pull container images from OCI-compliant registries
- **FR-007**: System MUST show real-time progress during image pull operations
- **FR-008**: System MUST persist container, image, and stack metadata using SQLite database
- **FR-009**: System MUST provide command-line interface with subcommands for version, diagnostics, and container operations
- **FR-010**: CLI MUST communicate with engine daemon via local HTTP API
- **FR-011**: System MUST use official Liquid Glass APIs for window and surface visual effects
- **FR-012**: System MUST use SF Symbols 7 for all icons with draw/variable effects for state transitions
- **FR-013**: System MUST support user creation of projects/stacks grouping multiple containers
- **FR-014**: System MUST start and stop containers within projects in dependency-aware order
- **FR-015**: System MUST stream container logs in real-time with timestamps
- **FR-016**: System MUST display container resource metrics (CPU, memory usage)
- **FR-017**: System MUST manage container networks and volume mounts
- **FR-018**: System MUST support dark mode and respect system accessibility preferences
- **FR-019**: System MUST provide command palette accessible via ⌘K keyboard shortcut
- **FR-020**: System MUST run exclusively on macOS Tahoe 26+ with Apple Silicon processors
- **FR-021**: System MUST validate registry credentials before attempting image pulls
- **FR-022**: System MUST detect and display containers created by external tools
- **FR-023**: System MUST handle graceful degradation when engine daemon is unreachable
- **FR-024**: System MUST persist UI state including window layout, recently accessed containers, and user preferences
- **FR-025**: System MUST provide internal API endpoint for inter-process communication between CLI and engine daemon
- **FR-026**: System MUST expose a Docker Engine HTTP subset over a Unix socket backed by Apple Containerization, returning clear errors for unsupported semantics
- **FR-027**: System MUST offer optional Podman/VM fallback for unsupported Docker features with explicit opt-in
- **FR-028**: System MUST allow creation and teardown of a local dev cluster (K3s-based) using Apple Containerization or a micro-VM
- **FR-029**: System MUST integrate with Kubernetes via SwiftkubeClient to present app-centric views of deployments, services, pods, and logs
- **FR-030**: System MUST publish kubeconfig for the dev cluster and manage lifecycle (start/stop/recover) via FlyingDutchmanEngine
- **FR-031**: System MUST support promoting a container workload into a dedicated VM using Virtualization.framework while retaining volumes
- **FR-032**: System MUST define pipelines (YAML or Swift DSL) for build/test/push/deploy steps executed by FlyingDutchmanEngine
- **FR-033**: System SHOULD integrate DevOps/AI agents (e.g., Stakpak via ACP, Swift-native assistant) for diagnostics and workflow generation

### Key Entities

- **Container**: Represents a running or stopped container instance with state, configuration, image reference, network settings, and volume mounts
- **Image**: Represents a container image pulled from registry with layers, tags, size, and creation metadata
- **Volume**: Represents persistent storage mounted into containers with mount paths and ownership metadata
- **Network**: Represents virtual network connecting containers with routing and isolation configuration
- **Stack/Project**: Represents logical grouping of related containers with startup order and shared configuration
- **RuntimeConfig**: Represents container execution settings including resource limits, environment variables, and port mappings

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Users can launch the application and view container list in under 2 seconds from cold start
- **SC-002**: Container state changes (start/stop) reflect in UI within 500 milliseconds
- **SC-003**: Image pull progress updates display with sub-second latency during download
- **SC-004**: Application maintains responsive UI (60fps scrolling and animations) with up to 100 containers managed
- **SC-005**: CLI commands respond within 1 second for simple queries (version, list operations)
- **SC-006**: Users can complete common workflows (start container, view logs, stop container) 40% faster than using Docker Desktop or command-line alternatives
- **SC-007**: Application consumes less than 150MB memory when idle with 20 containers managed
- **SC-008**: 95% of container operations complete successfully on first attempt without errors
- **SC-009**: Users can identify container state instantly through SF Symbol visual indicators without reading text labels
- **SC-010**: Application UI fully conforms to macOS Tahoe HIG with proper Liquid Glass integration verified by visual inspection
- **SC-011**: All core container operations (list, start, stop, pull image) function identically via GUI and CLI interfaces
- **SC-012**: System correctly handles network interruptions during image pulls with automatic retry or clear failure messaging 100% of the time
- **SC-013**: Docker API shim returns responses for supported calls within 1 second and emits explicit, actionable errors for unsupported semantics
- **SC-014**: Dev cluster creation completes in under 2 minutes with kubeconfig available and validated by `kubectl get nodes`
- **SC-015**: App-centric Kubernetes views reflect pod/deployment status changes within 1 second of receipt from SwiftkubeClient
- **SC-016**: Defined pipelines execute end-to-end with per-step status and failure reasons surfaced to the user on first attempt
