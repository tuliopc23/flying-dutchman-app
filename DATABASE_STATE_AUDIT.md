# Flying Dutchman - Database & State Management Audit

**Date**: 2026-01-10  
**Purpose**: Complete overview of persistence, state management, and UI data flow

---

## 📊 Database Setup (GRDB)

### Overview
- **Database**: SQLite via GRDB
- **Location**: `~/Library/Application Support/flyingdutchman/flyingdutchman.sqlite`
- **Fallback**: In-memory database if file access fails
- **Migrations**: 7 migrations (v1-v7)

### Why GRDB?
- ✅ Excellent Swift concurrency support (async/await)
- ✅ Type-safe SQL
- ✅ Battle-tested migration system
- ✅ High-volume log storage with indexing
- ✅ Industry trend: Podman migrating FROM BoltDB TO SQLite

### Why NOT SwiftData?
- ❌ Not designed for server-like workloads
- ❌ Poor performance for high-volume event/log data
- ❌ Limited query flexibility vs raw SQL
- **Decision**: Keep GRDB for Engine/daemon persistence

---

## 🗄️ Database Schema

### Tables (7 total)

#### 1. **containers** (v1)
```sql
CREATE TABLE containers (
    id TEXT PRIMARY KEY,              -- UUID
    name TEXT NOT NULL,               -- Container name
    image TEXT NOT NULL,              -- Image reference
    status TEXT NOT NULL,             -- ContainerSummary.Status
    ports TEXT NOT NULL,              -- JSON array of port strings
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL
)
```
**Purpose**: Container metadata  
**Store**: `ContainerStore`

---

#### 2. **images** (v1)
```sql
CREATE TABLE images (
    id TEXT PRIMARY KEY,              -- UUID
    name TEXT NOT NULL,               -- Image name
    tag TEXT NOT NULL,                -- Image tag
    digest TEXT,                      -- SHA256 digest
    sizeBytes INTEGER,
    createdAt DATETIME NOT NULL
)
```
**Purpose**: Image metadata  
**Store**: `ImageStore`

---

#### 3. **stacks** (v1)
```sql
CREATE TABLE stacks (
    id TEXT PRIMARY KEY,              -- UUID
    name TEXT NOT NULL,               -- Stack name
    description TEXT,
    createdAt DATETIME NOT NULL,
    containerNames TEXT NOT NULL DEFAULT '[]'  -- JSON array
)
```
**Purpose**: Compose project metadata  
**Store**: `StackStore`

---

#### 4. **containerStacks** (v1)
```sql
CREATE TABLE containerStacks (
    containerId TEXT NOT NULL REFERENCES containers ON DELETE CASCADE,
    stackId TEXT NOT NULL REFERENCES stacks ON DELETE CASCADE,
    PRIMARY KEY (containerId, stackId)
)
```
**Purpose**: Many-to-many relationship between containers and stacks

---

#### 5. **volumes** (v3)
```sql
CREATE TABLE volumes (
    id TEXT PRIMARY KEY,              -- UUID
    name TEXT NOT NULL,               -- Volume name
    mountPath TEXT NOT NULL,          -- Host path
    sizeBytes INTEGER,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL
)
```
**Purpose**: Named volume metadata  
**Store**: `VolumeStore`

---

#### 6. **networks** (v3)
```sql
CREATE TABLE networks (
    id TEXT PRIMARY KEY,              -- UUID
    name TEXT NOT NULL,               -- Network name
    subnet TEXT,                      -- CIDR (e.g., "172.20.0.0/16")
    connectedContainerIDs TEXT NOT NULL DEFAULT '[]',  -- JSON array
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL
)
```
**Purpose**: Bridge network metadata  
**Store**: `NetworkStore`

---

#### 7. **containerLogs** (v4)
```sql
CREATE TABLE containerLogs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    containerId TEXT NOT NULL,        -- UUID
    line TEXT NOT NULL,               -- Log line
    createdAt DATETIME NOT NULL,
    INDEX idx_containerId (containerId)
)
```
**Purpose**: Historical container logs  
**Store**: `ContainerLogStore`  
**Features**: Automatic rotation (max 500 lines per container)

