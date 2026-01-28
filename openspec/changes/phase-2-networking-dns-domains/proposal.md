# Change: Phase 2.2 - DNS + Auto Domains (`*.fd.local`)

## Why
Flying Dutchman needs zero-config, developer-friendly networking so that containers and compose services are reachable by name, similar to OrbStack:

* `container.fd.local` resolves automatically
* Compose-style names like `service.project.fd.local` become possible

This unlocks a polished UX for port forwarding, local reverse proxy (Phase 2.3 HTTPS), and debug workflows.

## What changes
### Summary
Implement a local DNS system for the `fd.local` domain, backed by the engine’s persisted network/IP allocations.

### Technical approach
1. Add DNS client/server building blocks via `orlandos-nl/DNSClient`.
2. Implement a small UDP DNS server listening on `127.0.0.1:5353`.
3. Install a macOS resolver file at `/etc/resolver/fd.local` pointing to that server.
4. Define naming rules and persistence mapping:
    * Container: `containerName.fd.local` → allocated container IP
    * (Future) Compose: `service.project.fd.local` → service/container IP

### Scope (Phase 2.2)
* DNS server (UDP)
* Record source-of-truth mapping and caching strategy
* Resolver installation and verification
* Swift Testing coverage

### Non-goals (explicitly out of scope for this change)
* HTTPS and certificates (Phase 2.3)
* Host port routing by name (reverse proxy) (Phase 2.3+)
* IPv6 support (defer)

## Impact
### Specs
* `openspec/specs/container-networking/spec.md` (should be updated to describe DNS + domains)

### Modules
* `FlyingDutchmanNetworking` (recommended location for DNS server + resolver installer)
* `FlyingDutchmanPersistence` (may require adding a table or extending existing records for name→IP mapping)
* `Shared` (shared models/constants for naming rules)

### Dependencies
* Add: `orlandos-nl/DNSClient`
* Update:
    * `Package.swift`
    * `Tuist/Project.swift`
    * `openspec/dependencies.md`

## Risks / considerations
* macOS resolver installation requires elevated permissions.
* Keep DNS bound to localhost and a non-privileged port (5353) to avoid root port binding.
* Must avoid name collisions (two containers with same name).
* CI cannot validate resolver install without a suitable macOS environment; most of this should be unit/integration tested in-process.
