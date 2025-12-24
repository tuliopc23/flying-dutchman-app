# Project Context

## Purpose
Flying Dutchman is a macOS-native app for containerization, virtualization, and Kubernetes development. It provides a modern SwiftUI UX around Apple-first containerization and virtualization workflows, similar in scope to OrbStack.

## Tech Stack
- Swift 6.2
- Xcode 26.2
- macOS 26+ (Tahoe)
- SwiftUI UI layer
- SwiftData persistence target (goal; currently using GRDB in codebase)
- Tuist for project generation (source of truth)
- Multi-target architecture (App + Engine + CLI + Framework modules)

## Project Conventions

### Code Style
- Use Swift 6 strict concurrency (Sendable, actor isolation, async/await).
- Avoid @unchecked Sendable unless documented and justified.
- Prefer small, well-scoped modules with explicit dependencies.

### Architecture Patterns
- App target depends on feature and core modules.
- Features depend on Core modules, not on each other.
- Persistence isolated in a dedicated module.
- Networking and runtime services isolated in dedicated modules.

### Testing Strategy
- Each new module requires smoke tests.
- Business logic requires deterministic tests.
- UI tests only when requested or UI-critical.

### Git Workflow
- TBD by team.

## Domain Context
- macOS-only: iOS does not support Containerization or Virtualization.
- Primary goal is full containerization workflow parity before debug shell.
- Debug shell will use libghosted for terminal emulation (pending evaluation).

## Important Constraints
- Documentation-first API usage; no guessing of Apple APIs or entitlements.
- Must align with Apple Developer Documentation and Tuist docs.
- Prioritize containerization workflows before experimental features.

## External Dependencies
- SwiftPM dependencies are listed in `Package.swift`.
- Tuist dependencies are listed in `Tuist/Project.swift`.
- Any new dependencies require Swift Package Index review.