---

#### 8. **shimEvents** (v5)
```sql
CREATE TABLE shimEvents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    status TEXT NOT NULL,             -- Event status
    containerId TEXT,                 -- Optional container ID
    image TEXT,                       -- Optional image
    kind TEXT NOT NULL,               -- Event kind
    timestamp DATETIME NOT NULL
)
```
**Purpose**: Docker API shim events (legacy compatibility)  
**Store**: `ShimEventStore`

---

#### 9. **containerEvents** (v6)
```sql
CREATE TABLE containerEvents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    eventId TEXT NOT NULL UNIQUE,    -- UUID
    containerId TEXT NOT NULL,        -- UUID
    eventType TEXT NOT NULL,          -- "stateChanged", "logOutput", "resourceUpdate"
    eventData BLOB NOT NULL,          -- JSON-encoded event details
    timestamp DATETIME NOT NULL,
    INDEX idx_containerId (containerId),
    INDEX idx_timestamp (timestamp)
)
```
**Purpose**: Runtime events for replay and debugging  
**Store**: `ContainerEventStore`

---

#### 10. **blobMetadata** (v7)
```sql
CREATE TABLE blobMetadata (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    digest TEXT NOT NULL UNIQUE,     -- SHA256 digest
    size INTEGER NOT NULL,            -- Blob size in bytes
    lastAccessed DATETIME NOT NULL,
    INDEX idx_lastAccessed (lastAccessed)
)
```
**Purpose**: Image layer cache metadata for LRU eviction  
**Store**: `ImageCacheManager`

---

## 🏪 Repository Pattern (Actor-Based)

All stores are **actors** for Swift 6 concurrency safety.

### Example: ContainerStore

```swift
public actor ContainerStore {
    private let dbQueue: DatabaseQueue
    
    public init(dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue)
    
    // CRUD operations
    public func insert(_ container: ContainerSummary) async throws
    public func fetch(id: UUID) async throws -> ContainerSummary?
    public func fetchAll() async -> [ContainerSummary]
    public func update(_ container: ContainerSummary) async throws
    public func delete(id: UUID) async throws
}
```

**Key Pattern**:
- ✅ Each store is an actor (no data races)
- ✅ Async/await for all database operations
- ✅ Type-safe via GRDB's `FetchableRecord` and `PersistableRecord`
- ✅ Automatic JSON encoding for arrays (ports, containerNames, etc.)

---

## 🎨 SwiftUI State Management

### Architecture: **Observable + ViewModels**

Flying Dutchman uses **two-tier state management**:

1. **App-level state** - `AppState` (Observable)
2. **Feature-level ViewModels** - One per screen

---

## 🌐 App-Level State (`AppState`)

**File**: `Sources/FlyingDutchmanApp/State/AppState.swift`

### Responsibilities
- Navigation (sidebar selection, navigation path)
- Engine health status
- Global UI state (command palette, appearance)
- Lazy-loaded feature ViewModels

### Key Properties

```swift
@MainActor
@Observable
public final class AppState {
    // Navigation
    public var selectedSection: AppSection = .containers
    public var navigationPath = NavigationPath()
    public var showPalette: Bool = false
    
    // Engine health
    public var engineStatus: String = "Connecting..."
    public var isEngineHealthy: Bool = false
    
    // Feature ViewModels (lazy)
    public let containers = ContainerListViewModel()
    public let images = ImageListViewModel()
    public let volumes = VolumeListViewModel()
    public let networks = NetworkListViewModel()
    public let events = EventsViewModel()
    public let logs = LogsViewModel()
    public let stacks = StacksViewModel()
    public let sidebar = SidebarViewModel()
}
```

### Lifecycle

```swift
// On app launch
let appState = AppState()

// Bootstrap all systems in parallel
await appState.bootstrap()
```

**Bootstrap Steps**:
1. Refresh engine status (HTTP + XPC health checks)
2. Load all feature data in parallel (Task groups)
3. Start event streaming (SSE from Engine)

---

