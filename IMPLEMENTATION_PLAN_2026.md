# Flying Dutchman Implementation Plan - January 2026

**Created**: 2026-01-10  
**Status**: Active Implementation  
**Phase**: Completing Phase 1.2 (Image Management) & 1.3 (Storage)

---

## Current State Summary

### ✅ Phase 1.1 Complete (100%)
- Container lifecycle (create/start/stop/remove)
- State machine with transitions
- Live log streaming (VSOCK protocol)
- Event streaming (SSE via `/runtime-events`)
- Compose project support (YAML parsing with Yams)
- Kernel management with symlinks

### 🟡 Phase 1.2 In Progress (~85%)
- ✅ Basic OCI pull (manifest + blobs)
- ✅ Image cache manager (LRU eviction)
- ✅ Cache wired to pullImage
- ⚪ **MISSING: Registry authentication (Docker Hub login, private registries)**
- ⚪ **MISSING: Image filesystem exposure** (`~/FlyingDutchman/images/`)

### 🟡 Phase 1.3 In Progress (~75%)
- ✅ Bind mount support (virtiofs)
- ✅ Named volumes (VolumeManager)
- ✅ Environment variables + working directory
- ⚪ **MISSING: Container rootfs exposure** (`~/FlyingDutchman/containers/<id>/rootfs/`)

---

## Implementation Path (Code-First, No Build Tests)

### **Sprint 1: Container Filesystem Exposure (6-8 hours)**

**Goal**: Expose running container rootfs at `~/FlyingDutchman/containers/<id>/rootfs/`

**Approach**:
1. Research Containerization framework API for filesystem access
2. Create `ContainerFilesystemManager` actor
3. Wire into `ContainerizationRuntime` lifecycle
4. Add `rootfsPath` to `ContainerSummary` model

**Files to create**:
- `Sources/FlyingDutchmanContainers/ContainerFilesystemManager.swift`

**Files to modify**:
- `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`
- `Sources/Shared/Models/Container.swift`

**Package dependencies**: None (uses existing Containerization framework)

---

### **Sprint 2: Registry Authentication (8-10 hours)**

**Goal**: Docker Hub login, private registry support, token refresh

**Approach**:
1. Create `RegistryAuthManager` actor for OAuth flow
2. Implement Docker Hub token endpoint integration
3. Add Keychain storage for credentials
4. Wire auth headers into `pullImage()`
5. Add `AuthCredential` GRDB model
6. Create CLI `login`/`logout` commands

**Files to create**:
- `Sources/FlyingDutchmanContainers/RegistryAuthManager.swift`
- `Sources/FlyingDutchmanPersistence/Models/AuthCredential.swift`
- `Sources/FlyingDutchmanPersistence/Repositories/AuthCredentialStore.swift`
- `Sources/FlyingDutchmanCLI/Commands/LoginCommand.swift`
- `Sources/FlyingDutchmanCLI/Commands/LogoutCommand.swift`

**Files to modify**:
- `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`
- `Sources/FlyingDutchmanPersistence/Database.swift` (add migration)
- `Sources/FlyingDutchmanCLI/main.swift` (register commands)

**Package dependencies**: None (uses Foundation URLSession + Security framework)

---

### **Sprint 3: Image Filesystem Exposure (4-6 hours)**

**Goal**: Expose image layers at `~/FlyingDutchman/images/<digest>/`

**Approach**:
1. Enhance `ImageFilesystemManager` (currently placeholder)
2. Extract OCI layers to readable directories
3. Create combined overlay view
4. Wire into `pullImage()` post-download

**Files to modify**:
- `Sources/FlyingDutchmanContainers/ImageFilesystemManager.swift`
- `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`

**Package dependencies**: None (tar extraction via Foundation)

---

### **Sprint 4: Integration & Testing (2-3 hours)**

**Goal**: Wire all components, update tracking docs, prepare for build verification

**Tasks**:
1. Update `openspec/phases/phase-1/tasks.md` (check off completed items)
2. Update `openspec/ROADMAP.md` (Phase 1 → 100%)
3. Update `openspec/phases/phase-1/status.md` (mark complete)
4. Create `PHASE1_COMPLETE.md` retrospective
5. Archive `start-phase-1-container-core` change

**No code changes** - documentation only

---

## Sprint 1 Detailed Implementation Plan

### Task 1.1: Research Containerization Framework API

**Investigate**:
- Does `LinuxContainer` expose rootfs mount point?
- Does Containerization provide filesystem access APIs?
- Is virtiofs mount accessible from host?

