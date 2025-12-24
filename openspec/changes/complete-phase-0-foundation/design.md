## Context

Phase 0 establishes core infrastructure for Flying Dutchman. The ContainerizationRuntime was initially implemented with placeholder code due to evolving Apple Containerization framework APIs. This design documents the correct approach based on the actual framework source.

## Goals / Non-Goals

**Goals:**
- Complete ContainerizationRuntime using correct Apple APIs
- Establish structured logging across all modules
- Create unified error handling with user-friendly messages
- Enable Phase 1 (Container Core) to begin

**Non-Goals:**
- Full OCI compliance (Phase 1)
- Networking features (Phase 2)
- UI polish (Phase 4)

## Decisions

### Decision 1: Use ContainerManager instead of direct VM creation

**What:** Use `ContainerManager` from apple/containerization for container lifecycle management.

**Why:** 
- ContainerManager handles image management, networking setup, and VM instance creation
- Abstracts away `Virtualization.framework` complexity
- Provides proper guest agent (`vminitd`) integration for VSOCK communication

**Alternatives considered:**
- Direct `VZVirtualMachineConfiguration` usage - rejected as too low-level
- Custom VM management - rejected as duplicates framework functionality

**Implementation:**
```swift
import Containerization
import ContainerizationExtras

actor ContainerizationRuntime: ContainerRuntimeProtocol {
    private var manager: ContainerManager?
    private var activeContainers: [UUID: LinuxContainer] = [:]
    
    private func ensureManager() async throws -> ContainerManager {
        if let manager = self.manager { return manager }
        
        let kernel = try Kernel(
            path: kernelPath.url,
            platform: .linuxArm
        )
        
        let manager = try await ContainerManager(
            kernel: kernel,
            initfsReference: "ghcr.io/apple/containerization/vminit:0.13.0"
        )
        
        self.manager = manager
        return manager
    }
}
```

### Decision 2: LinuxContainer.Configuration for resource limits

**What:** Use `LinuxContainer.Configuration` closure for CPU/memory settings.

**Why:**
- Proper type-safe configuration
- Automatic translation to OCI LinuxResources (cgroups)
- Framework handles Virtualization.framework mapping

**Implementation:**
```swift
func createContainer(name: String, image: String, config: ContainerConfig) async throws -> ContainerSummary {
    let manager = try await ensureManager()
    
    let container = try await manager.create(name, reference: image) { cfg in
        // CPU: millicores -> cores (round up)
        if let cpuLimit = config.cpuLimit {
            cfg.cpus = max(1, (cpuLimit + 999) / 1000)
        } else {
            cfg.cpus = 2
        }
        
        // Memory: bytes -> use helper
        if let memLimit = config.memoryLimit {
            cfg.memoryInBytes = UInt64(memLimit)
        } else {
            cfg.memoryInBytes = 512.mib()
        }
        
        // Process arguments if specified
        if let cmd = config.command {
            cfg.process.arguments = cmd
        }
    }
    
    // Store for lifecycle management
    let id = UUID()
    activeContainers[id] = container
    
    // ... persist to GRDB
}
```

### Decision 3: Two-phase container start

**What:** Container start requires `container.create()` then `container.start()`.

**Why:**
- `create()` boots the VM and starts the guest agent (vminitd)
- `start()` launches the container's main process
- Matches OCI runtime lifecycle model

**Implementation:**
```swift
func startContainer(id: UUID) async throws -> ContainerSummary {
    guard let container = activeContainers[id] else {
        throw ContainerError.notFound(id)
    }
    
    // Phase 1: Boot VM and guest agent
    try await container.create()
    
    // Phase 2: Start container process
    try await container.start()
    
    // Update status
    // ...
}
```

### Decision 4: Structured logging with swift-log

**What:** Use swift-log with custom `FileLogHandler` for persistence.

**Why:**
- Apple's recommended logging approach
- Supports structured metadata
- Async-safe

**Implementation:**
```swift
// In Shared/LoggingConfiguration.swift
import Logging

public struct LoggingConfiguration {
    public static func bootstrap() {
        LoggingSystem.bootstrap { label in
            MultiplexLogHandler([
                StreamLogHandler.standardOutput(label: label),
                FileLogHandler(label: label, logDirectory: Self.logDirectory)
            ])
        }
    }
    
    private static var logDirectory: URL {
        FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
            .appendingPathComponent("Logs")
            .appendingPathComponent("FlyingDutchman")
    }
}
```

### Decision 5: Protocol-based unified errors

**What:** Create `FlyingDutchmanError` protocol for all domain errors.

**Why:**
- Consistent error handling across modules
- Enables UI to display user-friendly messages
- Supports error recovery patterns

**Implementation:**
```swift
// In Shared/Errors/FlyingDutchmanError.swift
public protocol FlyingDutchmanError: LocalizedError, Sendable {
    var userMessage: String { get }
    var technicalMessage: String { get }
    var isRecoverable: Bool { get }
    var suggestedAction: String? { get }
}

extension FlyingDutchmanError {
    public var errorDescription: String? { userMessage }
    public var isRecoverable: Bool { false }
    public var suggestedAction: String? { nil }
}
```

## Risks / Trade-offs

| Risk | Impact | Mitigation |
|------|--------|------------|
| Apple Containerization API changes | High - breaks runtime | Pin to specific framework version (0.1.0) |
| Kernel compatibility | Medium - VMs fail to boot | Validate kernel on startup, provide download option |
| macOS 26 requirement | High - limits testing | Use StubContainerRuntime for CI, require macOS 26 for integration tests |

## Migration Plan

1. **Phase 1**: Update imports and types (non-breaking)
2. **Phase 2**: Implement new ContainerizationRuntime methods
3. **Phase 3**: Add logging infrastructure
4. **Phase 4**: Add error handling
5. **Phase 5**: Update tests and documentation

**Rollback:** RuntimeFactory falls back to StubContainerRuntime if native fails.

## Open Questions

1. **Kernel distribution**: Should we bundle the kernel or download on first launch?
   - Recommendation: Download on first launch to reduce app size
   
2. **vminit image source**: Use Apple's official image or build our own?
   - Recommendation: Use Apple's official `ghcr.io/apple/containerization/vminit:0.13.0` initially
   
3. **Log retention policy**: How long to keep logs?
   - Recommendation: 7 days, 100MB max total
