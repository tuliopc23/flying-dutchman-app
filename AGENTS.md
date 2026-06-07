You are an experienced, pragmatic software engineering AI agent. Do not over-engineer a solution when a simple one is possible. Keep edits minimal. If you want an exception to ANY rule, you MUST stop and get permission first.

# AGENTS Guide

## Project Overview
Flying Dutchman is a modular macOS container platform built around Apple’s containerization and virtualization stack. The product includes a macOS app, a background engine, and a CLI (`fd`) for managing containers, images, volumes, networks, Linux machines, and Kubernetes workflows.

Primary project constraints:
- Target **macOS 26+**.
- Use **Swift 6.2** with strict concurrency expectations.
- Treat **Tuist** as the canonical project generator; keep `Package.swift` aligned, but do not treat SwiftPM as the only source of truth.
- Use **GRDB + SQLiteData** for persistence. Do **not** introduce SwiftData as the primary persistence layer.
- Product and design decisions live in `openspec/` and should be updated when behavior changes.

Core technologies in repo today:
- Swift / SwiftUI
- Tuist workspace generation (`Workspace.swift`, `Tuist/` helpers)
- SwiftPM package definition (`Package.swift`)
- GRDB, SQLiteData, swift-dependencies
- Hummingbird + AsyncHTTPClient
- Apple Containerization + Virtualization ecosystem

## Reference
### Read first
1. `openspec/project.md` — constraints, stack, conventions.
2. `openspec/ROADMAP.md` — current feature reality and priorities.
3. `openspec/phases/<phase>/status.md` — phase-level execution status.
4. Relevant spec in `openspec/specs/<capability>/spec.md`.
5. `docs/release/release-evidence-checklist.md` and `docs/release/release-smoke-suite.md` for release-sensitive work.

### Important files
- `Workspace.swift` — Tuist workspace includes `Projects/Core`, `Projects/Domain`, `Projects/Features`, `Projects/Product`.
- `Package.swift` — SwiftPM mirror of products, dependencies, and tests.
- `Tuist/ProjectDescriptionHelpers/` — shared project-generation helpers.
- `.swiftformat` / `.swiftlint.yml` — formatting and lint rules.
- `scripts/lint.sh` — repo lint entrypoint.
- `scripts/run-release-smoke-suite.sh` — fast release smoke filter.
- `scripts/validate-release.sh` — build + smoke + full test release gate.
- `scripts/validate-privileged-flows.sh` — preflight and manual privileged networking checks.

### Architecture map
- `Projects/Core/*` — foundational modules such as `Shared`, `DesignSystem`, `UIComponents`, `Persistence`.
- `Projects/Domain/*` — runtime and service modules such as `ContainerKit`, `NetworkKit`, `KubeKit`, `AIKit`.
- `Projects/Features/*` — feature modules with separate interfaces/implementations/tests/examples.
- `Projects/Product/App|CLI|Engine` — end-user products.
- `Tests/` — package-level tests; this repo currently mixes **Swift Testing** and **XCTest**.
- `Sources_Backup/` — historical backup code; do not treat it as the active implementation target unless a task explicitly requires it.

### Dependency direction
Prefer this layering:
- Core → Domain → Features → Product
- Feature implementations may depend on core/domain modules.
- Features should not casually depend on each other.
- Add seams for external systems through protocols and injected dependencies.

## Essential Commands
Run from repo root.

### Build
```bash
swift build
swift build --target FlyingDutchmanApp
swift build --target FlyingDutchmanEngine
swift build --target FlyingDutchmanCLI
```

### Project generation / workspace
```bash
tuist generate
```

### Format / lint
```bash
swiftformat Projects Tests --config .swiftformat
./scripts/lint.sh
```
Notes:
- `./scripts/lint.sh` runs SwiftFormat in lint mode plus SwiftLint.
- CI currently runs `.github/workflows/lint.yml`.

### Test
```bash
swift test
swift test --filter 'AppLaunchTests|CLIDoctorTests|EngineStartupTests'
bash scripts/run-release-smoke-suite.sh
```

### Clean
```bash
swift package clean
rm -rf .build
```
If Tuist artifacts are the problem, regenerate the workspace after cleaning.

### Development / local runtime
```bash
swift run FlyingDutchmanEngine
swift run FlyingDutchmanCLI doctor
swift run FlyingDutchmanCLI start --daemon --wait
swift run FlyingDutchmanCLI stop
```
Treat the engine process as the closest thing to a local dev server in this repo.

### Other important scripts
```bash
bash scripts/validate-release.sh
bash scripts/validate-privileged-flows.sh --help
```
Use these before release-sensitive handoff work.

## Patterns
### OpenSpec-first workflow
For meaningful feature work, do not jump straight into code. First check roadmap/spec/phase docs. If behavior, scope, or architecture changes, add or update the relevant files under `openspec/`.