**Fallback strategy**:
- If no direct API: Use FUSE or mount via VSOCK protocol
- If not possible: Defer to Phase 2 (document as limitation)

**Output**: Decision documented in code comments

---

### Task 1.2: Create ContainerFilesystemManager

**File**: `Sources/FlyingDutchmanContainers/ContainerFilesystemManager.swift`

```swift
import Foundation
import Containerization
import Logging

/// Manages filesystem exposure for running containers
actor ContainerFilesystemManager {
    private let logger = Logger(label: "com.flyingdutchman.filesystem")
    private let baseDirectory: URL
    
    init(baseDirectory: URL) {
        self.baseDirectory = baseDirectory
    }
    
    /// Expose container rootfs at ~/FlyingDutchman/containers/<id>/rootfs/
    func exposeRootfs(containerId: UUID, container: LinuxContainer) async throws -> URL {
        // Implementation will depend on Containerization API research
        // Approach:
        // 1. Get rootfs mount point from container
        // 2. Create symlink or mount at expected location
        // 3. Return URL for UI consumption
    }
    
    /// Unmount/remove rootfs exposure
    func unmountRootfs(containerId: UUID) async throws {
        // Clean up mount or symlink
    }
    
    /// Get rootfs path if exposed
    func getRootfsPath(containerId: UUID) -> URL? {
        // Return path if exists
    }
}
```

**Key decisions to implement**:
- Symlink vs mount vs copy
- Permission handling (containers run as root inside VM)
- Cleanup on container stop

---

### Task 1.3: Wire into ContainerizationRuntime

**File**: `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`

**Modifications**:

1. Add property:
```swift
private let filesystemManager: ContainerFilesystemManager
```

2. Modify `startContainer()`:
```swift
// After container.start() succeeds
if let container = activeContainers[id] {
    let rootfsPath = try await filesystemManager.exposeRootfs(
        containerId: id, 
        container: container
    )
    logger.info("Container rootfs exposed", metadata: [
        "container": .string(id.uuidString),
        "path": .string(rootfsPath.path)
    ])
}
```

3. Modify `stopContainer()`:
```swift
// Before container cleanup
try await filesystemManager.unmountRootfs(containerId: id)
```

---

### Task 1.4: Update Models

**File**: `Sources/Shared/Models/Container.swift`

**Add field to `ContainerSummary`**:
```swift
public struct ContainerSummary: Codable, Sendable {
    // ... existing fields
    
    /// Path to exposed rootfs (nil if not running)
    public let rootfsPath: String?
}
```

**Update initializers and `Codable` conformance**

---

## Sprint 2 Detailed Implementation Plan

### Task 2.1: Create RegistryAuthManager

**File**: `Sources/FlyingDutchmanContainers/RegistryAuthManager.swift`

```swift
import Foundation
import Security
import Logging

/// Manages authentication for OCI registries
actor RegistryAuthManager {
    private let logger = Logger(label: "com.flyingdutchman.registry.auth")
    private let keychainService = "com.flyingdutchman.registry"
    
    // MARK: - Public API
    
    /// Login to registry with username/password
    func login(registry: String, username: String, password: String) async throws {
        // 1. Store credentials in Keychain
        // 2. For Docker Hub, immediately get OAuth token
        // 3. Store token for future pulls
    }
    
    /// Logout from registry
    func logout(registry: String) async throws {
        // Remove from Keychain
    }
    
    /// Get auth token for registry + scope
    func getAuthToken(registry: String, scope: String) async throws -> String? {
        // 1. Check if we have credentials
        // 2. If Docker Hub, use OAuth flow
        // 3. If other registry, use Basic auth
        // 4. Cache token with expiration
    }
    
    /// Refresh expired token
    func refreshToken(registry: String) async throws {
        // Re-authenticate and update cached token
    }
    
    // MARK: - Docker Hub OAuth
    
    private func getDockerHubToken(username: String, password: String, scope: String) async throws -> String {
        // POST https://auth.docker.io/token
        // service=registry.docker.io
        // scope=repository:library/nginx:pull
    }
    
    // MARK: - Keychain Helpers
    
    private func storeInKeychain(registry: String, username: String, password: String) throws {
        // Use Security framework to store securely
    }
    
    private func retrieveFromKeychain(registry: String) throws -> (username: String, password: String)? {
        // Retrieve credentials
    }
    
    private func deleteFromKeychain(registry: String) throws {
        // Remove credentials
    }
}
```

---

### Task 2.2: Add AuthCredential Model

**File**: `Sources/FlyingDutchmanPersistence/Models/AuthCredential.swift`

