# Data Model: macOS Containerization

## Entities

- **Container**: id, name, projectId, imageId, state (running/stopped/paused/starting/error), createdAt, updatedAt, ports[], env[], resources (cpu/mem limits), networkIds[], volumeMounts[], shimId?, engineHostPath, kernelVersion?, rosettaRequired?
- **Image**: id, name, tag, digest, sizeBytes, registry, createdAt, pulledAt, labels, source (registry/local build), pullStatus/history.
- **Volume**: id, name, mountPath, sizeBytes, type (bind/managed), backingStore, createdAt, updatedAt.
- **Network**: id, name, subnet, gateway, dnsNames[], createdAt; memberships (containerIds).
- **Project/Stack**: id, name, description, containers[], dependencyGraph, env (dev/test/preview), status, createdAt, updatedAt.
- **LogStream**: containerId, timestamp, level, message, source (stdout/stderr), filterTokens (for indexing/search).
- **MetricsSample**: containerId, timestamp, cpuUsage, memUsage, ioRead/Write, netRx/Tx.
- **DockerShimMapping**: shimContainerId, engineContainerId, apiVersion, unsupportedFlags[], lastAccessedAt.
- **DevCluster**: id, name, kubeconfigPath, state (starting/running/stopped/error), nodeType (apple-container/micro-vm), resources, createdAt, updatedAt.
- **Pipeline**: id, projectId, name, steps[], status, startedAt, finishedAt, failureReason?, logsRef.

## Relationships
- Project has many Containers, Images (logical), Networks, Volumes, Pipelines.
- Container uses one Image; has many Volume mounts; belongs to many Networks; belongs to one Project.
- DockerShimMapping maps external shim ids to internal container ids (1:1 per shim container).
- DevCluster owns kubeconfig and may reference Project deployments.

## Validation Rules
- Container name unique per project; shim id unique per socket.
- Ports must not conflict within a network; detect collisions before start.
- Image requires either digest or (name+tag); pull state tracked per registry.
- Volumes must declare mountPath and type; bind mounts must exist; managed volumes provisioned before attach.
- DevCluster must expose kubeconfig and mark state consistent (no partial start without recovery path).
- Pipelines must define ordered steps; status transitions monotonic (pending → running → success/failed).
