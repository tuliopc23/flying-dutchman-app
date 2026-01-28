# Phase 2 Implementation Plan - Networking

**Created**: 2026-01-10  
**Updated**: 2026-01-27
**Status**: 🟡 In Progress  
**Phase**: 2 - Networking  
**Goal**: Full container networking with zero-config domains and HTTPS

---

## 🎯 Phase 2 Overview

### Goal
Enable containers to communicate with each other and the host, with zero-config DNS and HTTPS support.

### Primary Module
`FlyingDutchmanNetworking` (and `FlyingDutchmanContainers` for core network primitives)

### Capabilities
- `container-networking` - Bridge networks, port forwarding
- `dns-resolver` - Local DNS for `.fd.local` domains
- `https-termination` - Local CA + automatic certificates

### Success Criteria
- ✅ Containers can expose ports to host (`-p 8080:80`)
- [ ] Containers on same network can communicate
- [ ] Containers accessible via `container.fd.local`
- [ ] HTTPS works without browser warnings

---

## 📋 Phase 2 Sub-Phases

### 2.1 Core Networking (Completed ✅)
**Goal**: Port forwarding and bridge networks

**Tasks**:
- [x] Port forwarding (`-p` flag) ✅
- [x] Bridge network driver (NetworkManager) ✅
- [x] Container IP allocation (IPAllocator) ✅
- [x] Fix NetworkError redeclarations & module ownership ✅
- [x] Fix CLI port mapping routing (ContainerConfig) ✅

---

### 2.2 DNS & Domains (In Progress 🟡)
**Goal**: Zero-config domain resolution

**Tasks**:
- [x] Dependencies added (`DNSClient`) ✅
- [x] `DomainRoutingTable` implementation (Actor) ✅
- [x] `DNSServer` scaffolding (UDP 5353) ✅
- [x] `ResolverInstaller` for `/etc/resolver/fd.local` ✅
- [ ] Wire `DNSServer` to real DNSClient message handling logic (currently stubbed)
- [ ] Implement DNS query handling: Resolve `A` records to `127.0.0.1` (for proxy)
- [ ] Integration testing with `dig @127.0.0.1 -p 5353`

**Estimated Remaining**: 2 days

---

### 2.3 HTTPS (Next Up ⚪)
**Goal**: Automatic HTTPS certificates

**Tasks**:
1. [ ] Dependencies added (`swift-certificates`) ✅
2. [ ] Local CA generation (self-signed root)
3. [ ] Certificate provisioning (wildcard `*.fd.local`)
4. [ ] Reverse proxy for HTTPS termination (NIO TLS + `DomainRoutingTable`)
5. [ ] Certificate trust (export PEM for keychain)

**Estimated**: 4-5 days

---

### 2.4 Wiring & CLI (Pending ⚪)
**Goal**: End-to-end integration

**Tasks**:
1. [ ] Wire `DNSServer` and `HTTPSProxyServer` into `FlyingDutchmanEngine` lifecycle
2. [ ] Update `ContainerizationRuntime` to register/unregister domains on start/stop
3. [ ] Add `fd networking install-resolver` command
4. [ ] Add `fd networking export-ca` command
5. [ ] Add `fd networking status` command

---

## 📦 External Dependencies

### 1. SwiftNIO (Integrated) ✅
- **Package**: `apple/swift-nio`
- **Use**: TCP proxy, DNS UDP server, HTTPS proxy

### 2. DNSClient (Integrated) ✅
- **Package**: `orlandos-nl/DNSClient`
- **Use**: DNS message parsing and serialization

### 3. swift-certificates (Integrated) ✅
- **Package**: `apple/swift-certificates`
- **Use**: X.509 Certificate Authority and Leaf Certificate generation

---

## 🏗️ Architecture Design (Updated)

### Networking Stack

```
┌─────────────────────────────────────────┐
│          Host (macOS)                   │
│  ┌────────────────────────────────┐    │
│  │  Flying Dutchman Daemon        │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  PortForwardManager      │  │    │
│  │  │  (Containers Module)     │  │    │
│  │  └──────────────────────────┘  │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  NetworkManager          │  │    │
│  │  │  (Containers Module)     │  │    │
│  │  └──────────────────────────┘  │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  DomainRoutingTable      │  │    │
│  │  │  (Networking Module)     │  │    │
│  │  └──────────────────────────┘  │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  DNSServer (UDP:5353)    │  │    │
│  │  │  (Networking Module)     │  │    │
│  │  └──────────────────────────┘  │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │  HTTPSProxy (TCP:8443)   │  │    │
│  │  │  (Networking Module)     │  │    │
│  │  └──────────────────────────┘  │    │
│  └────────────────────────────────┘    │
└─────────────────────────────────────────┘
```

### DNS Resolution Flow (Updated)

```
Browser → nginx.fd.local
    ↓
macOS Resolver (/etc/resolver/fd.local) → 127.0.0.1:5353
    ↓
DNSServer (UDP :5353)
    ↓
Lookup: nginx.fd.local (DomainRoutingTable)
    ↓
Return A record: 127.0.0.1 (Loopback)
```

### HTTPS Flow (Updated)

```
Browser → https://nginx.fd.local (resolves to 127.0.0.1)
    ↓
HTTPSProxy (TCP :8443 or :443 via PF redirect)
    ↓
Certificate: *.fd.local (Wildcard)
    ↓
Decrypt TLS
    ↓
Lookup Upstream: nginx.fd.local → 127.0.0.1:8080 (DomainRoutingTable)
    ↓
Forward HTTP Request → 127.0.0.1:8080
    ↓
PortForwardManager (NIO TCP Proxy)
    ↓
VSOCK → Container
```

---

## 🚀 Next Steps

1. **Complete DNS**: Fill in `DNSServer` logic with real `DNSClient` message handling.
2. **Implement HTTPS**: Create `LocalCertificateAuthority` and `HTTPSProxyServer`.
3. **Wire Lifecycle**: Update EngineMain to start/stop networking services.