```swift
import Foundation
import GRDB

/// Represents a stored registry authentication credential
struct AuthCredential: Codable, FetchableRecord, PersistableRecord {
    var id: Int64?
    let registry: String
    let username: String
    let createdAt: Date
    let lastUsedAt: Date?
    
    static let databaseTableName = "auth_credentials"
    
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}
```

---

### Task 2.3: Create AuthCredentialStore

**File**: `Sources/FlyingDutchmanPersistence/Repositories/AuthCredentialStore.swift`

```swift
import Foundation
import GRDB
import Logging

public actor AuthCredentialStore {
    private let dbQueue: DatabaseQueue
    private let logger = Logger(label: "com.flyingdutchman.store.auth")
    
    public init(dbQueue: DatabaseQueue) {
        self.dbQueue = dbQueue
    }
    
    public func save(_ credential: AuthCredential) async throws {
        try await dbQueue.write { db in
            try credential.insert(db)
        }
    }
    
    public func get(registry: String) async throws -> AuthCredential? {
        try await dbQueue.read { db in
            try AuthCredential
                .filter(Column("registry") == registry)
                .fetchOne(db)
        }
    }
    
    public func delete(registry: String) async throws {
        try await dbQueue.write { db in
            try AuthCredential
                .filter(Column("registry") == registry)
                .deleteAll(db)
        }
    }
    
    public func listAll() async throws -> [AuthCredential] {
        try await dbQueue.read { db in
            try AuthCredential.fetchAll(db)
        }
    }
}
```

---

### Task 2.4: Add Database Migration

**File**: `Sources/FlyingDutchmanPersistence/Database.swift`

**Add migration** (find next migration number, likely v11):

```swift
migrator.registerMigration("v11_auth_credentials") { db in
    try db.create(table: "auth_credentials") { t in
        t.autoIncrementedPrimaryKey("id")
        t.column("registry", .text).notNull().unique()
        t.column("username", .text).notNull()
        t.column("created_at", .datetime).notNull()
        t.column("last_used_at", .datetime)
    }
    
    try db.create(index: "idx_auth_credentials_registry", 
                  on: "auth_credentials", 
                  columns: ["registry"])
}
```

---

### Task 2.5: Wire Auth into pullImage

**File**: `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`

**Modifications**:

1. Add property:
```swift
private let authManager: RegistryAuthManager
```

2. Modify `pullImage()`:
```swift
public func pullImage(reference: String) async throws {
    // ... existing parsing code
    
    // NEW: Get auth token if needed
    let authToken = try await authManager.getAuthToken(
        registry: registry,
        scope: "repository:\(repository):pull"
    )
    
    // Fetch manifest with auth
    var request = URLRequest(url: manifestURL)
    if let token = authToken {
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
    
    // ... rest of existing code
}
```

3. Handle 401 responses:
```swift
// If response.statusCode == 401
// Try to refresh token and retry once
if response.statusCode == 401, retryCount == 0 {
    try await authManager.refreshToken(registry: registry)
    return try await pullImage(reference: reference) // Recursive retry
}
```

---

### Task 2.6: Create CLI Login Commands

**File**: `Sources/FlyingDutchmanCLI/Commands/LoginCommand.swift`

```swift
import ArgumentParser
import Foundation

struct LoginCommand: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "login",
        abstract: "Log in to a container registry"
    )
    
    @Argument(help: "Registry to log in to (default: docker.io)")
    var registry: String = "docker.io"
    
    @Option(name: .shortAndLong, help: "Username")
    var username: String?
    
    @Option(name: .shortAndLong, help: "Password")
    var password: String?
    
    func run() async throws {
        // Prompt for credentials if not provided
        let user = username ?? promptForUsername()
        let pass = password ?? promptForPassword()
        
        // Connect to engine and call login
        let client = EngineXPCClient()
        try await client.connect()
        try await client.login(registry: registry, username: user, password: pass)
        
        print("Login Succeeded")
    }
    
    private func promptForUsername() -> String {
        // Read from stdin
    }
    
    private func promptForPassword() -> String {
        // Read securely from stdin (no echo)
    }
}
```

**File**: `Sources/FlyingDutchmanCLI/Commands/LogoutCommand.swift`

```swift
struct LogoutCommand: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "logout",
        abstract: "Log out from a container registry"
    )
    
    @Argument(help: "Registry to log out from")
    var registry: String = "docker.io"
    
    func run() async throws {
        let client = EngineXPCClient()
        try await client.connect()
        try await client.logout(registry: registry)
        
        print("Logout Succeeded")
    }
}
```

