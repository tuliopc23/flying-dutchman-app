## Release blocker inventory

### P0 — must be green for release

- [x] App target compiles successfully
- [x] Engine target compiles successfully
- [x] CLI target compiles successfully
- [x] `swift test` passes
- [x] Placeholder tests for all release-critical workflows are replaced
- [ ] Release validation entrypoint is run and evidence captured for the candidate

### P1 — should be resolved before release candidate sign-off

- [ ] Replace remaining trivial smoke tests, including CLI doctor coverage, with behavior-based Swift Testing
- [x] Audit and reduce release-critical networking/concurrency/deprecation warnings
  - Removed the unused `SwiftPackageScripts` dependency from `Package.swift`, eliminating the repo-owned package warning from release validation.
  - Remaining warnings in `bash scripts/validate-release.sh` come from third-party package plugin code under `.build/checkouts` (`grpc-swift` and `swift-protobuf`) rather than application, engine, CLI, or test sources.
- [ ] Validate privileged networking flows manually: resolver install, CA trust, HTTPS routing, port forwarding
- [ ] Validate machine and Kubernetes create/start/inspect/recovery workflows manually
- [ ] Audit user-facing stub/runtime fallback paths and convert critical ones into production-safe UX

### P2 — acceptable follow-up only if explicitly deferred

- [ ] Broader warning cleanup outside release-critical paths, including third-party package plugin deprecation/sendability warnings from `grpc-swift` and `swift-protobuf`
- [ ] Additional cross-module UI polish outside the release checklist
- [ ] Post-release expansion of long-running integration and end-to-end suites