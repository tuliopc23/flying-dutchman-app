## Release evidence checklist

Capture this for each release candidate:

### Automated validation

- [ ] `swift build --target FlyingDutchmanApp`
- [ ] `swift build --target FlyingDutchmanEngine`
- [ ] `swift build --target FlyingDutchmanCLI`
- [ ] `bash scripts/run-release-smoke-suite.sh`
- [ ] `swift test`
- [ ] `bash scripts/validate-release.sh`

### Manual smoke validation

- [ ] `bash scripts/validate-privileged-flows.sh [--sample-host <running-container-name>] [--port-forward-url <url>]`
- [ ] Launch app and verify dashboard, containers, settings, diagnostics, and command palette basic navigation
- [ ] Verify Images pull/build flows from app and CLI
- [ ] Verify Debug Shell embedded session opens plus external-terminal fallback
- [ ] Verify Check for Updates… from app menu, settings, or menu bar
- [ ] Verify settings health states for DNS resolver and CA trust
- [ ] Validate CLI diagnostics and recovery flows for engine/re resolver/CA trust
- [ ] Validate one container workflow end-to-end
- [ ] Validate one machine workflow end-to-end
- [ ] Validate one Kubernetes workflow end-to-end
- [ ] Validate DNS resolution, HTTPS routing, and port-forward access manually

### Candidate metadata

- [ ] Commit SHA recorded
- [ ] Validation date recorded
- [ ] Operator recorded
- [ ] Remaining warnings classified as repo-owned vs third-party dependency warnings
- [ ] Sparkle appcast URL, signing key, and release artifact location recorded
- [ ] Deferred P1/P2 issues recorded with rationale
- [ ] Final sign-off decision recorded