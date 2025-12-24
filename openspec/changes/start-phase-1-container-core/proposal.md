# Change: Start Phase 1 - Container Core

## Why
Phase 0 (Foundation) is complete. The container runtime abstraction, logging, and error handling infrastructure are in place. Phase 1 builds on this foundation to deliver a fully functional Docker-compatible container engine.

## What Changes

### 1.1 Container Engine
- **Container state machine**: Track container states (created → starting → running → stopping → stopped)
- **Container event streaming**: Real-time events via AsyncStream
- **Container logs streaming**: Real-time log output via AsyncStream
- **VSOCK communication**: Enable host-to-container communication
- **Compose project support**: Parse and orchestrate docker-compose.yml files

### 1.2 Image Management
- **Kernel download automation**: Download Linux kernel if missing
- **Image layer caching**: Cache OCI layers to avoid re-downloading
- **BuildKit integration**: Support for `docker build` via BuildKit
- **Image filesystem exposure**: Expose images at `~/FlyingDutchman/images/`

### 1.3 Storage
- **Bind mount support**: Mount host directories into containers
- **Named volumes**: Create and manage persistent volumes
- **Volume lifecycle management**: Volume CRUD operations
- **Filesystem exposure**: Expose container data at `~/FlyingDutchman/containers/`

## Impact
- Affected specs: `container-engine`, `container-storage`, `image-management`
- Affected modules:
  - `FlyingDutchmanContainers/ContainerizationRuntime.swift` - Add streaming, state machine
  - `FlyingDutchmanContainers/` - New managers (Compose, Image, Volume, Kernel)
  - `Shared/Models/Container.swift` - Enhanced state model
  - `FlyingDutchmanPersistence/` - Volume and image stores
