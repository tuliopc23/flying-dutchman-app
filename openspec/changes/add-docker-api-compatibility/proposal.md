# Add Docker API Compatibility

## Why

Flying Dutchman needs Docker API compatibility to enable:
- Docker Compose workflows
- Existing Docker tooling (docker CLI, IDEs, CI/CD pipelines)
- Seamless migration from Docker Desktop
- Integration with tools that expect Docker API endpoints

Currently, the engine exposes custom HTTP endpoints (`/containers`, `/images`) but lacks Docker-compatible API paths that tools expect.

## What Changes

- **Integrate DockerShimServer** into main server router
- **Complete core Docker API endpoints**:
  - Containers: `GET /v1.41/containers/json`, `POST /v1.41/containers/create`, `POST /v1.41/containers/{id}/start`, `POST /v1.41/containers/{id}/stop`, `DELETE /v1.41/containers/{id}`, `GET /v1.41/containers/{id}/logs`
  - Images: `GET /v1.41/images/json`, `POST /v1.41/images/create`, `DELETE /v1.41/images/{id}`
  - System: `GET /v1.41/info`, `GET /v1.41/version` (already implemented)
- **Maintain backward compatibility** with existing `/containers/*` routes
- **Map Docker API requests** to native container runtime operations

## Impact

- **Affected specs**: `docker-api` (new capability)
- **Affected code**: 
  - `Sources/FlyingDutchmanNetworking/DockerShimServer.swift` - Complete endpoints
  - `Sources/FlyingDutchmanNetworking/Server.swift` - Integrate DockerShimServer
  - `Sources/FlyingDutchmanNetworking/Routes/DockerRoutes.swift` - New file for Docker routes organization
- **Breaking changes**: None (additive only)

