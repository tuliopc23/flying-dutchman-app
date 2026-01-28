# Plan: Phase 2 Networking Implementation

## Context

### Original Request
Verify exactly what's the next phase of implementation for this project and create a plan for execution. Identify what still needs wiring and generate a clear plan for next phases.

### Interview Summary
**Key Discussions**:
- Phase 1 (Container Core) is 100% complete.
- Phase 2 Backend focus is **Networking** (Port Forwarding, DNS, HTTPS).
- Discrepancy: A "Phase 2" UI/UX status file exists and is complete, but backend Networking is the roadmap priority.
- Existing networking code (`NetworkManager`, `IPAllocator`) has LSP errors and needs stabilization.

**Research Findings**:
- `NetworkManager` manages bridge networks and IP allocation.
- `PortForwardManager` is conceptually designed but not implemented.
- DNS Resolver is planned for Phase 2.2 using `DNSClient`.
- HTTPS Termination is planned for Phase 2.3 using `swift-certificates`.
- CLI lacks `-p` flag support for port mapping.

### Metis Review
**Identified Gaps** (addressed in this plan):
- **Permissions**: Stay unprivileged (use port 5353 for DNS, non-root ports for proxy).
- **CLI Semantics**: Explicitly define `-p` behavior (e.g., `host:container`).
- **HTTPS Trust**: Certs will be generated but NOT automatically installed in system Keychain to avoid invasive changes.
- **Edge Cases**: Port conflicts and clean teardown on container stop.
- **Guardrails**: Prevent feature creep into service mesh or complex reverse proxy features.

---

## Work Objectives

### Core Objective
Deliver a functional container networking stack including bridge networks, port forwarding, zero-config DNS (`*.fd.local`), and automatic HTTPS.

### Concrete Deliverables
- [ ] Stabilized `FlyingDutchmanNetworking` module (LSP fixes).
- [ ] `PortForwardManager` (NIO-based TCP proxy).
- [ ] `DNSResolver` (UDP DNS server on 5353).
- [ ] `HTTPSProxy` (Automatic cert generation and TLS termination).
- [ ] Updated `fd run` CLI command with `-p` flag support.
- [ ] Wiring in `ContainerizationRuntime` for networking lifecycle hooks.

### Definition of Done
- [ ] `fd run -p 8080:80` makes container port 80 reachable at `localhost:8080`.
- [ ] `ping container.fd.local` resolves to the container's internal IP (using `/etc/resolver/fd.local`).
- [ ] `https://container.fd.local` serves a valid (self-signed) certificate for that domain.
- [ ] All tests pass: `swift test`.

### Must Have
- Port forwarding functionality.
- Automated IP allocation for bridge networks.
- Local DNS resolution for `.fd.local`.
- Automatic (leaf) cert generation.

### Must NOT Have (Guardrails)
- NO system-wide DNS changes (stay within `/etc/resolver/`).
- NO automatic root CA installation in system Keychain.
- NO complex load balancing or health checking.
- NO IPv6 support (deferred).

---

## Verification Strategy

### Test Decision
- **Infrastructure exists**: YES
- **User wants tests**: YES (TDD approach where applicable)
- **Framework**: Swift Testing

### Manual QA Procedures
- **Port Forwarding**: Run `nginx` container with `-p 8080:80`, verify with `curl localhost:8080`.
- **DNS**: Run container `web`, verify `dig @127.0.0.1 -p 5353 web.fd.local`.
- **HTTPS**: Access `https://web.fd.local` via browser (after manual trust or bypass).

---

## Task Flow

```
Task 0 (Fix) → Task 1 (Port Forwarding) → Task 2 (DNS) → Task 3 (HTTPS) → Task 4 (Integration)
```

---

## TODOs

- [ ] 0. Stabilize Networking Module
  **What to do**:
  - Fix LSP errors in `IPAllocator.swift` and `NetworkManager.swift`.
  - Resolve `NetworkError` redeclarations.
  - Fix `UUID`/`ObjectIdentifier` mismatch in `NetworkStore` interaction.
  **Parallelizable**: NO

- [ ] 1. Implement Port Forwarding
  **What to do**:
  - Create `PortForwardManager` using `swift-nio`.
  - Implement TCP listener for host ports.
  - Implement proxy logic to forward traffic to container IP/port via VSOCK or Bridge IP.
  - Handle port conflicts gracefully.
  **Parallelizable**: YES

- [ ] 2. Implement DNS Resolver (Phase 2.2)
  **What to do**:
  - Add `DNSClient` dependency to `Package.swift` and `Tuist/Project.swift`.
  - Create `DNSResolver` UDP server on port 5353.
  - Map `containerName.fd.local` to `NetworkManager` IPs.
  - Implement `/etc/resolver/fd.local` configuration helper.
  **Parallelizable**: YES

- [ ] 3. Implement HTTPS Termination (Phase 2.3)
  **What to do**:
  - Add `swift-certificates` dependency.
  - Create `CertificateAuthority` helper to generate local CA and sign leaf certs.
  - Implement `HTTPSProxy` to terminate TLS and forward to container ports.
  **Parallelizable**: YES

- [ ] 4. Wire Networking into Runtime & CLI
  **What to do**:
  - Update `ContainerizationRuntime` to call `NetworkManager` and `PortForwardManager` during container start/stop.
  - Add `-p` / `--publish` flag to `fd run` command in `FlyingDutchmanCLI`.
  - Ensure cleanup of listeners and IP reservations on container exit.
  **Parallelizable**: NO (depends on 1, 2, 3)

---

## Commit Strategy

| After Task | Message | Files | Verification |
|------------|---------|-------|--------------|
| 0 | `fix(networking): resolve LSP errors and type mismatches` | `Sources/FlyingDutchmanNetworking/*` | `swift build` |
| 1 | `feat(networking): implement NIO-based PortForwardManager` | `Sources/FlyingDutchmanNetworking/PortForwardManager.swift` | `swift test` |
| 2 | `feat(networking): implement DNSResolver for fd.local` | `Sources/FlyingDutchmanNetworking/DNSResolver.swift` | `dig` verification |
| 3 | `feat(networking): implement HTTPSProxy and cert management` | `Sources/FlyingDutchmanNetworking/HTTPSProxy.swift` | `curl -k` |
| 4 | `feat(runtime): wire networking and port forwarding to lifecycle` | `Sources/FlyingDutchmanContainers/*`, `Sources/FlyingDutchmanCLI/*` | `fd run -p` |

---

## Success Criteria

### Verification Commands
```bash
# Verify port forwarding
fd run -p 8080:80 nginx
curl localhost:8080

# Verify DNS
dig @127.0.0.1 -p 5353 my-nginx.fd.local

# Verify HTTPS
curl -k https://my-nginx.fd.local
```
