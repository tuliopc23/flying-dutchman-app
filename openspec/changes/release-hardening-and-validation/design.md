## Context

Flying Dutchman is a multi-target macOS product with an App, Engine, CLI, and several domain modules that already have partial automated coverage. Recent audit work confirmed that the codebase can be moved into a release trajectory, but also revealed the need for a formal release gate, a complete test strategy, and explicit hardening requirements for product-critical workflows such as networking setup, diagnostics, settings persistence, and headless recovery.

The release work is cross-cutting: it touches SwiftPM/Tuist build health, feature modules, tests, user-facing diagnostics, and operator workflows. It also needs to preserve the project's modular architecture and avoid turning release preparation into an uncontrolled rewrite.

## Goals / Non-Goals

**Goals:**
- Define a release-quality contract for shipping the App, Engine, and CLI together.
- Define a full test suite strategy covering deterministic unit tests, integration tests, app smoke validation, and manual release checks for privileged flows.
- Eliminate ambiguous release status by replacing placeholder validation with explicit pass/fail gates.
- Harden product-critical workflows, especially settings, DNS/HTTPS setup, diagnostics, and CLI recovery.
- Produce an execution plan that can be implemented incrementally and verified continuously.

**Non-Goals:**
- Re-architect core runtime modules unless a release blocker requires it.
- Add broad new end-user feature scope unrelated to release quality.
- Introduce new dependencies unless a concrete blocker cannot be solved with the current stack.
- Guarantee zero compiler warnings in a single pass if warnings are outside release-critical paths.

## Decisions

### Decision 1: Organize release work into four workstreams
The change will be implemented as four parallelizable workstreams:
1. **Quality gates and CI validation**
2. **Automated test suite expansion**
3. **Product hardening and diagnostics**
4. **Release polish and manual sign-off**

This is preferred over a module-by-module rewrite because release readiness depends on evidence from multiple layers at once.

### Decision 2: Use a tiered validation model
Validation will be grouped into explicit tiers:
- **Tier 1:** per-target build validation (`App`, `Engine`, `CLI`)
- **Tier 2:** deterministic module and persistence tests
- **Tier 3:** integration tests for networking, domain routing, machines, and Kubernetes
- **Tier 4:** manual smoke checks for privileged or UI-critical release paths

This is preferred over relying on `swift test` alone because several release-critical workflows involve macOS permissions, system configuration, and user-observable UX.

### Decision 3: Treat placeholders and stubs as release debt with explicit classification
Placeholder tests, stub runtime paths, and warning-heavy code will be classified into:
- **P0 blockers:** must be resolved before release
- **P1 hardening items:** should be resolved before release candidate sign-off
- **P2 follow-up items:** acceptable post-release backlog

This is preferred over a blanket “fix everything first” approach because the current codebase mixes solid implementations with incomplete surfaces.

### Decision 4: Tighten existing capability specs only where release behavior changes
Existing capabilities such as `settings-efficiency`, `container-networking`, and `cli-headless` will receive focused delta specs for release-critical behavior. New cross-cutting expectations will live in new capabilities (`release-readiness`, `quality-assurance`) instead of forcing every existing spec to absorb release process details.

This is preferred over modifying every capability spec because it keeps the release contract explicit and auditable.

### Decision 5: Keep release evidence in-repo and reproducible
The implementation should produce a repeatable release checklist with commands, expected outputs, manual steps, and sign-off criteria. Build/test/manual evidence should be generated from repository commands and documented steps, not ad hoc tribal knowledge.

This is preferred over informal release notes because the project spans multiple executables and privileged workflows.

## Risks / Trade-offs

- **Manual validation remains necessary** → privileged macOS flows (resolver install, CA trust, virtualization) cannot be fully trusted from unit tests alone.
- **Release scope can expand indefinitely** → use P0/P1/P2 classification to keep the first release bounded.
- **CI may lag behind local validation** → define required local gates first, then automate the highest-value checks.
- **Warning cleanup can consume large effort** → prioritize warnings tied to release-critical correctness, concurrency, or networking behavior.
- **Product polish may surface missing UX states** → wire diagnostics and recovery flows before investing in aesthetic refinements.

## Migration Plan

1. Land this spec-driven change and agree on release scope for the first production candidate.
2. Inventory blockers across tests, stubs, warnings, packaging, and user-facing flows.
3. Implement P0 fixes and required test coverage by workstream.
4. Add or tighten automated gates so regressions fail early.
5. Run release-candidate validation: build, test, smoke, migration checks, package checks.
6. Resolve remaining P1 issues or explicitly defer them with documented rationale.
7. Produce release evidence and final sign-off record.

Rollback is operational rather than schema-driven: if a release candidate fails validation, revert the blocking change set or defer the candidate until the gate is green again.

## Open Questions

- Is the first public release expected to ship with the current external debug-shell approach, or must embedded terminal support be complete?
- What is the initial distribution path: local archive/notarized DMG, direct app bundle, or another installer workflow?
- Are legacy domain aliases such as `*.fd.local` still required for the first release, or can they be downgraded from release-critical support?