## 📱 Feature-Level ViewModels

### Pattern: **@Observable + @MainActor**

Each feature (Containers, Images, etc.) has its own ViewModel.

### Example: ContainerListViewModel

**File**: `Sources/FlyingDutchmanApp/Content/ContainerListView.swift`

```swift
@MainActor
@Observable
final class ContainerListViewModel {
    // Data
    var containers: [ContainerSummary] = []
    var error: String?
    var isLoading: Bool = false
    
    // UI state
    var searchQuery: String = ""
    var showRunningOnly: Bool = false
    
    // Computed
    var filtered: [ContainerSummary] { /* filter logic */ }
    
    // Actions
    func load() async { /* fetch from EngineClient */ }
    func start(_ container: ContainerSummary) async
    func stop(_ container: ContainerSummary) async
    func restart(_ container: ContainerSummary) async
}
```

### Key Patterns

1. **@MainActor** - All UI updates on main thread
2. **@Observable** - SwiftUI automatically tracks changes
3. **async/await** - Network calls don't block UI
4. **Computed properties** - Reactive filtering/sorting

---

## 🔄 Data Flow

### 1. App Launch → Bootstrap

```
App Launch
    ↓
AppState.init()
    ↓
AppState.bootstrap()
    ↓
┌─────────────────────────────────┐
│ Parallel Task Group             │
│ - refreshEngineStatus()         │
│ - containers.load()             │
│ - images.load()                 │
│ - volumes.load()                │
│ - networks.load()               │
│ - stacks.load()                 │
└─────────────────────────────────┘
    ↓
UI renders with data
```

---

### 2. User Action → State Update

```
User taps "Start Container"
    ↓
ContainerRow calls viewModel.start(container)
    ↓
viewModel.mutate(container, action: EngineClient.startContainer)
    ↓
HTTP POST to Engine /containers/{id}/start
    ↓
Engine updates GRDB
    ↓
Engine returns updated ContainerSummary
    ↓
viewModel updates containers array
    ↓
SwiftUI re-renders (automatic via @Observable)
```

---

### 3. Real-Time Updates (SSE)

```
Engine emits ContainerEvent (state changed)
    ↓
EventsViewModel streams from /runtime-events (SSE)
    ↓
EventsViewModel.events array updated
    ↓
EventsView re-renders
    ↓
(Optional) Trigger refresh of ContainerListViewModel
```

---

## 🔀 Data Sources

### Engine (Daemon) Persistence
- **Technology**: GRDB (SQLite)
- **Location**: `~/Library/Application Support/flyingdutchman/flyingdutchman.sqlite`
- **Stores**: Container, Image, Volume, Network, Stack, Logs, Events, BlobMetadata
- **Access**: Via Repository actors (ContainerStore, ImageStore, etc.)

### App (UI) State
- **Technology**: SwiftUI @Observable (Observation framework)
- **Location**: In-memory only
- **Persistence**: None (state reloads on launch)
- **Scope**: Navigation, UI preferences, loaded data

### Communication: App ↔ Engine
- **Protocol**: HTTP REST + SSE (Server-Sent Events)
- **Client**: `EngineClient` (static methods)
- **Endpoints**:
  - `GET /containers` → List containers
  - `POST /containers/{id}/start` → Start container
  - `GET /runtime-events` → SSE stream of events

---

## 🎯 Why This Architecture?

### GRDB for Engine
- ✅ **High-volume logs**: SQLite excels at append-only logs
- ✅ **Structured queries**: Easy to filter/paginate
- ✅ **Atomic writes**: ACID guarantees for state changes
- ✅ **No dependencies**: Embedded, no server
- ✅ **Battle-tested**: Used by Podman, many others

### @Observable for UI
- ✅ **Zero boilerplate**: No manual property wrappers
- ✅ **Fine-grained updates**: SwiftUI only re-renders changed views
- ✅ **Type-safe**: Compiler-checked property access
- ✅ **Modern**: Swift 5.9+ Observation framework

