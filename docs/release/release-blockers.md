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
- [ ] Audit and reduce release-critical networking/concurrency/deprecation warnings
- [ ] Validate privileged networking flows manually: resolver install, CA trust, HTTPS routing, port forwarding
- [ ] Validate machine and Kubernetes create/start/inspect/recovery workflows manually
- [ ] Audit user-facing stub/runtime fallback paths and convert critical ones into production-safe UX

### P2 — acceptable follow-up only if explicitly deferred

- [ ] Broader warning cleanup outside release-critical paths
- [ ] Additional cross-module UI polish outside the release checklist
- [ ] Post-release expansion of long-running integration and end-to-end suites