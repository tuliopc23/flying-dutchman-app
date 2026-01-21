# Phase 2 Implementation Plan - Networking

**Created**: 2026-01-10  
**Status**: Planning  
**Phase**: 2 - Networking  
**Goal**: Full container networking with zero-config domains and HTTPS

---

## 🎯 Phase 2 Overview

### Goal
Enable containers to communicate with each other and the host, with zero-config DNS and HTTPS support.

### Primary Module
`FlyingDutchmanNetworking`

### Capabilities
- `container-networking` - Bridge networks, port forwarding
- `dns-resolver` - Local DNS for `.fd.local` domains
- `https-termination` - Local CA + automatic certificates

### Success Criteria
- Containers can expose ports to host (`-p 8080:80`)
- Containers on same network can communicate
- Containers accessible via `container.fd.local`
- HTTPS works without browser warnings

---

## 📋 Phase 2 Sub-Phases

### 2.1 Core Networking (Week 1-2)
**Goal**: Port forwarding and bridge networks

**Tasks**:
1. Port forwarding (`-p` flag)
2. Bridge network driver
3. Container-to-container communication
4. Host networking mode (`--net host`)
5. IPv6 and ICMP support

**Estimated**: 6-8 days

---

### 2.2 DNS & Domains (Week 2-3)
**Goal**: Zero-config domain resolution

**Tasks**:
1. Local DNS resolver
2. Container name → IP mapping
3. Domain format: `container.fd.local`
4. Compose service domains: `service.project.fd.local`
5. macOS `/etc/resolver/` integration

**Estimated**: 4-5 days

---

### 2.3 HTTPS (Week 3-4)
**Goal**: Automatic HTTPS certificates

**Tasks**:
1. Local CA generation (self-signed root)
2. Certificate provisioning (per domain)
3. Reverse proxy for HTTPS termination
4. Certificate trust (add to system keychain)
5. Certificate renewal

**Estimated**: 5-6 days

---

## 📦 External Dependencies

Phase 2 uses **3 key packages** (already evaluated and selected):

### 1. SwiftNIO (Already Integrated) ✅
- **Package**: `apple/swift-nio` (v2.60.0+)
- **Purpose**: TCP proxy for port forwarding
- **Status**: Already in use for Hummingbird
- **New Use**: `ServerBootstrap` for binding host ports, channel pipelines for proxying

### 2. DNSClient (To Add in Sprint 2) 🆕
- **Package**: `orlandos-nl/DNSClient` (v2.0.0+)
- **Purpose**: DNS server implementation for `.fd.local` domains
- **Status**: Selected, needs integration
- **Sprint**: 2.2 (DNS & Domains)
- **Usage**: UDP DNS server on port 53, message parsing/serialization

### 3. swift-certificates (To Add in Sprint 3) 🆕
- **Package**: `apple/swift-certificates` (v1.0.0+)
- **Purpose**: X.509 certificate generation for HTTPS
- **Status**: Selected, needs integration
- **Sprint**: 2.3 (HTTPS)
- **Dependency**: Pulls in `swift-crypto` automatically
- **Usage**: Root CA generation, leaf certificate signing

### NOT Used in Phase 2 (Future Phases)

**Citadel** - SSH client library
- **Phase**: 3.1 (Linux Machines) and 4.3 (Debug Shell)
- **Purpose**: SSH connections, SFTP, port forwarding
- **Not needed yet**: Phase 2 uses VSOCK for container communication

**Hummingbird** - HTTP server
- **Status**: ✅ Already integrated in Phase 0/1
- **Phase 2 Use**: Will extend for HTTPS reverse proxy (Sprint 3)
- **No new integration needed**: Just add TLS configuration

### Package.swift Updates Needed

**Sprint 2 (DNS)**:
```swift
dependencies: [
    // ... existing
    .package(url: "https://github.com/orlandos-nl/DNSClient.git", from: "2.0.0"),
]
```

**Sprint 3 (HTTPS)**:
```swift
dependencies: [
    // ... existing
    .package(url: "https://github.com/apple/swift-certificates.git", from: "1.0.0"),
]
```

---

## 🏗️ Architecture Design

### Networking Stack

