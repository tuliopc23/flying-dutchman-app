# Design: Establish Release Truth Baseline

## Current implementation
The repository is an advanced work-in-progress containing container management, VM virtualization (Machines), and Kubernetes configuration logic. However, the exact operational status of these modules is undocumented.

## Proposed implementation
Establish `docs/RELEASE-0.1-STATUS.md` as the definitive status document.
The status of each system component will be categorized as:
- **Done**: Fully working, tested, and ready.
- **Partial**: Partially implemented, requires further hardening.
- **Experimental**: Non-blocking feature, explicitly labeled.
- **Broken**: Code fails to run or compiles with issues.
- **Unknown**: Needs verification.
- **Out of 0.1 scope**: Deferred.

## Files likely touched
- `docs/RELEASE-0.1-STATUS.md` (new)
- `openspec/changes/release-0-1-baseline/` (new)

## Architecture boundaries
- No source code files in `Projects/` or `Sources/` will be modified.
- No SwiftPM dependencies are added.

## Testing strategy
- Run local validation script command sequence:
  ```bash
  swift package resolve
  swift build
  swift test
  swift run FlyingDutchmanCLI doctor
  ```
- Compare automated test results with documented findings.
