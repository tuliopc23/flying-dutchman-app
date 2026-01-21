# Database Architecture Decision: SQLiteData (Point-Free)

**Date**: 2026-01-10  
**Decision**: Use **Point-Free's SQLiteData** instead of SwiftData  
**Status**: Approved

---

## Executive Summary

Flying Dutchman will use **SQLiteData** (built on GRDB) for **all persistence** needs:
- ✅ **Engine/Daemon**: SQLiteData for container metadata, logs, events
- ✅ **UI/App**: @Observable + SQLiteData property wrappers (@FetchAll, @FetchOne)
- ❌ **NO SwiftData** - Explicitly rejected

---

## Why SQLiteData Over SwiftData?

### Performance
```
SQLite C API:        7.183ms
SQLiteData:          8.511ms  (1.2x slower than C)
GRDB (manual):      18.819ms  (2.6x slower)
GRDB (Codable):     53.326ms  (7.4x slower)
SwiftData:          [No public benchmarks, likely slower]
```

**SQLiteData is ~6x faster than GRDB's Codable** and close to raw SQLite performance.

---

### Type Safety & Queries

| Feature | SQLiteData | SwiftData |
|---------|-----------|-----------|
| **Data models** | `@Table struct` (value type) | `@Model class` (reference type) |
| **Queries** | Type-safe SQL at compile-time | `#Predicate` macro (runtime) |
| **Aggregates** | `@FetchOne(Item.count())` | ❌ Load all & count |
| **Joins** | ✅ Full SQL joins | ❌ Limited |
| **Dynamic queries** | ✅ `.load()` method | ⚠️ Difficult |
| **UIKit support** | ✅ Full | ❌ SwiftUI only |
| **Observable models** | ✅ `@Perceptible` | ✅ `@Observable` |

---

### CloudKit Sync

| Feature | SQLiteData | SwiftData |
|---------|-----------|-----------|
| **Sync** | ✅ Built-in `SyncEngine` | ✅ Built-in |
| **Sharing** | ✅ iCloud sharing support | ✅ Built-in |
| **Control** | ✅ Explicit sync API | ⚠️ Opaque/automatic |
| **Debugging** | ✅ SQL queries visible | ❌ Black box |

---

### Developer Experience