```
┌─────────────────────────────────────────┐
│          Host (macOS)                   │
│  ┌────────────────────────────────┐    │
│  │  Flying Dutchman Daemon        │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  PortForwardManager      │  │    │
│  │  │  - NIO TCP proxy         │  │    │
│  │  │  - Port binding          │  │    │
│  │  └──────────────────────────┘  │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  NetworkManager          │  │    │
│  │  │  - Bridge creation       │  │    │
│  │  │  - IP allocation (CIDR)  │  │    │
│  │  └──────────────────────────┘  │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  DNSResolver             │  │    │
│  │  │  - UDP server (port 53)  │  │    │
│  │  │  - Name → IP mapping     │  │    │
│  │  └──────────────────────────┘  │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  HTTPSProxy              │  │    │
│  │  │  - TLS termination       │  │    │
│  │  │  - Certificate mgmt      │  │    │
│  │  └──────────────────────────┘  │    │
│  └────────────────────────────────┘    │
│                                         │
│  ┌────────────────────────────────┐    │
│  │  Container VMs                 │    │
│  │  ┌──────┐  ┌──────┐  ┌──────┐ │    │
│  │  │ VM 1 │  │ VM 2 │  │ VM 3 │ │    │
│  │  │ 172. │  │ 172. │  │ 172. │ │    │
│  │  │ 20.  │  │ 20.  │  │ 20.  │ │    │
│  │  │ 0.2  │  │ 0.3  │  │ 0.4  │ │    │
│  │  └──────┘  └──────┘  └──────┘ │    │
│  └────────────────────────────────┘    │
└─────────────────────────────────────────┘
```

### Port Forwarding Flow

```
Browser → localhost:8080
    ↓
PortForwardManager (NIO TCP Proxy)
    ↓
VSOCK → VM port 80
    ↓
Container nginx process
```

### DNS Resolution Flow

```
Browser → nginx.fd.local
    ↓
macOS Resolver (/etc/resolver/fd.local)
    ↓
DNSResolver (UDP :53)
    ↓
Lookup: nginx → 172.20.0.2
    ↓
Return A record
```

### HTTPS Flow

```
Browser → https://nginx.fd.local
    ↓
HTTPSProxy (NIO TLS)
    ↓
Certificate: CN=nginx.fd.local (auto-generated)
    ↓
Decrypt TLS → Forward HTTP → VSOCK
    ↓
Container nginx:80
```

---

## 📦 Sprint 1: Port Forwarding (Priority)

### Goal
Enable `-p host:container` port forwarding for container services.

### Implementation Plan

#### Task 1.1: Create PortForwardManager

**File**: `Sources/FlyingDutchmanNetworking/PortForwardManager.swift`

```swift
import Foundation
import NIOCore
import NIOPosix
import Containerization
import Logging

/// Manages port forwarding from host to containers
public actor PortForwardManager {
    private let logger = Logger(label: "com.flyingdutchman.port-forward")
    private let group: EventLoopGroup
    
    /// Active port forwards (host port -> container info)
    private var forwards: [Int: PortForward] = [:]
    
    public init(group: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 2)) {
        self.group = group
    }
    
    /// Create port forward: host:port -> container:port
    public func createForward(
        hostPort: Int,
        containerID: UUID,
        containerPort: Int,
        vsockCID: UInt32
    ) async throws {
        logger.info("Creating port forward", metadata: [
            "hostPort": .stringConvertible(hostPort),
            "containerID": .string(containerID.uuidString),
            "containerPort": .stringConvertible(containerPort)
        ])
        
        // Check if host port already in use
        guard forwards[hostPort] == nil else {
            throw NetworkError.portAlreadyBound(port: hostPort)
        }
        
        // Create TCP server on host port
        let bootstrap = ServerBootstrap(group: group)
            .serverChannelOption(ChannelOptions.backlog, value: 256)
            .serverChannelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .childChannelInitializer { channel in
                channel.pipeline.addHandlers([
                    PortForwardHandler(
                        vsockCID: vsockCID,
                        containerPort: containerPort
                    )
                ])
            }
        
        let channel = try await bootstrap.bind(host: "0.0.0.0", port: hostPort).get()
        
        let forward = PortForward(
            hostPort: hostPort,
            containerID: containerID,
            containerPort: containerPort,
            channel: channel
        )
        
        forwards[hostPort] = forward
        
        logger.info("Port forward created", metadata: [
            "hostPort": .stringConvertible(hostPort)
        ])
    }
    
    /// Remove port forward
    public func removeForward(hostPort: Int) async throws {
        guard let forward = forwards[hostPort] else {
            return // Already removed
        }
        
        try await forward.channel.close()
        forwards.removeValue(forKey: hostPort)
        
        logger.info("Port forward removed", metadata: [
            "hostPort": .stringConvertible(hostPort)
        ])
    }
    
    /// Remove all forwards for a container
    public func removeForwards(containerID: UUID) async throws {
        let containerForwards = forwards.filter { $0.value.containerID == containerID }
        
        for (hostPort, _) in containerForwards {
            try await removeForward(hostPort: hostPort)
        }
    }
    
    /// List all active forwards
    public func listForwards() -> [PortForwardSummary] {
        forwards.values.map { forward in
            PortForwardSummary(
                hostPort: forward.hostPort,
                containerID: forward.containerID,
                containerPort: forward.containerPort
            )
        }
    }
}

// MARK: - Supporting Types

private struct PortForward {
    let hostPort: Int
    let containerID: UUID
    let containerPort: Int
    let channel: Channel
}

public struct PortForwardSummary: Codable, Sendable {
    public let hostPort: Int
    public let containerID: UUID
    public let containerPort: Int
}

/// NIO channel handler for port forwarding
private final class PortForwardHandler: ChannelInboundHandler {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer
    
    private let vsockCID: UInt32
    private let containerPort: Int
    private let logger = Logger(label: "com.flyingdutchman.port-forward.handler")
    
    init(vsockCID: UInt32, containerPort: Int) {
        self.vsockCID = vsockCID
        self.containerPort = containerPort
    }
    
    func channelActive(context: ChannelHandlerContext) {
        logger.debug("Client connected")
        
        // TODO: Establish VSOCK connection to container
        // For now, close immediately
        context.close(promise: nil)
    }
    
    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let buffer = unwrapInboundIn(data)
        
        // TODO: Forward data to container via VSOCK
        logger.debug("Received data", metadata: [
            "bytes": .stringConvertible(buffer.readableBytes)
        ])
    }
    
    func errorCaught(context: ChannelHandlerContext, error: Error) {
        logger.error("Port forward error", metadata: [
            "error": .string(error.localizedDescription)
        ])
        context.close(promise: nil)
    }
}

public enum NetworkError: Error, LocalizedError {
    case portAlreadyBound(port: Int)
    case vsockConnectionFailed(cid: UInt32, port: Int)
    
    public var errorDescription: String? {
        switch self {
        case .portAlreadyBound(let port):
            return "Port \(port) is already bound"
        case .vsockConnectionFailed(let cid, let port):
            return "Failed to connect to VSOCK CID \(cid):\(port)"
        }
    }
}
```

