# Tasks: Phase 2 Networking Stabilization, DNS, & HTTPS

## 1. Stabilization (Immediate)

### 1.1 Fix NetworkError Redeclaration
- [ ] Consolidate `NetworkError` into `Sources/FlyingDutchmanNetworking/NetworkError.swift`
- [ ] Update `IPAllocator`, `NetworkManager`, `PortForwardManager` to use unified error type
- [ ] Ensure `NetworkError` is `Sendable` and `LocalizedError`

### 1.2 Resolve Module Ownership (Containers <-> Networking)
- [ ] Move "network core" files to `FlyingDutchmanContainers`:
  - [ ] `IPAllocator.swift` -> `Sources/FlyingDutchmanContainers/Networking/IPAllocator.swift`
  - [ ] `NetworkManager.swift` -> `Sources/FlyingDutchmanContainers/Networking/NetworkManager.swift`
  - [ ] `PortForwardManager.swift` -> `Sources/FlyingDutchmanContainers/Networking/PortForwardManager.swift`
  - [ ] `NetworkError.swift` -> `Sources/FlyingDutchmanContainers/Networking/NetworkError.swift`
- [ ] Update imports in `FlyingDutchmanContainers` and `FlyingDutchmanNetworking`
- [ ] Verify `Package.swift` and `Project.swift` dependency graph (Containers owns core networking, Networking owns engine/server surface)

### 1.3 Fix HTTP Container Create Route
- [ ] Update `Sources/FlyingDutchmanNetworking/Routes/ContainersRoutes.swift`
- [ ] Implement `effectiveConfig` logic to merge `payload.config` with legacy fields
- [ ] Verify `fd run -p` passes `ContainerConfig` correctly to runtime

## 2. DNS Implementation (Phase 2.2)

### 2.1 Dependencies
- [ ] Add `orlandos-nl/DNSClient` to `Package.swift` and `Project.swift`

### 2.2 Routing Table
- [ ] Create `Sources/FlyingDutchmanNetworking/DomainRoutingTable.swift` (Actor)
- [ ] Implement `register(container:config:)` and `unregister`
- [ ] Implement `resolveIPv4` and `resolveUpstream`
- [ ] Decision: `resolveIPv4` returns loopback (`127.0.0.1`) for proxy routing

### 2.3 DNS Server
- [ ] Create `Sources/FlyingDutchmanNetworking/DNS/DNSServer.swift`
- [ ] Implement UDP listener on `127.0.0.1:5353`
- [ ] Connect to `DomainRoutingTable` via `DNSRecordSource` protocol

### 2.4 Resolver Installer
- [ ] Create `Sources/FlyingDutchmanNetworking/DNS/ResolverInstaller.swift`
- [ ] Implement content generation for `/etc/resolver/fd.local`

## 3. HTTPS Implementation (Phase 2.3)

### 3.1 Dependencies
- [ ] Add `apple/swift-certificates` to `Package.swift` and `Project.swift`

### 3.2 Local CA
- [ ] Create `Sources/FlyingDutchmanNetworking/TLS/LocalCertificateAuthority.swift`
- [ ] Implement Root CA generation/loading
- [ ] Implement Wildcard Leaf cert (`*.fd.local`) generation

### 3.3 HTTPS Proxy
- [ ] Create `Sources/FlyingDutchmanNetworking/HTTPS/HTTPSProxyServer.swift`
- [ ] Bind to `127.0.0.1:8443` (initially)
- [ ] Implement SNI/Host routing to Upstream

## 4. Lifecycle & Wiring

### 4.1 Engine Boot
- [ ] Update `FlyingDutchmanEngineMain.swift` to start DNS and Proxy servers
- [ ] Use Service Lifecycle for coordination

### 4.2 Runtime Integration
- [ ] Update `ContainerizationRuntime.swift`
- [ ] Inject `DomainRoutingTable`
- [ ] Call `register`/`unregister` on container start/stop

### 4.3 CLI Support
- [ ] Add `fd networking install-resolver` command
- [ ] Add `fd networking export-ca` command
- [ ] Add `fd networking status` command
