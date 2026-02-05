# Implementation Plan: Compose Domain Routing

## Goal
Enable automatic `service.project.flyingdutchman.local` domain resolution for Docker Compose projects running in Flying Dutchman.

## User Value
Developers using `docker-compose` will be able to access their services via consistent, predictable hostnames without manual `/etc/hosts` management or port mapping lookups.

## Technical Approach

### 1. Database Schema
- **Migration**: `v10_container_labels`
- **Table**: `containers`
- **Column**: `labels` (TEXT, JSON-encoded dictionary)
- **Rationale**: Labels are the standard way to attach metadata (like compose project/service names) to containers.

### 2. Data Models
- **Structs**: `ContainerConfig` and `ContainerSummary`.
- **Change**: Add `labels: [String: String]?` property.
- **Impact**: Allows the Runtime to accept labels and the Persistence layer to store/retrieve them.

### 3. Persistence Layer
- **Component**: `ContainerStore` (Repository)
- **Change**: Update `ContainerRecord` to map the `labels` dictionary to the JSON text column.

### 4. Domain Logic (ComposeProjectManager)
- **Action**: When parsing `docker-compose.yml` and creating containers:
    - Inject `com.docker.compose.project` label.
    - Inject `com.docker.compose.service` label.
    - Inject `com.docker.compose.container-number` label.
- **Why**: Matches standard Docker Compose behavior, ensuring compatibility with tools inspecting these labels.

### 5. Networking (DomainRoutingTable)
- **Action**: Update `register(container:)`.
- **Logic**:
    - Check for `com.docker.compose.service` and `com.docker.compose.project` labels.
    - If found, register upstream (Container IP) for:
        - `<service>.<project>.flyingdutchman.local`
        - `<service>.<project>.fd.local` (Convenience short domain)

### 6. Documentation
- **Action**: Update `openspec/phases/phase-3/status.md`.
- **Change**: Mark "Compose Domain Routing" as In Progress (or Complete after verification).

## Execution Steps

1.  **Modify `Database.swift`**: Add the GRDB migration.
2.  **Modify `Container.swift` & `ContainerRuntimeProtocol.swift`**: Add properties.
3.  **Modify `ContainerStore.swift`**: Add persistence mapping.
4.  **Modify `ComposeProjectManager.swift`**: Inject labels during container creation.
5.  **Modify `DomainRoutingTable.swift`**: Add resolution logic.
6.  **Modify `ContainerizationRuntime.swift`**: Pass labels during creation.
7.  **Update Documentation**: Update phase status.

## Verification
- **Test**: Run `fd start` on a sample compose project.
- **Verify**: `dig web.myproject.fd.local @127.0.0.1 -p 5353` returns the container IP.