---

#### Task 1.2: Wire Port Forwarding into ContainerizationRuntime

**File**: `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`

**Modifications**:

1. Add property:
```swift
private let portForwardManager: PortForwardManager
```

2. Parse ports from ContainerConfig:
```swift
// In createContainer()
if let ports = config.ports {
    // Store port mappings for later forwarding
    // Format: ["8080:80", "3000:3000"]
}
```

3. Setup forwards on container start:
```swift
// In startContainer() after linuxContainer.start()
if let portMappings = loadPortMappings(containerID: id) {
    for mapping in portMappings {
        try await portForwardManager.createForward(
            hostPort: mapping.hostPort,
            containerID: id,
            containerPort: mapping.containerPort,
            vsockCID: linuxContainer.vsockCID // TODO: Get from container
        )
    }
}
```

4. Cleanup forwards on container stop:
```swift
// In stopContainer() before linuxContainer.stop()
try await portForwardManager.removeForwards(containerID: id)
```

---

#### Task 1.3: Add Port Mapping Model

**File**: `Sources/Shared/Models/PortMapping.swift`

```swift
import Foundation

/// Represents a port mapping from host to container
public struct PortMapping: Codable, Sendable, Hashable {
    public let hostPort: Int
    public let containerPort: Int
    public let protocol: NetworkProtocol
    
    public enum NetworkProtocol: String, Codable, Sendable {
        case tcp
        case udp
    }
    
    public init(hostPort: Int, containerPort: Int, protocol: NetworkProtocol = .tcp) {
        self.hostPort = hostPort
        self.containerPort = containerPort
        self.protocol = protocol
    }
    
    /// Parse port mapping from Docker format
    /// Examples: "8080:80", "3000:3000/tcp", "5353:53/udp"
    public static func parse(_ spec: String) throws -> PortMapping {
        let parts = spec.split(separator: "/")
        let portPart = String(parts[0])
        let protocolString = parts.count > 1 ? String(parts[1]) : "tcp"
        
        guard let proto = NetworkProtocol(rawValue: protocolString) else {
            throw PortMappingError.invalidProtocol(protocolString)
        }
        
        let ports = portPart.split(separator: ":")
        guard ports.count == 2,
              let hostPort = Int(ports[0]),
              let containerPort = Int(ports[1]) else {
            throw PortMappingError.invalidFormat(spec)
        }
        
        return PortMapping(hostPort: hostPort, containerPort: containerPort, protocol: proto)
    }
}

public enum PortMappingError: Error, LocalizedError {
    case invalidFormat(String)
    case invalidProtocol(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidFormat(let spec):
            return "Invalid port mapping format: \(spec)"
        case .invalidProtocol(let proto):
            return "Invalid protocol: \(proto)"
        }
    }
}
```

---

#### Task 1.4: Update ContainerConfig

**File**: `Sources/Shared/Models/ContainerConfig.swift`

**Add field**:
```swift
public struct ContainerConfig: Codable, Sendable {
    // ... existing fields
    
    /// Port mappings (host:container format)
    public let portMappings: [PortMapping]?
    
    public init(
        // ... existing params
        portMappings: [PortMapping]? = nil
    ) {
        // ... existing assignments
        self.portMappings = portMappings
    }
}
```

