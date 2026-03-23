## 1. Release Gate Foundation

- [x] 1.1 Create a release blocker inventory with P0, P1, and P2 classifications for tests, stubs, warnings, packaging, and UX gaps
- [x] 1.2 Define the required release gate commands for App, Engine, CLI, and automated test execution
- [x] 1.3 Add a reproducible release evidence checklist covering command output, manual smoke, build metadata, and sign-off

## 2. Automated Test Suite Expansion

- [x] 2.1 Replace placeholder app, engine, settings, and integration tests with behavior-based coverage
- [x] 2.2 Add deterministic tests for Settings and Shell state transitions, persisted defaults, and diagnostics surfaces
- [x] 2.3 Add or strengthen networking tests for resolver status, CA trust status, domain routing, and port-forward validation
- [x] 2.4 Add or strengthen workflow tests for Machines and Kubernetes create, inspect, and recovery flows
- [x] 2.5 Define the minimum smoke suite required for every release candidate and ensure it runs consistently

## 3. Product Hardening

- [x] 3.1 Audit user-critical stub and placeholder runtime paths and convert P0 cases into production-safe behavior or explicit failures
- [x] 3.2 Harden CLI diagnostics and recovery flows for engine health, resolver setup, and certificate trust
- [x] 3.3 Harden Settings to surface release-critical runtime status and recovery actions clearly
- [x] 3.4 Verify persisted defaults and migration-sensitive settings survive relaunch and existing user state
- [x] 3.5 Triage release-critical compiler warnings and concurrency/networking issues that could hide correctness problems

## 4. Validation and CI Enforcement

- [x] 4.1 Encode the required release gate into CI or scripted local validation steps so regressions fail early
- [x] 4.2 Add targeted validation commands for networking and privileged flows where full automation is not possible
- [ ] 4.3 Create a manual smoke matrix for container, machine, Kubernetes, DNS, HTTPS, and CLI recovery workflows
- [ ] 4.4 Verify candidate startup against existing persisted data and document rollback or deferral procedure for failed candidates

## 5. Product Polish for Release

- [ ] 5.1 Audit release-critical screens for empty, loading, error, and recovery states and close the most visible UX gaps
- [ ] 5.2 Review diagnostics, copy, and action labels for consistency across App, CLI, and Settings
- [ ] 5.3 Finalize release-facing packaging and metadata requirements, including distribution checklist inputs and known-issues notes

## 6. Final Candidate Sign-off

- [ ] 6.1 Run the full release gate and capture evidence for a release candidate
- [ ] 6.2 Resolve or explicitly defer remaining P1 items with rationale and follow-up ownership
- [ ] 6.3 Publish the final release readiness summary with pass/fail results and sign-off status