---

### Task 2.7: Update CLI Main

**File**: `Sources/FlyingDutchmanCLI/main.swift`

**Add subcommands**:
```swift
@main
struct FlyingDutchmanCLI: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "fd",
        abstract: "Flying Dutchman container management CLI",
        subcommands: [
            VersionCommand.self,
            DoctorCommand.self,
            ContainersCommand.self,
            ImagesCommand.self,
            StacksCommand.self,
            LoginCommand.self,    // NEW
            LogoutCommand.self    // NEW
        ]
    )
}
```

---

## Sprint 3 Detailed Implementation Plan

### Task 3.1: Enhance ImageFilesystemManager

**File**: `Sources/FlyingDutchmanContainers/ImageFilesystemManager.swift`

**Current state**: Placeholder with empty methods

**Implementation needed**:

```swift
import Foundation
import Logging

/// Manages image layer extraction and filesystem exposure
public actor ImageFilesystemManager {
    private let baseDirectory: URL
    private let logger = Logger(label: "com.flyingdutchman.image.filesystem")
    
    public init(baseDirectory: URL) {
        self.baseDirectory = baseDirectory
        createDirectoryStructure()
    }
    
    /// Extract image layers to filesystem
    public func extractImage(digest: String, layers: [URL]) async throws {
        let imageDir = baseDirectory.appendingPathComponent(digest)
        try FileManager.default.createDirectory(at: imageDir, withIntermediateDirectories: true)
        
        // Extract each layer (tar.gz files)
        for (index, layerPath) in layers.enumerated() {
            let layerDir = imageDir.appendingPathComponent("layer-\(index)")
            try await extractTarGz(from: layerPath, to: layerDir)
        }
        
        // Create overlay view (combined filesystem)
        try await createOverlayView(digest: digest, layerCount: layers.count)
    }
    
    private func extractTarGz(from source: URL, to destination: URL) async throws {
        // Use Process to run `tar xzf` or implement in Swift
        // For Phase 1, shell out is acceptable
    }
    
    private func createOverlayView(digest: String, layerCount: Int) async throws {
        // Create combined view of all layers
        // Can be symlinks or read-only directory
    }
    
    public func getImagePath(digest: String) -> URL {
        baseDirectory.appendingPathComponent(digest)
    }
    
    public func cleanupImage(digest: String) async throws {
        let imageDir = baseDirectory.appendingPathComponent(digest)
        try FileManager.default.removeItem(at: imageDir)
    }
}
```

---

## Implementation Order

### Today (Session 1: 2-3 hours)
1. ✅ Document this plan
2. ✅ Start Sprint 1, Task 1.1: Research Containerization API
3. ✅ Create ContainerFilesystemManager skeleton
4. ✅ Wire basic structure into ContainerizationRuntime

### Today (Session 2: 2-3 hours)
5. ✅ Complete Sprint 1 (filesystem exposure)
6. ✅ Update models (ContainerSummary)

### Tomorrow (Session 3: 3-4 hours)
7. Start Sprint 2: Create RegistryAuthManager
8. Add AuthCredential model + store
9. Add database migration

### Tomorrow (Session 4: 3-4 hours)
10. Wire auth into pullImage
11. Create CLI login/logout commands
12. Complete Sprint 2

### Day 3 (Session 5: 2-3 hours)
13. Sprint 3: Enhance ImageFilesystemManager
14. Wire into pullImage

### Day 3 (Session 6: 1-2 hours)
15. Sprint 4: Update all tracking docs
16. Create retrospective
17. **THEN: Run first build test**

---

## Success Criteria (Code Complete)

Before running any builds:
- [ ] ContainerFilesystemManager fully implemented
- [ ] RegistryAuthManager fully implemented
- [ ] AuthCredential model + store + migration added
- [ ] Auth wired into pullImage with retry logic
- [ ] CLI login/logout commands created
- [ ] ImageFilesystemManager extraction implemented
- [ ] All tracking docs updated

After code complete:
- [ ] `swift build` succeeds for all targets
- [ ] `swift test` passes (or document known failures)
- [ ] Manual smoke test: login → pull private image → verify
- [ ] Archive Phase 1 change

---

## Notes

- **No builds during implementation** - focus on clean, compilable code
- **Defer Keychain complexity** - can use placeholder initially, implement fully in polish pass
- **Document assumptions** - if Containerization API doesn't support something, document workaround
- **Git commits after each sprint** - makes rollback easier if needed

---

**Let's start coding!** 🚀