---

#### Task 1.5: Add CLI Support for -p Flag

**File**: `Sources/FlyingDutchmanCLI/Commands/Run.swift` (new)

```swift
import ArgumentParser
import Foundation

extension Containers {
    struct Run: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Run a container from an image"
        )
        
        @Argument(help: "Image reference")
        var image: String
        
        @Option(name: .shortAndLong, help: "Container name")
        var name: String?
        
        @Option(name: .shortAndLong, parsing: .upToNextOption, help: "Port mappings (e.g., 8080:80)")
        var publish: [String] = []
        
        @Option(name: .long, help: "Working directory")
        var workdir: String?
        
        @Option(name: .shortAndLong, parsing: .upToNextOption, help: "Environment variables (KEY=VALUE)")
        var env: [String] = []
        
        func run() async throws {
            let containerName = name ?? "container-\(UUID().uuidString.prefix(8))"
            
            // Parse port mappings
            let portMappings = try publish.map { try PortMapping.parse($0) }
            
            // Parse env vars
            let envDict = Dictionary(uniqueKeysWithValues: env.compactMap { spec -> (String, String)? in
                let parts = spec.split(separator: "=", maxSplits: 1)
                guard parts.count == 2 else { return nil }
                return (String(parts[0]), String(parts[1]))
            })
            
            // Create container
            let config = ContainerConfig(
                command: nil,
                env: envDict.isEmpty ? nil : envDict,
                ports: nil, // Legacy format
                portMappings: portMappings.isEmpty ? nil : portMappings,
                volumes: nil,
                workingDir: workdir,
                cpuLimit: nil,
                memoryLimit: nil
            )
            
            let client = EngineClient()
            let container = try await client.createContainer(name: containerName, image: image, config: config)
            CLIOutput.line("Created", container.name)
            
            // Start container
            let started = try await client.startContainer(id: container.id)
            CLIOutput.line("Started", started.name)
            
            if !portMappings.isEmpty {
                CLIOutput.section("Port Mappings")
                for mapping in portMappings {
                    CLIOutput.line("  localhost:\(mapping.hostPort)", "→ container:\(mapping.containerPort)")
                }
            }
        }
    }
}
```

---

## 📅 Implementation Timeline

### Week 1: Port Forwarding Foundation
- Day 1-2: Create PortForwardManager (NIO TCP server)
- Day 3: Wire into ContainerizationRuntime
- Day 4: Add models (PortMapping, ContainerConfig updates)
- Day 5: CLI `run` command with `-p` flag

### Week 2: Bridge Networks
- Day 1-2: Create NetworkManager (bridge creation, IP allocation)
- Day 3: Container network isolation
- Day 4: Container-to-container communication
- Day 5: Testing and debugging

### Week 3: DNS Resolver
- Day 1-2: Create DNSResolver (UDP server on port 53)
- Day 3: Name → IP mapping, `/etc/resolver/` integration
- Day 4: Compose service domains
- Day 5: Testing and debugging

### Week 4: HTTPS
- Day 1-2: Local CA generation (swift-certificates)
- Day 3: HTTPSProxy (TLS termination with NIO)
- Day 4: Certificate provisioning per domain
- Day 5: System keychain trust, testing

---

## 🎯 Success Criteria

### Phase 2.1 (Port Forwarding) Complete When:
- [ ] Can run `fd run -p 8080:80 nginx`
- [ ] Can access container via `curl localhost:8080`
- [ ] Multiple port mappings work simultaneously
- [ ] Forwards cleanup on container stop

### Phase 2.2 (DNS) Complete When:
- [ ] Can access container via `nginx.fd.local`
- [ ] Compose services resolve: `web.myapp.fd.local`
- [ ] DNS queries logged and debuggable
- [ ] `/etc/resolver/fd.local` configured

### Phase 2.3 (HTTPS) Complete When:
- [ ] Can access `https://nginx.fd.local` without warnings
- [ ] Certificates auto-generated per domain
- [ ] CA trusted by system keychain
- [ ] Certificate renewal works

---

## 📊 Estimated Effort

| Sub-Phase | Tasks | Days | LOC (est) |
|-----------|-------|------|-----------|
| 2.1 Port Forwarding | 5 | 5 | ~800 |
| 2.2 Bridge Networks | 5 | 5 | ~600 |
| 2.3 DNS Resolver | 5 | 5 | ~700 |
| 2.4 HTTPS | 5 | 5 | ~900 |
| **Total** | **20** | **20** | **~3,000** |

**Phase 2 Duration**: 3-4 weeks (focused implementation)

---

## 🚀 Let's Start with Sprint 1: Port Forwarding

**Ready to implement?** Say "go" and I'll start creating the PortForwardManager! 🚢
