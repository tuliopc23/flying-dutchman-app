## 1. Container Engine (1.1)

### 1.1 Container State Machine
- [ ] 1.1.1 Define `ContainerState` enum (created, starting, running, stopping, stopped, removing, removed)
- [ ] 1.1.2 Create `ContainerStateMachine` with valid transitions
- [ ] 1.1.3 Integrate state machine into `ContainerizationRuntime`
- [ ] 1.1.4 Add state change events to persistence layer
- [ ] 1.1.5 Update UI to observe state transitions

### 1.2 Container Event Streaming
- [ ] 1.2.1 Define `ContainerEvent` type (stateChanged, logOutput, resourceUpdate)
- [ ] 1.2.2 Add `eventStream() -> AsyncStream<ContainerEvent>` to runtime protocol
- [ ] 1.2.3 Implement event broadcasting in ContainerizationRuntime
- [ ] 1.2.4 Add event persistence for replay on reconnect

### 1.3 Container Logs Streaming
- [ ] 1.3.1 Implement `getContainerLogs(id:)` for running containers
- [ ] 1.3.2 Add follow mode with AsyncStream
- [ ] 1.3.3 Store logs to filesystem for stopped container access
- [ ] 1.3.4 Add log rotation for container logs

### 1.4 VSOCK Communication
- [ ] 1.4.1 Implement `dialVsock(port:)` wrapper on LinuxContainer
- [ ] 1.4.2 Create VSOCK client for host-to-guest communication
- [ ] 1.4.3 Add health check via VSOCK

### 1.5 Compose Project Support
- [ ] 1.5.1 Parse docker-compose.yml files
- [ ] 1.5.2 Create `ComposeProjectManager` for multi-container orchestration
- [ ] 1.5.3 Implement `up`, `down`, `restart` commands
- [ ] 1.5.4 Add service dependency ordering
- [ ] 1.5.5 Support compose profiles

## 2. Image Management (1.2)

### 2.1 Kernel Management
- [ ] 2.1.1 Create `KernelManager` class
- [ ] 2.1.2 Implement kernel download from GitHub releases
- [ ] 2.1.3 Add kernel version validation
- [ ] 2.1.4 Add initfs (vminit) download

### 2.2 Image Layer Caching
- [ ] 2.2.1 Implement content-addressable blob storage
- [ ] 2.2.2 Add layer deduplication across images
- [ ] 2.2.3 Implement cache eviction policy (LRU, size-based)
- [ ] 2.2.4 Add cache statistics and management

### 2.3 BuildKit Integration
- [ ] 2.3.1 Evaluate BuildKit as library vs subprocess
- [ ] 2.3.2 Implement `docker build` via BuildKit
- [ ] 2.3.3 Add build cache support
- [ ] 2.3.4 Support multi-stage builds

### 2.4 Image Filesystem Exposure
- [ ] 2.4.1 Create `~/FlyingDutchman/images/` directory structure
- [ ] 2.4.2 Expose image layers as read-only directory
- [ ] 2.4.3 Add image metadata files

## 3. Storage (1.3)

### 3.1 Bind Mounts
- [ ] 3.1.1 Add `Mount` type to container config
- [ ] 3.1.2 Implement bind mount in LinuxContainer configuration
- [ ] 3.1.3 Handle mount permissions and ownership
- [ ] 3.1.4 Add mount validation (path exists, readable/writable)

### 3.2 Named Volumes
- [ ] 3.2.1 Create `Volume` model and `VolumeStore`
- [ ] 3.2.2 Create `VolumeManager` for lifecycle operations
- [ ] 3.2.3 Implement volume creation with driver support
- [ ] 3.2.4 Add volume inspection and removal

### 3.3 Filesystem Exposure
- [ ] 3.3.1 Create `~/FlyingDutchman/containers/` directory structure
- [ ] 3.3.2 Expose container rootfs as browsable directory
- [ ] 3.3.3 Add container data directory for configs and logs

## 4. Testing

### 4.1 Unit Tests
- [ ] 4.1.1 Test ContainerStateMachine transitions
- [ ] 4.1.2 Test event streaming
- [ ] 4.1.3 Test image layer caching

### 4.2 Integration Tests
- [ ] 4.2.1 Test full container lifecycle with state machine
- [ ] 4.2.2 Test compose project up/down
- [ ] 4.2.3 Test bind mounts and volumes

## 5. Documentation

### 5.1 Update Phase Status
- [ ] 5.1.1 Update `openspec/phases/phase-1/status.md` as progress is made
- [ ] 5.1.2 Update `openspec/ROADMAP.md` with Phase 1 progress
