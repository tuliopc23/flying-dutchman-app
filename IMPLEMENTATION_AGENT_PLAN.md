# Agent Development Plan (Step-by-step)

This is a step-by-step plan for continuing Flying Dutchman development with AI agents.

## 0) Always start by reading context
1. `openspec/AGENTS.md` (this repo’s agent runbook)
2. `openspec/project.md` (stack + constraints)
3. `openspec/ROADMAP.md` (phase status)
4. The relevant capability spec in `openspec/specs/<capability>/spec.md`
5. The current phase status in `openspec/phases/<phase>/status.md`

## 1) Decide the next work item
Pick the *next* item based on the roadmap:
* If Phase 2 is active: focus on Networking deliverables (DNS, domains, HTTPS).
* If docs disagree (e.g. Phase 2 labeled UI/UX in `openspec/phases/phase-2/status.md` but Networking in `openspec/ROADMAP.md`): create a change to reconcile first.

## 2) Use the OpenSpec change workflow for non-trivial work
When adding features, dependencies, or changing architecture:
1. Create: `openspec/changes/<slug>/proposal.md`
2. Add: `openspec/changes/<slug>/tasks.md`
3. Reference impacted specs and modules.

## 3) Baseline health gate (must pass)
Before implementing new features:
1. Generate project: `tuist generate`
2. Lint: `./scripts/lint.sh`
3. Tests: `swift test`

If any fail, fix baseline first.

## 4) Testing strategy (default)
* Test framework: **Swift Testing** (`import Testing`).
* Add unit tests for:
    * parsing, allocators, state machines
    * persistence stores (in-memory DB)
* Add integration tests for:
    * EngineServer router + stub runtime

Avoid system tests in CI unless you have a self-hosted macOS 26 runner.

## 5) Phase 2 (Networking) recommended sequence
### 5.1 Reconcile Phase 2 documentation
* Create a change to reconcile:
    * `openspec/ROADMAP.md` (Phase 2 = Networking)
    * `openspec/phases/phase-2/status.md` (currently UI/UX)

### 5.2 DNS + Domains (Phase 2.2)
* Dependency: `orlandos-nl/DNSClient`
* Implement:
    * UDP DNS server on `127.0.0.1:5353`
    * `/etc/resolver/fd.local` installer
    * record mapping from persistence (container/service name → IP)
* Tests:
    * unit: DNS response generation
    * integration: allocate IP → record → resolve

### 5.3 HTTPS (Phase 2.3)
* Dependency: `apple/swift-certificates`
* Implement:
    * local CA generation + keychain trust flow
    * on-demand cert issuance for `*.fd.local`
    * reverse proxy / TLS termination in front of services

### 5.4 SSH support (Phase 3 / Remote)
* Dependency: `orlandos-nl/Citadel`
* Scope:
    * SSH to remote hosts / VM nodes
    * NOT default for local container shell

## 6) Phase 4.3 (Debug shell) transport rule
* Local debug shell uses **exec/attach over VSOCK**.
* Reference: `openspec/specs/debug-shell/transport-decision.md`

## 7) Definition of Done
A task is complete when:
* code compiles
* Swift Testing suites added/updated
* lint passes
* OpenSpec updated (spec + phase status + roadmap checkbox)

