# Design: OpenSpec System for Flying Dutchman

## Context

Flying Dutchman is a multi-target macOS container platform requiring a structured spec-driven development system. The app has:
- **3 executables**: App (SwiftUI), Engine (daemon), CLI
- **6 library modules**: Networking, Persistence, Containers, Kubernetes, AI, Shared
- **11 capability areas** defined in `openspec/specs/`

We need a robust tracking system to:
1. Define all functionality with testable requirements
2. Track implementation phases across modules
3. Resume work after interruptions
4. Coordinate dependencies and packages

## Goals / Non-Goals

### Goals
- Complete capability specifications with implementation phases
- Clear dependency graph between capabilities and modules
- Phase tracking with resume support
- Package/dependency registry with justification

### Non-Goals
- Automated code generation from specs (future consideration)
- CI/CD integration (separate concern)
- User documentation generation (separate concern)

## Decisions

### Decision 1: Hierarchical Phase Structure
**What**: Organize implementation into 5 major phases, each with sub-phases and tasks.
**Why**: Allows granular tracking while maintaining high-level overview.

Phases:
1. **Foundation** (Phase 0): Core infrastructure, persistence, shared utilities
2. **Container Core** (Phase 1): Container engine, storage, image management
3. **Networking** (Phase 2): Container networking, DNS, domains, HTTPS
4. **Platform** (Phase 3): Linux machines, Kubernetes, CLI/headless
5. **UX Polish** (Phase 4): Menu bar, command palette, debug shell, settings

### Decision 2: Module-to-Capability Mapping
**What**: Explicit mapping of which modules implement which capabilities.
**Why**: Prevents scope creep and clarifies ownership.

```
FlyingDutchmanContainers → container-engine, container-storage, image-management
FlyingDutchmanNetworking → container-networking
FlyingDutchmanKubernetes → kubernetes-dev
FlyingDutchmanPersistence → (cross-cutting: all capabilities)
FlyingDutchmanApp → menu-bar, command-palette, debug-shell, settings-efficiency
FlyingDutchmanCLI → cli-headless
FlyingDutchmanEngine → (orchestrates all runtime capabilities)
Shared → (cross-cutting: logging, errors, types)
```

### Decision 3: Status Tracking via `status.md`
**What**: Each phase directory contains a `status.md` with completion state.
**Why**: Single source of truth for phase completion, machine-parseable.

Format:
```markdown
# Phase Status: [Phase Name]
phase: 1
status: in-progress | blocked | completed | not-started
started: 2025-12-24
updated: 2025-12-24
blockers: [list of blocking issues]

## Sub-phases
- [x] 1.1 Container lifecycle models
- [ ] 1.2 Runtime abstraction layer
```

### Decision 4: Dependency Registry
**What**: `openspec/dependencies.md` documents all packages with purpose and evaluation status.
**Why**: Prevents unreviewed dependencies, documents rationale.

## Risks / Trade-offs

| Risk | Mitigation |
|------|------------|
| Over-specification slows iteration | Keep specs minimal; add detail as needed |
| Phase boundaries too rigid | Allow parallel work on independent items |
| Status tracking becomes stale | Enforce status update in PR checklist |

## Migration Plan

1. Archive existing `add-spec-system` after completing this design
2. Create phase directories under `openspec/phases/`
3. Expand capability specs with implementation requirements
4. Create tracking dashboard in `openspec/ROADMAP.md`

## Open Questions

- Should we integrate with GitHub Projects for visual tracking?
- Terminal emulation library: libghosted vs SwiftTerm?