### HTTP/SSE for Communication
- ✅ **Debuggable**: Can test with `curl`
- ✅ **Cross-platform ready**: Works remotely if needed
- ✅ **Standard**: REST + SSE are well-understood
- ✅ **Consistent**: Same protocol for CLI, App, and future tools

---

## 📦 What Data Lives Where?

| Data Type | Storage | Scope | Lifetime |
|-----------|---------|-------|----------|
| Container metadata | GRDB (Engine) | Global | Persistent |
| Image metadata | GRDB (Engine) | Global | Persistent |
| Volume metadata | GRDB (Engine) | Global | Persistent |
| Network metadata | GRDB (Engine) | Global | Persistent |
| Container logs | GRDB (Engine) | Per-container | Persistent (rotated) |
| Container events | GRDB (Engine) | Per-container | Persistent |
| Blob cache metadata | GRDB (Engine) | Per-layer | Persistent |
| | | | |
| Selected section | @Observable (App) | UI | Session-only |
| Search query | @Observable (ViewModel) | UI | Session-only |
| Loaded containers | @Observable (ViewModel) | UI | Session-only (refetch on launch) |
| Command palette visible | @Observable (App) | UI | Session-only |

---

## 🚨 Important Design Decisions

### Decision 1: No SwiftData in UI
**Why?**
- App state is **ephemeral** (reload from Engine on launch)
- No need for local persistence
- @Observable is simpler for transient state

**When to consider SwiftData?**
- If we add "offline mode" (cache Engine data locally)
- If we add "user preferences" (saved searches, favorites)
- Phase 4 (UX Polish) - reconsider for UI-specific persistence

---

### Decision 2: ViewModels Own Data Loading
**Why?**
- Each screen controls its own loading/error states
- Parallel loading in `AppState.bootstrap()`
- Easy to test (mock `EngineClient`)

**Alternative rejected**: Centralized data service
- Would create bottleneck
- Harder to isolate feature state

---

### Decision 3: HTTP Client is Static
**Why?**
- No need for DI in simple CRUD client
- Easy to call from anywhere
- Configuration via static properties

**Alternative considered**: Actor-based client with DI
- Over-engineering for Phase 1
- Can refactor later if needed

---

## 🔮 Future Considerations

### Phase 2+: SwiftData for UI Preferences
```swift
@Model
class UserPreferences {
    var favoriteContainers: [UUID]
    var savedSearches: [String]
    var preferredTheme: String
}
```

### Phase 3: Offline Mode
- Cache Engine data in SwiftData
- Show stale data when Engine unreachable
- Sync when Engine reconnects

### Phase 4: Cross-Device Sync
- iCloud sync for preferences
- SwiftData + CloudKit integration

---

## 📊 Summary Table

| Layer | Technology | Purpose | Lifetime |
|-------|-----------|---------|----------|
| **Engine Persistence** | GRDB | Container/image/volume metadata, logs, events | Persistent |
| **App State** | @Observable | Navigation, engine health, UI preferences | Session |
| **Feature State** | @Observable | Loaded data, search queries, loading states | Session |
| **Communication** | HTTP + SSE | App ↔ Engine data sync | Real-time |

---

## ✅ Checklist: Is Your Setup Correct?

- [x] GRDB used for **Engine** persistence (correct for high-volume logs)
- [x] @Observable used for **App/UI** state (correct for transient data)
- [x] No SwiftData in Phase 1 (correct, deferred to Phase 4 for preferences)
- [x] Actor-based stores (correct for Swift 6 concurrency)
- [x] HTTP REST for App ↔ Engine (correct for debuggability)
- [x] SSE for real-time events (correct for live updates)

**Status**: ✅ **Your architecture is correct and well-designed!**

---

## 🎓 Key Takeaways

1. **GRDB for daemon** = Correct choice for high-volume, persistent data
2. **@Observable for UI** = Modern, zero-boilerplate state management
3. **No local persistence in UI** = Intentional, reload from Engine on launch
4. **HTTP + SSE** = Standard, debuggable communication protocol
5. **Actor-based stores** = Safe concurrency for Swift 6

Your setup follows best practices and is architected correctly for a daemon + UI application! 🎉
