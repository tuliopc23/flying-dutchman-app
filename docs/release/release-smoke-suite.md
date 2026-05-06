## Release candidate smoke suite

Run this before every release candidate handoff and whenever a candidate is rebuilt after a release-critical fix:

- `bash scripts/run-release-smoke-suite.sh`

This command is the minimum repeatable automated smoke gate for release-critical behavior. It intentionally covers only the fastest high-signal suites that exercise:

- app bootstrapping and navigation
- engine startup diagnostics
- CLI doctor and recovery help output
- resolver and CA trust status flows
- domain routing and port-forward lifecycle behavior
- persisted UI state and container event persistence
- machine and Kubernetes workflow state changes
- DNS server bring-up and container state transitions

### Included suites

- `AppLaunchTests`
- `CLIDoctorTests`
- `EngineStartupTests`
- `IntegrationValidationTests`
- `NetworkSetupManagerTests`
- `DomainRoutingTableTests`
- `PortForwardLifecycleTests`
- `UIStateStoreTests`
- `SettingsTests`
- `MachineListViewModelTests`
- `KubernetesListViewModelTests`
- `ContainerEventStoreTests`
- `ContainerStateMachineTests`
- `DNSServerTests`

### Notes

- The smoke suite is narrower than the full `swift test` gate and is intended to fail fast on release-critical regressions.
- `bash scripts/validate-release.sh` runs this smoke suite before the full package test pass.
- `bash scripts/validate-privileged-flows.sh` preflights the CLI validation surface and prints the manual resolver, CA trust, HTTPS, and port-forward commands for privileged smoke passes.
- Manual smoke for privileged networking, containers, machines, and Kubernetes remains required and is tracked separately in the release evidence checklist.

### Additional manual follow-up for v1 completion

- Run one `fd images pull ...` and one `fd images build <context>` check after the automated suite.
- Open Debug Shell and validate one embedded session plus one external terminal handoff.
- Trigger `Check for Updates…` once from the app menu or Settings and record whether the configured feed is reachable.
