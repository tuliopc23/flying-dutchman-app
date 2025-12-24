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

## Candidates Under Evaluation

### Terminal Emulation (Phase 4.3)

| Package | Purpose | Pros | Cons | Status |
|---------|---------|------|------|--------|
| [libghosted](https://github.com/example/libghosted) | Terminal emulation | Lightweight, macOS native | Limited docs | 🔍 |
| [SwiftTerm](https://github.com/migueldeicaza/SwiftTerm) | xterm-compatible terminal | Feature-rich, maintained | Heavier footprint | 🔍 |

**Decision needed by**: Phase 4.3 start

### HTTPS & Certificates (Phase 2.3)

| Package | Purpose | Pros | Cons | Status |
|---------|---------|------|------|--------|
| [apple/swift-certificates](https://github.com/apple/swift-certificates) | X.509 certificates | Apple official, modern | Newer, less docs | 🔍 |
| [swift-crypto](https://github.com/apple/swift-crypto) | Cryptographic primitives | Apple official, stable | Lower-level | ⏸️ |

### DNS Server (Phase 2.2)

| Package | Purpose | Pros | Cons | Status |
|---------|---------|------|------|--------|
| Custom NIO-based | Local DNS resolver | Full control | More work | 🔍 |
| dnsmasq (subprocess) | DNS forwarding | Battle-tested | External process | 🔍 |

---

## Rejected Packages

| Package | Reason | Alternative |
|---------|--------|-------------|
| Vapor | Too heavy for embedded HTTP server | Hummingbird |
| RealmSwift | Sync features unnecessary, binary size | GRDB |
| Docker.swift | Unmaintained, incomplete API | Custom implementation |

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
