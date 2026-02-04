# Tasks: Machines/Kubernetes/Debug Shell UI + K8s Domains

## 1) New Feature Modules (Machines/Kubernetes/DebugShell)
- Scope: `Projects/Features/Machines`, `Projects/Features/Kubernetes`, `Projects/Features/DebugShell`
- Deliverables:
  - Interface + implementation targets wired via Tuist and SwiftPM.
  - SwiftUI views: list/detail, create flow, kubeconfig copy.
- Acceptance:
  - App builds and new sidebar sections render without runtime crashes.
- Tests:
  - Build App scheme.

## 2) Shell Navigation + Command Palette
- Scope: `Projects/Features/Shell/**`
- Deliverables:
  - New `AppSection` entries and navigation destinations.
  - Command palette registry includes navigation + start/stop actions for machines/containers.
- Acceptance:
  - `⌘K` command palette lists sections and actions.
- Tests:
  - Build App scheme.

## 3) Debug Shell Launcher + CLI
- Scope: `Projects/Core/Shared/TerminalLauncher.swift`, `Projects/Product/CLI/Sources/Commands/Shell.swift`
- Deliverables:
  - Terminal launcher preferring Ghostty/iTerm/WezTerm/kitty/Terminal.
  - `fd shell <container>` runs exec with TTY.
- Acceptance:
  - Debug Shell button opens terminal and runs `fd shell`.
- Tests:
  - Manual smoke: `fd shell` against a running container.

## 4) Kubernetes Domain Routing
- Scope: `DomainRoutingTable`, `ContainerizationRuntime`, `VirtualizationRuntime`, `HTTPSProxy`, resolver installer
- Deliverables:
  - Register/unregister `*.k8s.flyingdutchman.local` + legacy `*.k8s.fd.local`.
  - DNS resolver installs new suffixes.
- Acceptance:
  - DNS resolves k8s domains to 127.0.0.1, proxy forwards to upstream.
- Tests:
  - Integration test for DNS resolution.

## 5) Specs and Roadmap Updates
- Scope: `openspec/specs/**`, `openspec/phases/**`, `openspec/ROADMAP.md`
- Deliverables:
  - Document new UI + domain behavior.
- Acceptance:
  - Specs align with implementation and roadmap reflects completion.
