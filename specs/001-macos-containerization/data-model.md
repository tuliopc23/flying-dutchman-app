# Data Model: macOS Containerization

**Last Updated**: 2024-12-18
**Implementation Status**: Phase A.1 Complete ✅

## Entities

### Implemented (GRDB) ✅

- **ContainerSummary** (`containers` table): id (UUID), name, image, status (running/stopped/paused), ports[] (JSON), createdAt, updatedAt
  - Repository: `ContainerStore` with CRUD, search, fetchRunning, replaceAll, seedIfEmpty
  
- **ImageSummary** (`images` table): id (UUID), name, tag, digest?, sizeBytes?, createdAt
  - Repository: `ImageStore` with CRUD, search, fetch by name+tag
  
- **VolumeSummary** (`volumes` table): id (UUID), name, mountPath, sizeBytes?, createdAt, updatedAt
  - Repository: `VolumeStore` with CRUD, replaceAll, seedIfEmpty
  
- **NetworkSummary** (`networks` table): id (UUID), name, subnet?, connectedContainerIDs[] (JSON), createdAt, updatedAt
  - Repository: `NetworkStore` with CRUD, replaceAll, seedIfEmpty
  
- **StackSummary** (`stacks` table): id (UUID), name, description?, containerNames[] (JSON), createdAt
  - Repository: `StackStore` with CRUD, create from StackCreateRequest
  
- **ContainerLog** (`containerLogs` table): id (auto), containerId, line, createdAt
  - Repository: `ContainerLogStore` with append, fetch (limit), auto-prune (500 max per container)
  
- **ShimEvent** (`shimEvents` table): id (auto), status, containerId?, image?, kind, timestamp
  - Repository: `ShimEventStore` for Docker API event recording

### Planned (Not Yet Implemented)

- **Container** (full): projectId, imageId, state (running/stopped/paused/starting/error), env[], resources (cpu/mem limits), networkIds[], volumeMounts[], shimId?, engineHostPath, kernelVersion?, rosettaRequired?
- **Image** (full): registry, pulledAt, labels, source (registry/local build), pullStatus/history.
- **Volume** (full): type (bind/managed), backingStore.
- **Network** (full): gateway, dnsNames[].
- **Project/Stack** (full): containers[], dependencyGraph, env (dev/test/preview), status.
- **LogStream**: level, message, source (stdout/stderr), filterTokens (for indexing/search).
- **MetricsSample**: containerId, timestamp, cpuUsage, memUsage, ioRead/Write, netRx/Tx.
- **DockerShimMapping**: shimContainerId, engineContainerId, apiVersion, unsupportedFlags[], lastAccessedAt.
- **DevCluster**: id, name, kubeconfigPath, state (starting/running/stopped/error), nodeType (apple-container/micro-vm), resources, createdAt, updatedAt.
- **Pipeline**: id, projectId, name, steps[], status, startedAt, finishedAt, failureReason?, logsRef.

## Relationships

### Implemented ✅
- Stack has many container names (string references, not FK)
- ContainerLog belongs to Container (by containerId)
- Network tracks connectedContainerIDs (UUID array, logical reference)
- containerStacks join table: containerId ↔ stackId (FK with cascade delete)

### Planned
- Project has many Containers, Images (logical), Networks, Volumes, Pipelines.
- Container uses one Image; has many Volume mounts; belongs to many Networks; belongs to one Project.
- DockerShimMapping maps external shim ids to internal container ids (1:1 per shim container).
- DevCluster owns kubeconfig and may reference Project deployments.

## Validation Rules

### Implemented ✅
- Container status must be one of: running, stopped, paused
- UUID required for all entity IDs (generated if not provided)
- Ports stored as JSON array of strings (e.g., ["8080:8080"])
- connectedContainerIDs stored as JSON array of UUID strings
- containerNames stored as JSON array of strings
- ContainerLogs auto-pruned to 500 entries per container

### Planned
- Container name unique per project; shim id unique per socket.
- Ports must not conflict within a network; detect collisions before start.
- Image requires either digest or (name+tag); pull state tracked per registry.
- Volumes must declare mountPath and type; bind mounts must exist; managed volumes provisioned before attach.
- DevCluster must expose kubeconfig and mark state consistent (no partial start without recovery path).
- Pipelines must define ordered steps; status transitions monotonic (pending → running → success/failed).

## Database Schema

### Migrations (Implemented ✅)

```
v1_core_schema:
  - containers (id, name, image, status, ports, createdAt, updatedAt)
  - images (id, name, tag, digest, sizeBytes, createdAt)
  - stacks (id, name, description, createdAt, containerNames)
  - containerStacks (containerId FK, stackId FK)

v3_networks_volumes:
  - volumes (id, name, mountPath, sizeBytes, createdAt, updatedAt)
  - networks (id, name, subnet, connectedContainerIDs, createdAt, updatedAt)

v4_container_logs:
  - containerLogs (id AUTO, containerId, line, createdAt)

v5_shim_events:
  - shimEvents (id AUTO, status, containerId, image, kind, timestamp)
```

### Repository Pattern

All stores follow actor-based concurrency with:
- `fetchAll()` - nonisolated for thread-safe reads
- `fetch(id:)` - async actor-isolated
- `insert(_:)` / `update(_:)` / `upsert(_:)` - async actor-isolated
- `delete(id:)` - async actor-isolated
- `seedIfEmpty(with:)` - async actor-isolated
- `replaceAll(with:)` - nonisolated for bulk operations

### Seed Data

`SeedData.swift` provides:
- 5 sample containers (api, worker, db, redis, nginx)
- 6 sample images
- 4 sample stacks
- 5 sample volumes
- 4 sample networks
- Test data generators: `randomContainer()`, `randomImage()`, `generateContainers(count:)`, `generateImages(count:)`
