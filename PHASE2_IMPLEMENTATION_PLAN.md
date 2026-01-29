# Phase 2 Implementation Plan - Networking (Hummingbird Edition)

**Created**: 2026-01-10
**Updated**: 2026-01-29
**Status**: 🟡 In Progress
**Approach**: High-level frameworks (Hummingbird + AsyncHTTPClient) for "Faster Development".

---

## 🎯 Phase 2 Overview

### Goal
Enable containers to communicate with each other and the host, with zero-config DNS (`*.fd.local`) and automatic HTTPS.

### Architecture (Hummingbird-First)
Instead of low-level raw NIO proxying, we will leverage **Hummingbird** for the application layer and **AsyncHTTPClient** for the proxying logic.

1.  **DNS Server**: Resolves `*.fd.local` -> `127.0.0.1`.
2.  **HTTPS Proxy**: A Hummingbird Server listening on `127.0.0.1:8443`.
    *   **TLS**: Uses a generated **Wildcard Certificate** (`*.fd.local`), avoiding complex SNI logic.
    *   **Routing**: Extracts `Host` header, looks up container IP, and streams the request/response via `AsyncHTTPClient`.

---

## 📦 Selected Stack

| Component | Library | Role |
| :--- | :--- | :--- |
| **DNS Server** | `orlandos-nl/DNSClient` | UDP 5353 Server (Existing). |
| **Certificates** | `apple/swift-certificates` | Generate Root CA + Wildcard Leaf Cert. |
| **Reverse Proxy** | `hummingbird-project/hummingbird` | HTTPS Server & Request Handling. |
| **Proxy Client** | `swift-server/async-http-client` | Streaming HTTP client to upstream containers. |

---

## 🗓️ Step-by-Step Implementation Guide

### Part 1: The "Wake Up" (DNS Wiring) 🟡
*Status: Code exists but is dormant. Needs wiring.*

**Objective**: Make `dig @127.0.0.1 -p 5353 nginx.fd.local` return `127.0.0.1`.

#### Step 1.1: Wire Engine Main
**File**: `Sources/FlyingDutchmanEngine/FlyingDutchmanEngineMain.swift`
**Instructions**:
1.  Initialize `DomainRoutingTable` (Actor) early in the startup sequence.
2.  Initialize `DNSServer` with the routing table.
3.  Add the `DNSServer` to a `ServiceGroup` (or Task) to run it alongside `EngineServer`.

#### Step 1.2: Wire Runtime
**File**: `Sources/FlyingDutchmanContainers/ContainerizationRuntime.swift`
**Instructions**:
1.  Update `init` to accept `DomainRoutingTable`.
2.  In `startContainer()`: After successful start, call `await routingTable.register(container: config:)`.
3.  In `stopContainer()`: Call `await routingTable.unregister(containerID:)`.

---

### Part 2: The "Authority" (Certificates) ⚪
*Status: New Implementation.*

**Objective**: Generate valid TLS certificates on startup.

#### Step 2.1: Certificate Manager
**File**: `Sources/FlyingDutchmanNetworking/Certificate/CertificateManager.swift` (Create New)
**Instructions**:
1.  Import `X509` (swift-certificates).
2.  Create `class CertificateManager`.
3.  **Root CA**:
    *   Check for existing Root Key/Cert in `~/.flyingdutchman/certs/`.
    *   If missing, generate a P256 Private Key and a Self-Signed Root Certificate ("Flying Dutchman Root CA").
    *   Save them to disk (PEM format).
4.  **Leaf Cert**:
    *   Generate a dynamic keypair.
    *   Create a CSR (Certificate Signing Request) for `*.fd.local`.
    *   Sign it with the Root CA.
    *   Return the `NIOSSLCertificateSource` (Chain + Private Key) for Hummingbird.

---

### Part 3: The "Proxy" (Hummingbird) ⚪
*Status: New Implementation.*

**Objective**: HTTPS Termination and Proxying.

#### Step 3.1: Proxy Handler (The Logic)
**File**: `Sources/FlyingDutchmanNetworking/Routes/ProxyRoutes.swift` (Create New)
**Instructions**:
1.  Extend `Application` (Hummingbird).
2.  Create a wildcard route `router.all("**")`.
3.  **Handler Logic**:
    *   Get `Host` header (e.g., `nginx.fd.local`).
    *   Ask `DomainRoutingTable` for the upstream IP (e.g., `127.0.0.1:32768`).
    *   If found:
        *   Create `HTTPClientRequest` (AsyncHTTPClient).
        *   Copy Method, Headers, and Body stream.
        *   `try await client.execute(request, timeout: .seconds(30))`.
        *   Stream the response back to the Hummingbird `Response`.
    *   If not found: Return 404 / 502 Bad Gateway.

#### Step 3.2: HTTPS Server (The Service)
**File**: `Sources/FlyingDutchmanNetworking/HTTPSProxyServer.swift`
**Instructions**:
1.  Create `actor HTTPSProxyServer`.
2.  Init with `CertificateManager`, `DomainRoutingTable`.
3.  **Start**:
    *   Get Certs from Manager.
    *   Configure `TLSConfiguration` with the wildcard cert.
    *   Build `Hummingbird.Application`.
    *   Add `ProxyRoutes`.
    *   Run application listening on `127.0.0.1:8443`.

---

### Part 4: CLI & Trust ⚪
*Status: User Experience.*

#### Step 4.1: Trust Command
**File**: `Sources/FlyingDutchmanCLI/Commands/Networking/TrustCA.swift`
**Instructions**:
1.  Implement `fd networking trust-ca`.
2.  Action: Execute `security add-trusted-cert ...` (macOS shell command) pointing to the Root CA path.
3.  Requires `sudo` (handled by system prompt).

---

## 🚀 Execution Order

1.  **Execute Part 1 (Wiring)** immediately to fix the broken state.
2.  **Execute Part 2 (Certs)** to get the materials for TLS.
3.  **Execute Part 3 (Proxy)** to turn on the HTTPS server.