### Small, testable seams
Prefer protocols and injected dependencies for anything non-deterministic: networking, keychain, time, filesystem, runtime services. Avoid static singletons when tests need deterministic control.

### Smallest compiling slice
Make the narrowest change that compiles. Prefer adding a focused file or module-local type over broad rewrites.

### Testing expectations
- Prefer **Swift Testing** for new tests unless existing nearby coverage is clearly XCTest-only.
- Keep tests deterministic and host-light where possible.
- Add/update tests for new behavior, especially in stores, routing, state machines, and CLI diagnostics.
- For release-critical work, run the smoke suite in addition to targeted tests.

## Anti-patterns
- **Do not treat `Package.swift` as the only build truth.** Tuist is canonical here.
- **Do not guess Apple APIs or entitlements.** Check Apple docs and capture decisions in `openspec/`.
- **Do not use `Sources_Backup/` as your editing target** for normal work.
- **Do not introduce broad cross-feature coupling.** Keep module boundaries strict.
- **Do not leave roadmap/spec mismatches unresolved** if they affect the feature you are changing.
- **Do not ignore existing TODO/FIXME markers** in touched areas; either respect them or explicitly explain why they remain.

## Code Style
Follow repository automation first:
- SwiftFormat: 4-space indentation, max width 120, argument/collection wrapping before first item.
- SwiftLint: sorted imports, explicit init, and the configured file/type length thresholds.

Practical style rules for this codebase:
- Prefer explicit, readable names over clever abstractions.
- Respect Swift 6 concurrency (`Sendable`, actor isolation, async/await).
- Avoid `@unchecked Sendable` unless documented and justified.
- Match the surrounding module’s style before introducing a new local convention.

## Commit and Pull Request Guidelines
### Before committing
At minimum, run the smallest relevant validation set for your change:
```bash
./scripts/lint.sh
swift test
```
For release-sensitive or cross-product work also run:
```bash
bash scripts/run-release-smoke-suite.sh
bash scripts/validate-release.sh
```
If privileged networking or trust flows changed, also use:
```bash
bash scripts/validate-privileged-flows.sh --help
```

### Commit messages
Recent history uses concise, typed summaries such as:
- `feat(ui): ...`
- `chore(sentry): ...`
- `Implement ...`
- `Update ...`

Default to:
```text
type(scope): short imperative summary
```
Examples: `feat(networking): add resolver status banner`, `fix(cli): harden doctor recovery output`.

### Pull requests
No PR template is present, so include these explicitly:
- what changed
- why it changed
- files/modules affected
- validation performed, with exact commands
- screenshots or terminal output for UI/CLI changes
- follow-up work, risks, or deferred items

## Agent-Specific Notes
- Keep edits minimal and reviewable.
- Verify repo facts before making claims; if unsure, say so.
- If asked to remember a durable repo lesson, encode it in this file or in a nearby code comment as appropriate.
- For desktop UI automation loops, use a dedicated desktop-capable agent rather than improvising inline.

<!-- BEGIN BEADS INTEGRATION v:1 profile:minimal hash:ccf33ec3 -->
## Beads Issue Tracker

This project uses **bd (beads)** for issue tracking. Run `bd prime` to see full workflow context and commands.

### Quick Reference

```bash
bd ready              # Find available work
bd show <id>          # View issue details
bd update <id> --claim  # Claim work
bd close <id>         # Complete work
```

### Rules

- Use `bd` for ALL task tracking — do NOT use TodoWrite, TaskCreate, or markdown TODO lists
- Run `bd prime` for detailed command reference and session close protocol
- Use `bd remember` for persistent knowledge — do NOT use MEMORY.md files

**Architecture in one line:** issues live in a local Dolt DB; sync uses `refs/dolt/data` on your git remote; `.beads/issues.jsonl` is a passive export. See https://github.com/gastownhall/beads/blob/main/docs/SYNC_CONCEPTS.md for details and anti-patterns.

## Session Completion

**When ending a work session**, you MUST complete ALL steps below. Work is NOT complete until `git push` succeeds.

**MANDATORY WORKFLOW:**

1. **File issues for remaining work** - Create issues for anything that needs follow-up
2. **Run quality gates** (if code changed) - Tests, linters, builds
3. **Update issue status** - Close finished work, update in-progress items
4. **PUSH TO REMOTE** - This is MANDATORY:
   ```bash
   git pull --rebase
   bd dolt push
   git push
   git status  # MUST show "up to date with origin"
   ```
5. **Clean up** - Clear stashes, prune remote branches
6. **Verify** - All changes committed AND pushed
7. **Hand off** - Provide context for next session

**CRITICAL RULES:**
- Work is NOT complete until `git push` succeeds
- NEVER stop before pushing - that leaves work stranded locally
- NEVER say "ready to push when you are" - YOU must push
- If push fails, resolve and retry until it succeeds
<!-- END BEADS INTEGRATION -->
