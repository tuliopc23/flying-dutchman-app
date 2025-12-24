# Phase 2: Networking - Status

phase: 2
status: not-started
started: null
updated: 2025-12-24
blockers:
  - Phase 1.1 (Container Engine) must complete first

---

## Overview

Networking phase delivers full container networking with zero-config domains and HTTPS.

**Primary Module**: `FlyingDutchmanNetworking`
**Capabilities**: `container-networking`

---

## Sub-phases

### 2.1 Core Networking ⚪
- [ ] 1. Bridge network driver
- [ ] 2. Port forwarding (`-p hostPort:containerPort`)
- [ ] 3. Host networking mode (`--net host`)
- [ ] 4. IPv6 support
- [ ] 5. ICMP (ping) support
- [ ] 6. VPN passthrough

**Dependencies**: Phase 1.1 complete

### 2.2 DNS & Domains ⚪
- [ ] 1. Local DNS resolver
- [ ] 2. Zero-config container domains (`container-name.fd.local`)
- [ ] 3. Compose service domains (`service.project.fd.local`)
- [ ] 4. DNS configuration UI

**Dependencies**: 2.1 complete

### 2.3 HTTPS ⚪
- [ ] 1. Local CA generation
- [ ] 2. Automatic certificate provisioning
- [ ] 3. Reverse proxy for HTTPS termination
- [ ] 4. Certificate trust UI prompt
- [ ] 5. `https://fd.local` dashboard

**Dependencies**: 2.2 complete, swift-certificates evaluation

---

## Entry Criteria

- [ ] Phase 1.1 complete (Container Engine)
- [ ] Network.framework entitlements configured

## Exit Criteria

Phase 2 is complete when:
- [ ] Containers can expose ports to host
- [ ] Containers can reach external internet
- [ ] Zero-config domains resolve from macOS
- [ ] HTTPS works for container services
- [ ] VPN traffic passes through correctly

---

## Blockers

1. **Phase 1.1 incomplete**: Need running containers to test networking.

---

## Technical Considerations

### DNS Approach Options

1. **Custom NIO-based DNS server**
   - Pros: Full control, no external dependencies
   - Cons: More implementation work

2. **dnsmasq subprocess**
   - Pros: Battle-tested, feature-rich
   - Cons: External process management

3. **mDNS/Bonjour integration**
   - Pros: Native macOS, no extra services
   - Cons: `.local` domain conflicts possible

**Recommendation**: Start with custom NIO DNS for `*.fd.local`, evaluate mDNS for discoverability.

### HTTPS Approach

Use `swift-certificates` for CA/cert generation. Reverse proxy via Hummingbird with TLS.

---

## Notes

- Domain suffix: `fd.local` (Flying Dutchman local)
- Consider `*.container.fd.local` for container isolation
- HTTPS optional but highly valuable for development