**SQLiteData Advantages**:
- ✅ **Value types** (structs, enums) instead of classes
- ✅ **Explicit IDs** (no hidden magic)
- ✅ **Compiler-generated initializers** (no boilerplate)
- ✅ **Direct SQL access** when needed (#sql macro)
- ✅ **Property wrappers work everywhere** (SwiftUI, UIKit, @Observable)
- ✅ **Built on GRDB** (battle-tested, widely adopted)
- ✅ **Excellent documentation** + demo apps

**SwiftData Disadvantages**:
- ❌ **Reference types** (classes only, retain cycles possible)
- ❌ **Implicit IDs** (hidden `PersistentModel` magic)
- ❌ **Manual initializers** (boilerplate)
- ❌ **No direct SQL** (opaque query layer)
- ❌ **@Query only works in SwiftUI views**
- ❌ **Immature** (iOS 17+, bugs, breaking changes)
- ❌ **Poor docs** (WWDC videos, no comprehensive guide)

---

## SQLiteData vs Current GRDB Setup

### Current Architecture (GRDB)
```swift
// Database setup
let dbQueue = try DatabaseQueue(path: "flyingdutchman.sqlite")

// Repository pattern (actors)
public actor ContainerStore {
    func fetchAll() async -> [ContainerSummary] {
        try await dbQueue.read { db in
            try ContainerSummary.fetchAll(db)
        }
    }
}

// UI (manual refresh)
@Observable
final class ContainerListViewModel {
    var containers: [ContainerSummary] = []
    
    func load() async {
        containers = try await EngineClient.listContainers()
    }
}
```

### With SQLiteData
```swift
// Database setup (same GRDB foundation)
prepareDependencies {
    $0.defaultDatabase = try! DatabaseQueue(path: "flyingdutchman.sqlite")
}

// Models (value types!)
@Table
struct ContainerSummary: Identifiable {
    let id: UUID
    var name: String
    var status: Status
    // Compiler-generated init, no boilerplate!
}

// UI (automatic observation!)
@Observable
final class ContainerListViewModel {
    @FetchAll var containers: [ContainerSummary]
    // No manual load() needed - auto-updates on DB changes!
    
    // Dynamic filtering
    func filterRunning() {
        containers.load(ContainerSummary.where { $0.status == .running })
    }
}

// Also works in SwiftUI views directly
struct ContainerListView: View {
    @FetchAll var containers: [ContainerSummary]
    
    var body: some View {
        List(containers) { container in
            Text(container.name)
        }
    }
}
```

---

## Migration Analysis: GRDB → SQLiteData

### Option 1: **Keep GRDB for Engine, Add SQLiteData for UI** ⭐ RECOMMENDED

**Approach**: Incremental adoption

**Engine (No changes)**:
- ✅ Keep existing GRDB repositories (ContainerStore, ImageStore, etc.)
- ✅ Keep existing migrations (v1-v7)
- ✅ Keep existing DatabaseQueue setup
- ✅ No breaking changes to Engine/daemon persistence

**UI (Add SQLiteData)**:
- 🆕 Add SQLiteData dependency
- 🆕 Use `@FetchAll`/`@FetchOne` property wrappers in ViewModels
- 🆕 Add `@Table` macro to models for UI queries
- ✅ UI gets automatic database observation
- ✅ No manual `load()` calls needed
- ✅ No HTTP polling, direct GRDB access

**Migration effort**: **Low** (1-2 days)
- Add SQLiteData to Package.swift
- Apply `@Table` macro to existing models
- Replace manual `load()` with `@FetchAll`
- Test automatic updates

---

### Option 2: **Full Migration to SQLiteData**

**Approach**: Replace all GRDB code with SQLiteData

**Changes**:
- ✅ Keep GRDB foundation (SQLiteData uses GRDB under the hood)
- ✅ Replace Repository actors with SQLiteData queries
- ✅ Use `@Table` for all models
- ✅ Use `@FetchAll`/`@FetchOne` everywhere (Engine + UI)
- ✅ Keep existing migrations (GRDB migrations work with SQLiteData)

**Migration effort**: **Medium** (3-5 days)
- Apply `@Table` to all models
- Replace Repository pattern with direct SQLiteData queries
- Update Engine code to use SQLiteData insertion APIs
- Test thoroughly

**Benefit**: Unified architecture, simpler codebase

---

## Decision: Option 1 (Incremental)

### Rationale

1. **Current GRDB setup works perfectly** for Engine persistence
2. **No need to rewrite working code** (Engine repositories are solid)
3. **SQLiteData adds value where we need it**: UI automatic observation
4. **Low risk**: Add SQLiteData on top, no breaking changes
5. **Best of both worlds**: Keep proven Engine code, enhance UI

---

## Implementation Plan

### Phase 1: Add SQLiteData Dependency (30 min)

**File**: `Package.swift`

```swift
dependencies: [
    // ... existing
    .package(url: "https://github.com/pointfreeco/sqlite-data.git", from: "1.0.0"),
]

targets: [
    .target(
        name: "FlyingDutchmanApp",
        dependencies: [
            // ... existing
            .product(name: "SQLiteData", package: "sqlite-data"),
        ]
    ),
]
```

---

### Phase 2: Apply @Table to Models (1 hour)

**File**: `Sources/Shared/Models/Container.swift`

```swift
import SQLiteData

@Table
public struct ContainerSummary: Codable, Identifiable, Hashable, Sendable {
    public let id: UUID
    public var name: String
    public var image: String
    public var status: Status
    public var ports: [String]
    public var createdAt: Date
    public var rootfsPath: String?
    
    // @Table generates fetchAll, where, order, etc.
}
```

**Apply to all models**:
- ✅ ContainerSummary
- ✅ ImageSummary
- ✅ VolumeSummary
- ✅ NetworkSummary
- ✅ StackSummary

---

### Phase 3: Update App Entry Point (15 min)

**File**: `Sources/FlyingDutchmanApp/FlyingDutchmanAppMain.swift`

```swift
import SQLiteData

@main
struct FlyingDutchmanApp: App {
    init() {
        prepareDependencies {
            // Use existing GRDB DatabaseQueue
            $0.defaultDatabase = DatabaseContainer.shared.dbQueue
        }
    }
    
    var body: some Scene {
        // ... existing
    }
}
```

---

### Phase 4: Replace Manual Load with @FetchAll (2 hours)

**File**: `Sources/FlyingDutchmanApp/Content/ContainerListView.swift`

**Before**:
```swift
@Observable
final class ContainerListViewModel {
    var containers: [ContainerSummary] = []
    
    func load() async {
        containers = try await EngineClient.listContainers()
    }
}
```

**After**:
```swift
@Observable
final class ContainerListViewModel {
    @FetchAll var containers: [ContainerSummary]
    // Auto-updates when database changes!
    
    var searchQuery: String = ""
    
    // Dynamic query
    @FetchAll(ContainerSummary.self) var filtered: [ContainerSummary]
    
    func updateFilter() {
        if searchQuery.isEmpty {
            filtered.load(ContainerSummary.self)
        } else {
            filtered.load(
                ContainerSummary.where { 
                    $0.name.contains(searchQuery, caseInsensitive: true) 
                }
            )
        }
    }
}
```

**Apply to all ViewModels**:
- ✅ ContainerListViewModel
- ✅ ImageListViewModel
- ✅ VolumeListViewModel
- ✅ NetworkListViewModel
- ✅ StacksViewModel

---

### Phase 5: Remove Manual Refresh (30 min)

**Before**:
```swift
// In AppState.bootstrap()
await withTaskGroup(of: Void.self) { group in
    group.addTask { await self.containers.load() }
    group.addTask { await self.images.load() }
    // ...
}
```

**After**:
```swift
// In AppState.bootstrap()
// No manual loading needed! @FetchAll auto-loads.
// Just wait for initial fetch to complete
await containers.$containers.wait()
await images.$images.wait()
```

---

## Benefits of This Approach

### For Engine
- ✅ **Zero changes** to working GRDB code
- ✅ **Zero risk** of breaking daemon persistence
- ✅ **Keep proven** repository pattern

### For UI
- ✅ **Automatic database observation** (no manual refresh)
- ✅ **Type-safe queries** (compile-time validation)
- ✅ **Less boilerplate** (no manual load() methods)
- ✅ **Better performance** (6x faster decoding)
- ✅ **Works in ViewModels** (not just SwiftUI views)

### For Future
- ✅ **CloudKit sync ready** (add SyncEngine when needed)
- ✅ **Easy to extend** (full SQL access via #sql macro)
- ✅ **Battle-tested** (GRDB foundation, 1.2k stars)

---

## Updated Dependency List

**File**: `openspec/dependencies.md`

### Persistence (Updated)

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [groue/GRDB.swift](https://github.com/groue/GRDB.swift) | 7.8.0+ | SQLite database foundation | FlyingDutchmanPersistence | ✅ |
| [pointfreeco/sqlite-data](https://github.com/pointfreeco/sqlite-data) | 1.0.0+ | Reactive SQLite queries for UI | FlyingDutchmanApp | ✅ Selected |

**Rationale**: SQLiteData is built on GRDB and provides:
- Reactive property wrappers (@FetchAll, @FetchOne)
- Type-safe, compile-time validated queries
- 6x faster decoding than GRDB's Codable
- CloudKit sync support (future)
- **No SwiftData** - Explicitly rejected for immaturity, poor performance, and reference-type requirements

**SwiftData**: ❌ **Rejected** - Not used anywhere in codebase. Use SQLiteData instead.

---

## Documentation Updates Needed

1. ✅ Update `DATABASE_STATE_AUDIT.md` - Remove SwiftData mentions
2. ✅ Update `openspec/dependencies.md` - Add SQLiteData, remove SwiftData
3. ✅ Update `openspec/ROADMAP.md` - Remove SwiftData evaluation
4. ✅ Update `openspec/project.md` - Change "SwiftData target" to "SQLiteData"
5. ✅ Update all specs - Replace SwiftData references with SQLiteData

---

## Timeline

| Phase | Duration | Effort |
|-------|----------|--------|
| 1. Add SQLiteData dependency | 30 min | Trivial |
| 2. Apply @Table to models | 1 hour | Low |
| 3. Update app entry point | 15 min | Trivial |
| 4. Replace manual load with @FetchAll | 2 hours | Medium |
| 5. Remove manual refresh | 30 min | Low |
| **Total** | **4-5 hours** | **Low-Medium** |

**Can be done in Phase 2 or Phase 3** (not blocking Phase 2 networking)

---

## Next Steps

1. ⏭️ **Continue Phase 2 (Networking)** with current GRDB setup
2. ⏭️ **Phase 2 or 3**: Migrate UI to SQLiteData (4-5 hour task)
3. ⏭️ **Phase 4**: Add CloudKit sync via SQLiteData.SyncEngine (when needed)

---

## Conclusion

**Decision**: Use **SQLiteData** (not SwiftData)

**Approach**: Incremental adoption
- Keep GRDB for Engine (working perfectly)
- Add SQLiteData for UI (automatic observation)
- Low risk, high value

**Status**: ✅ **Approved for implementation in Phase 2 or 3**

---

**All SwiftData references will be removed from documentation.** ✅
