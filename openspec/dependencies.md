# Flying Dutchman Dependencies

> Registry of all external packages with purpose, evaluation status, and alternatives.

---

## Status Legend

| Symbol | Meaning |
|--------|---------|
| ✅ | Integrated and in use |
| 🔍 | Under evaluation |
| ❌ | Rejected (with reason) |
| ⏸️ | Deferred for later phase |

---

## Core Dependencies

### Runtime & System

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [apple/containerization](https://github.com/apple/containerization) | 0.1.0+ | Apple's native container runtime | FlyingDutchmanContainers | ✅ |
| [apple/swift-system](https://github.com/apple/swift-system) | 1.3.0+ | System calls and file paths | FlyingDutchmanContainers | ✅ |
| [ChimeHQ/ProcessEnv](https://github.com/ChimeHQ/ProcessEnv) | 1.0.0+ | Environment variable handling | FlyingDutchmanContainers | ✅ |

**Rationale**: Apple's Containerization framework is the primary runtime for macOS 26+. It provides native VM-based containerization without Docker dependency.

### Persistence

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [groue/GRDB.swift](https://github.com/groue/GRDB.swift) | 7.8.0+ | SQLite database | FlyingDutchmanPersistence | ✅ |

**Rationale**: GRDB provides excellent Swift concurrency support, migration tools, and is battle-tested. SwiftData considered but deferred due to maturity concerns for server-like workloads.

**Future**: Evaluate SwiftData adoption in Phase 4 after iOS 26/macOS 26 stabilizes.

### Networking

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [apple/swift-nio](https://github.com/apple/swift-nio) | 2.60.0+ | Async networking primitives | FlyingDutchmanContainers, Networking | ✅ |
| [apple/swift-nio-transport-services](https://github.com/apple/swift-nio-transport-services) | 1.21.0+ | Network.framework integration | FlyingDutchmanContainers | ✅ |
| [hummingbird-project/hummingbird](https://github.com/hummingbird-project/hummingbird) | 2.0.0+ | HTTP server framework | FlyingDutchmanNetworking | ✅ |
| [swift-server/async-http-client](https://github.com/swift-server/async-http-client) | 1.20.0+ | HTTP client | FlyingDutchmanNetworking | ✅ |

**Rationale**: Swift-NIO is the foundation for server-side Swift. Hummingbird chosen over Vapor for its lightweight footprint and better async/await integration.

### CLI & Lifecycle

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [apple/swift-argument-parser](https://github.com/apple/swift-argument-parser) | 1.3.0+ | CLI argument parsing | FlyingDutchmanCLI | ✅ |
| [swift-server/swift-service-lifecycle](https://github.com/swift-server/swift-service-lifecycle) | 2.0.0+ | Daemon lifecycle management | FlyingDutchmanEngine | ✅ |
| [apple/swift-log](https://github.com/apple/swift-log) | 1.6.0+ | Structured logging | All modules | ✅ |

### Kubernetes

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [swiftkube/client](https://github.com/swiftkube/client) | 0.20.0+ | Kubernetes API client | FlyingDutchmanKubernetes | ✅ |

**Rationale**: SwiftkubeClient is the most complete Swift Kubernetes client with async/await support.

### UI & Navigation

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [pointfreeco/swift-navigation](https://github.com/pointfreeco/swift-navigation) | 2.0.0+ | Navigation and routing | FlyingDutchmanApp | ✅ |
| [pointfreeco/swift-dependencies](https://github.com/pointfreeco/swift-dependencies) | 1.0.0+ | Dependency injection | FlyingDutchmanApp, Networking | ✅ |

**Rationale**: Point-Free's navigation provides type-safe, testable navigation patterns that align with modern SwiftUI practices.

---

## Planned Dependencies (Evaluated)

### Terminal Emulation (Phase 4.3)

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [ghostty-org/ghostty (libghostty-vt)](https://github.com/ghostty-org/ghostty) | main (pinned commit) | VT terminal emulator | FlyingDutchmanApp | ✅ Selected |

**Rationale**: High-performance Zig-based VT emulator with C API. Powers the native macOS Ghostty app. Supports modern protocols (Kitty keyboard, TrueColor), proper reflow/resize, and is standards-compliant (ECMA-48, xterm).

**Integration Notes**:
- Requires building with Zig (`zig build lib-vt`)
- Swift integration via C module map pointing to `include/ghostty/vt.h`
- Create SPM wrapper package with pre-built static library
- Pin to specific commit (API still evolving toward 1.0)

**Rejected Alternative**: SwiftTerm - heavier footprint, less performant for high-throughput

### SSH Client (Phase 3.1, 4.3)

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [orlandos-nl/Citadel](https://github.com/orlandos-nl/Citadel) | 0.9.0+ | High-level SSH client | FlyingDutchmanContainers, App | ✅ Selected |

**Rationale**: High-level async/await SSH framework built on swift-nio-ssh. Provides SFTP, port forwarding, jump hosts, and easy command execution that the low-level Apple library lacks.

**Features Used**:
- `SSHClient.connect` for container/VM connections
- `executeCommand` / `executeCommandStream` for debug shell
- SFTP client for file management
- Port forwarding for service proxying

**Rejected Alternative**: apple/swift-nio-ssh directly - too low-level, no SFTP, requires extensive boilerplate

### DNS Resolution (Phase 2.2)

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [orlandos-nl/DNSClient](https://github.com/orlandos-nl/DNSClient) | 2.0.0+ | Pure Swift DNS Client | FlyingDutchmanNetworking | ✅ Selected |

**Rationale**: Pure Swift implementation built on SwiftNIO, providing both client and server capabilities. Essential for implementing the custom DNS server required for `.fd.local` domain resolution.

**Configuration Strategy**:
```swift
// Initialize DNS Client with NIO EventLoopGroup
let client = try DNSClient(
    group: eventLoopGroup,
    host: "8.8.8.8" // Upstream resolver
)

// For custom server implementation (Phase 2.2)
// DNSClient provides message parsing/serialization helpers
// to build a UDP DNS server on port 53/5353
```

**Rejected Alternatives**: 
- swift-async-dns-resolver - Wrapper around c-ares, less flexible for building a custom server
- dnsmasq subprocess - external process management overhead

### HTTPS & Certificates (Phase 2.3)

| Package | Version | Purpose | Module | Status |
|---------|---------|---------|--------|--------|
| [apple/swift-certificates](https://github.com/apple/swift-certificates) | 1.0.0+ | X.509 certificate generation | FlyingDutchmanNetworking | ✅ Selected |

**Rationale**: Apple official, Swift 6 compatible, pure Swift X.509 implementation. Enables programmatic CA creation and leaf certificate signing for automatic HTTPS on `*.fd.local` domains.

**Implementation Plan**:
1. Generate root CA on first launch (10-year validity)
2. Store CA in macOS Keychain (prompt user to trust)
3. Issue leaf certs per container/service on-demand (1-year validity)
4. Export PEM for reverse proxy (Hummingbird TLS)

**Dependencies**: Pulls in `swift-crypto` for cryptographic primitives

---

## Rejected Packages

| Package | Reason | Alternative |
|---------|--------|-------------|
| Vapor | Too heavy for embedded HTTP server | Hummingbird |
| RealmSwift | Sync features unnecessary, binary size | GRDB |
| Docker.swift | Unmaintained, incomplete API | Custom implementation |
| SwiftTerm | Heavier footprint, less performant | libghostty-vt |
| apple/swift-nio-ssh (direct) | Too low-level, no SFTP, excessive boilerplate | Citadel |
| dnsmasq | External process management overhead | DNSClient |

---

## Adding New Dependencies

Before adding a new package:

1. **Check Swift Package Index** for maintenance status and compatibility
2. **Verify Swift 6 compatibility** (strict concurrency)
3. **Review license** (prefer MIT, Apache 2.0, BSD)
4. **Document rationale** in this file
5. **Add to Package.swift** with minimum version
6. **Update module dependency graph** if cross-module

### Checklist

```markdown
- [ ] Package on Swift Package Index
- [ ] Swift 6 compatible (Sendable, async/await)
- [ ] License compatible (MIT/Apache/BSD)
- [ ] Documented in dependencies.md
- [ ] Added to Package.swift
- [ ] Module dependencies updated
```
