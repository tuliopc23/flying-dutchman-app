# Phase 2 Status: Networking

updated: 2026-01-27
status: 🟡 In Progress

---

## 🎯 Current Sprint: Networking Stabilization & DNS

### 2.1 Core Networking (Stabilization)
- [x] Bridge network driver (NetworkManager + IPAllocator) ✅
- [x] Port forwarding (`-p` flag + PortForwardManager) ✅
- [x] Container IP allocation (CIDR) ✅
- [ ] Fix `NetworkError` redeclaration
- [ ] Resolve module ownership (Containers <-> Networking)
- [ ] Fix HTTP container create route (ContainerConfig)

### 2.2 DNS & Domains
- [ ] Local DNS resolver (UDP 5353)
- [ ] Resolver file (/etc/resolver/fd.local)
- [ ] Zero-config domains (*.fd.local)

### 2.3 HTTPS
- [ ] Local CA generation
- [ ] Automatic certificate provisioning
- [ ] Reverse proxy for HTTPS termination

---

## 🚦 Acceptance Criteria Progress

| Category | Requirement | Status |
| :--- | :--- | :--- |
| **Core** | Bridge Networking | ✅ Done |
| **Core** | Port Forwarding | 🟡 Partial |
| **DNS** | Local Resolution | ⚪ Not Started |
| **HTTPS** | Local Certificates | ⚪ Not Started |

---

## 📝 Change Log

- **2026-01-27**: Reset Phase 2 status to align with Networking roadmap.
