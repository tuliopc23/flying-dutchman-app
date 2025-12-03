<!--
  SYNC IMPACT REPORT
  ==================
  Version Change: NONE → 1.0.0
  Change Type: INITIAL_RATIFICATION
  
  Added Principles:
  - I. Platform Constraints (macOS Tahoe + Apple Silicon only)
  - II. Native-First Architecture (Apple frameworks prioritized)
  - III. Swift-Only Stack (100% Swift 6.2)
  - IV. Local-First Philosophy (developer tools, not enterprise)
  - V. "It Just Works" Experience (Orbstack-like simplicity)
  - VI. Minimal, Surgical Changes (change only what's necessary)
  - VII. Opinionated Over Generic (workflows over wrappers)
  
  Added Sections:
  - Architecture Mandates (three-layer structure, XPC/gRPC patterns)
  - UX & Design Standards (Liquid Glass design system)
  - Integration Strategy (compatibility layers, not emulation)
  - Quality & Developer Experience (Tuist, linting, logging)
  - Explicit Non-Goals (what we DON'T do)
  - Development Methodology (spike → MVP → phased features)
  
  Templates Requiring Updates:
  ✅ plan-template.md - Constitution Check section aligns with principles
  ✅ spec-template.md - Requirements structure compatible
  ✅ tasks-template.md - Task organization supports phased methodology
  
  Follow-up TODOs: None
-->

# Glacier Constitution

## Core Principles

### I. Platform Constraints (NON-NEGOTIABLE)

**macOS Tahoe-only, Apple Silicon-only.**

- MUST target macOS 15.0+ (Tahoe) exclusively
- MUST support Apple Silicon (arm64) exclusively
- MUST NOT include Intel (x86_64) support or backward compatibility for pre-Tahoe macOS
- MUST NOT compromise native functionality for cross-platform portability

**Rationale**: Focusing exclusively on the latest platform enables first-class integration with
Apple's native Containerization framework and newest APIs. Supporting legacy platforms dilutes
engineering focus and prevents leveraging cutting-edge capabilities that define Glacier's value
proposition.

### II. Native-First Architecture

**Apple's native frameworks take precedence over third-party or cross-platform alternatives.**

- MUST use Apple's native frameworks when available:
  - Containerization framework for container management
  - Virtualization.framework for VM capabilities
  - SwiftUI for all user interface development
  - Combine or async/await for concurrency
  - Network.framework for networking
- MUST prefer direct API usage over CLI wrappers or shelling out
- MUST justify any third-party dependency against native alternative

**Rationale**: Native frameworks provide superior performance, tighter system integration, better
error handling, and forward compatibility with future macOS releases. Cross-platform compromises
undermine the "it just works" experience.

### III. Swift-Only Stack

**100% Swift 6.2 for app, engine, and CLI. Single language, shared types, unified codebase.**

- MUST implement all components in Swift 6.2
- MUST leverage strict concurrency checking (Swift 6 language mode)
- MUST share type definitions across layers (UX, Engine, CLI)
- MUST NOT introduce Objective-C, Python, Go, or other languages except for integration with
  existing tools

**Rationale**: A single-language stack eliminates context switching, enables seamless code reuse,
provides compile-time safety across boundaries, and leverages Swift's modern concurrency features
for robust async operations.

### IV. Local-First Philosophy

**Development tooling for local workflows, not enterprise infrastructure or production clusters.**

- MUST optimize for single-developer, local-machine workflows
- MUST prioritize fast iteration, quick feedback, and immediate results
- MUST NOT add enterprise features (RBAC, multi-tenancy, audit logs) unless clearly justified
- MUST keep resource usage lightweight (CPU, memory, storage)

**Rationale**: The target user is a developer building and testing locally. Bloating the tool with
enterprise features creates complexity that slows down the primary use case and increases
maintenance burden.

### V. "It Just Works" Experience

**Inspired by Orbstack: fast, intuitive, no configuration required for common tasks.**

- MUST provide zero-configuration defaults for common workflows
- MUST optimize for perceived and actual performance
- MUST hide complexity behind sensible abstractions
- MUST surface advanced options only when requested
- MUST recover gracefully from errors with actionable guidance

**Rationale**: Developers abandon tools that require extensive setup or are slow. Glacier competes
on user experience—speed, clarity, and simplicity are non-negotiable product differentiators.

### VI. Minimal, Surgical Changes

**Change only what is necessary. Preserve working code. Avoid scope creep.**

- MUST make the smallest possible modification to achieve the goal
- MUST NOT refactor unrelated code unless it blocks the task
- MUST NOT fix unrelated bugs or tests during feature work
- MUST validate changes don't break existing behavior
- MUST justify complexity increases

**Rationale**: Surgical changes reduce regression risk, speed up reviews, and maintain focus.
Large-scale refactors hide functional changes and introduce unpredictable side effects.

### VII. Opinionated Over Generic

**Guided workflows and wizards for common tasks, not generic GUI wrappers around every flag.**

- MUST design for the 80% use case with opinionated defaults
- MUST provide command palette (⌘K) for power-user workflows
- MUST offer wizards for multi-step, complex operations
- MUST expose advanced/raw interfaces only when explicitly requested
- MUST NOT expose every CLI flag in the UI unless user opts into "advanced mode"

**Rationale**: Generic wrappers overwhelm users with options. Opinionated interfaces reduce
cognitive load and accelerate task completion for the majority of workflows.

## Architecture Mandates

**Three-layer architecture with clear separation of concerns:**

1. **UX Layer**: SwiftUI-based macOS application
   - Implements Liquid Glass design system
   - Communicates with Local Engine via XPC or gRPC
   - Follows macOS Tahoe Human Interface Guidelines

2. **Local Engine**: Swift daemon running privileged/background operations
   - Manages Apple Containers via Containerization framework
   - Manages VMs via Virtualization.framework
   - Exposes XPC for fast, low-latency control
   - Exposes HTTP/gRPC for external tool integration

3. **Integrations & CLIs**: Compatibility and interoperability layers
   - Docker API translation (not emulation)
   - Kubernetes via SwiftkubeClient (native async/await)
   - AI agent integration via Agent Communication Protocol (ACP)
   - kubectl, docker CLI compatibility via adapters

**Modularity requirements:**

- MUST use Tuist for project management and modularization
- MUST define clear module boundaries with minimal coupling
- MUST enable independent testing of modules
- MUST support pluggable backends (K8s, Nomad, LocalStacks) where applicable

**Communication patterns:**

- MUST use XPC for privileged, low-latency engine control
- MUST use HTTP/gRPC for external tool integration
- MUST define versioned protocols for backward compatibility

## UX & Design Standards

**Liquid Glass design system aligned with macOS Tahoe HIG:**

- MUST use SF Symbols 7 with draw animations and variable states
- MUST support dark/light modes with proper contrast and blur effects
- MUST implement app-centric views (not resource-centric complexity)
- MUST provide guided flows and wizards for common tasks
- MUST implement command palette (⌘K) as primary power-user interface
- MUST integrate with macOS features:
  - Shortcuts (automation)
  - Spotlight (quick launch)
  - Quick Actions (context menus)
  - Launchd (background services)

## Integration Strategy

**Compatibility layers for existing tools, not full emulation:**

- Docker API compatibility through translation
  - Translate Docker API calls to Apple Container operations
  - Support common docker CLI commands via adapter
  - Do NOT fully emulate Docker Engine

- Kubernetes integration via SwiftkubeClient
  - Native Swift async/await for K8s API interactions
  - Support local K8s clusters (kind, k3s) via pluggable backends
  - Do NOT reimplement kubectl

- AI agent integration (Stakpak)
  - Well-defined protocols (Agent Communication Protocol)
  - Use existing tools; do NOT rebuild DevOps AI from scratch

**Optional compatibility layers are not the primary architecture.**

## Quality & Developer Experience

**Tooling and practices for maintainability:**

- MUST use Tuist for project generation and modularization
- MUST use SwiftLint + SwiftFormat for code consistency (enforce existing rules only)
- MUST prefer Swift macros over Sourcery; use Sourcery only for Swift macro limitations
- MUST implement comprehensive logging:
  - swift-log for structured, filterable logging
  - OSLog for system-level diagnostics and performance tracing
- MUST maintain existing tests; only add new tests when explicitly required
- MUST avoid external tool dependencies unless absolutely necessary

**Testing philosophy:**

- MUST run only existing linters, builds, and tests unless task requires new ones
- MUST fix only test failures related to the current task
- MUST ignore unrelated bugs or broken tests

## Explicit Non-Goals

**What Glacier does NOT do:**

- **No Intel Mac support**: Apple Silicon only, no x86_64 builds
- **No pre-Tahoe macOS support**: macOS 15.0+ only
- **Not an enterprise infrastructure product**: No multi-tenancy, advanced RBAC, or audit
- **Not a VM manager**: VMs are a secondary feature; Apple Containers are primary
- **Not reimplementing excellent tools**: Use Stakpak for DevOps AI; integrate, don't rebuild

## Development Methodology

**Phase-based, spike-driven development:**

1. **Spike / Proof of Concept**: Validate core assumptions with throwaway code
2. **MVP**: Apple Containers first-class experience only
3. **Secondary features**: Kubernetes, VMs, AI integration ONLY after MVP is solid
4. **Innovation through integration**: Leverage native macOS capabilities, not feature parity races

**Milestone-based planning:**

- Each phase has clear acceptance criteria
- Features are independently testable and deliverable
- User stories prioritized (P1 = MVP, P2/P3 = enhancements)

## Governance

This constitution supersedes all other practices, guidelines, and conventions. All design
decisions, implementation plans, and code changes MUST align with these principles.

**Amendment process:**

- Amendments require documentation of rationale, scope, and migration plan
- Version bump follows semantic versioning:
  - MAJOR: Backward-incompatible governance changes, principle removals/redefinitions
  - MINOR: New principles, sections, or material expansions
  - PATCH: Clarifications, wording, typo fixes, non-semantic refinements

**Compliance:**

- All feature specifications MUST pass constitution check before Phase 0 research
- All implementation plans MUST re-check after Phase 1 design
- Code reviews MUST verify alignment with principles
- Complexity violations MUST be justified in plan.md Complexity Tracking section

**Version**: 1.0.0 | **Ratified**: 2025-12-03 | **Last Amended**: 2025-12-03
