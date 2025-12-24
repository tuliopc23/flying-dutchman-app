# Phase 1: Container Core - Status

phase: 1
status: not-started
started: null
updated: 2025-12-24
blockers:
  - Phase 0.3 (Runtime Abstraction) must complete first

---

## Overview

Container Core phase delivers Docker-compatible container engine with full lifecycle support.

**Primary Module**: `FlyingDutchmanContainers`
**Capabilities**: `container-engine`, `container-storage`, `image-management`

---

## Sub-phases

### 1.1 Container Engine ⚪
- [ ] 1. Container CRUD operations (create, read, update, delete)
- [ ] 2. Container state machine (created → running → stopped → removed)
- [ ] 3. Compose project parsing and execution
- [ ] 4. Container logs streaming (follow mode)
- [ ] 5. Container inspect/stats

**Dependencies**: Phase 0.3 complete

### 1.2 Image Management ⚪
- [ ] 1. Image pull from registry
- [ ] 2. Image push to registry
- [ ] 3. Image delete and prune
- [ ] 4. BuildKit integration
- [ ] 5. Multi-platform builds (`--platform`)
- [ ] 6. Image layer caching
- [ ] 7. Image filesystem exposure (`~/FlyingDutchman/images/`)

### 1.3 Storage ⚪
- [ ] 1. Bind mount support (`-v host:container`)
- [ ] 2. Named volumes (`docker volume create`)
- [ ] 3. Volume lifecycle management
- [ ] 4. Container filesystem exposure (`~/FlyingDutchman/containers/`)
- [ ] 5. Volume inspect and prune

---

## Entry Criteria

- [ ] Phase 0.3 complete (Runtime Abstraction)
- [ ] Phase 0.5 complete (Error Handling)

## Exit Criteria

Phase 1 is complete when:
- [ ] `docker run` equivalent works via runtime
- [ ] `docker-compose up` equivalent works
- [ ] Images can be pulled, built, and pushed
- [ ] Volumes persist across container restarts
- [ ] Filesystem exposure works in Finder

---

## Blockers

1. **Phase 0.3 incomplete**: Runtime abstraction must be finalized before container operations.

---

## Notes

- This phase enables the core value proposition
- Priority: Engine > Storage > Images (can pull images without full management)
- Test with common images: nginx, postgres, redis
