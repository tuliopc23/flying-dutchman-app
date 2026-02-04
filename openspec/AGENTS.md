# OpenSpec Agent Guide (Flying Dutchman)

This document is the **authoritative runbook** for AI agents (and humans) contributing to Flying Dutchman.

## Read first (always)
* `openspec/project.md` (stack, constraints, conventions)
* `openspec/ROADMAP.md` (phase map and progress)
* The relevant spec under `openspec/specs/<capability>/spec.md`
* The current phase status under `openspec/phases/<phase>/status.md`

## Source of truth
* **Product/spec decisions**: `openspec/` (specs, phases, changes)
* **Build system**: **Tuist is source of truth** (per `openspec/project.md`)  
    * Keep SwiftPM (`Package.swift`) aligned, but treat Tuist as the canonical Xcode workspace generator.

## Hard constraints
* Target: **macOS 26+**
* Language/tooling: **Swift 6.2 + Xcode 26.2**
* Concurrency: Swift 6 strict concurrency (actors, Sendable).
* Persistence: **GRDB + SQLiteData** (SwiftData is intentionally not the primary persistence layer for this project).
* Documentation-first: do not guess Apple APIs/entitlements; document decisions.

## Workstream selection (how to pick what to do next)
1. Open `openspec/ROADMAP.md`.
2. Identify the active phase and the next unchecked items.
3. Open the phase status file and the relevant capability spec:
    * Networking: `openspec/specs/container-networking/spec.md`
    * Debug shell: `openspec/specs/debug-shell/spec.md`
4. If the roadmap and phase status disagree, create a **change** to reconcile the mismatch before implementing features.

## Standard agent workflow (step-by-step)
### Step 0 — Establish baseline
* Confirm the current branch and working tree is clean.
* Ensure you can generate the project:
    * `tuist generate`
* Ensure you can run the linters:
    * `./scripts/lint.sh`
* Ensure you can run tests locally:
    * `swift test`

If anything above fails, the next work item is to fix baseline health before feature work.

### Step 1 — Clarify the change
For any meaningful change (new capability, architecture shift, dependency, or spec ambiguity):
1. Create a change proposal folder:

    `openspec/changes/<slug>/`

2. Add `proposal.md` with:
    * **Why** (user value)
    * **What changes** (high-level)
    * **Impact** (modules/specs affected)
    * **Risks** (security, performance, compatibility)

3. If the change adds dependencies, also update `openspec/dependencies.md`.

### Step 2 — Turn the proposal into tasks
In the same change folder, add `tasks.md`:
* Break work into small, reviewable tasks.
* Each task should have:
    * Scope (files/modules)
    * Acceptance criteria
    * Test strategy (unit/integration)

### Step 3 — Design “seams” for testability
Before writing code, identify and formalize seams:
* Protocols for external systems (Keychain, networking, time, filesystem).
* Injectable dependencies using `swift-dependencies`.
* Avoid static singletons for anything you need to test deterministically.

### Step 4 — Implement smallest compiling slice
Implement the smallest vertical slice that compiles and runs:
* Add only what is needed to satisfy the next task.
* Prefer new files over heavily mutating existing ones.
* Keep module boundaries strict; avoid cycles.

### Step 5 — Tests (Swift Testing-first)
Default test framework: **Swift Testing** (`import Testing`).

Testing pyramid:
* Unit tests (fast, deterministic): parsing, allocators, state machines, stores with in-memory DB.
* Integration tests (still deterministic): EngineServer router with stub runtime.
* System tests (optional/manual): real Containerization runtime, Keychain, network resolver install.

Definition-of-done for code:
* New behavior has new tests.
* Tests run green locally.

### Step 6 — Update docs and specs
After implementation:
* Update the relevant `openspec/specs/.../spec.md` if behavior changed.
* Update the phase status file.
* Update `openspec/ROADMAP.md` checkboxes if tasks are complete.

### Step 7 — Validation checklist
Before opening a PR:
* `./scripts/lint.sh`
* `swift build` (or `tuist generate` + Xcode build)
* `swift test`
* Manual smoke test if feature touches runtime/networking.

## Dependency policy (must follow)
When adding a dependency:
1. Verify it is actively maintained and Swift 6 compatible.
2. Add to:
    * `Package.swift`
    * `Tuist/Project.swift`
    * `openspec/dependencies.md` (rationale, alternatives)
3. Prefer minimal surface area; isolate behind protocols.

## Phase-focused guidance
### Phase 2: Networking (DNS + domains + HTTPS)
Suggested order:
1. Align roadmap/status docs for Phase 2 (currently inconsistent naming).
2. Stabilize port forwarding + IP allocation boundaries.
3. Implement `.flyingdutchman.local` DNS server on UDP 5353 + `/etc/resolver/flyingdutchman.local` installer (keep legacy `.fd.local`).
4. Add HTTPS (local CA + cert issuance + proxy) only after DNS is stable.

### Phase 4.3: Debug shell
* Local debug shell transport is **exec/attach over VSOCK** (see `openspec/specs/debug-shell/transport-decision.md`).
* SSH is optional for remote hosts/VM nodes, not the default for local containers.

## Known repo mismatches to resolve early
* `AGENTS.md` references `openspec/AGENTS.md` (this file) — keep it updated.
* Tuist deployment target should align with macOS 26+.
* Some docs label Phase 2 as UI/UX; roadmap labels Phase 2 as Networking — reconcile in OpenSpec.

## AI-agent tooling in this repo
There are agent prompt files under `.github/agents` and `.github/prompts`.

Note: some `speckit.*` agents reference `.specify/` scripts. If `.specify/` is not present in the repo, either:
* add the missing tooling, or
* update the agents/prompts to use the OpenSpec change workflow described above.
