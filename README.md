# Flying Dutchman

**macOS Tahoe-only, Apple Silicon-only containerization management.**

Flying Dutchman is a local-first development tool providing first-class integration with Apple's native
Containerization framework. Built entirely in Swift 6.2, Flying Dutchman delivers an "it just works"
experience inspired by Orbstack—fast, intuitive, and native to macOS.

## Vision

- **Platform**: macOS 15.0+ (Tahoe), Apple Silicon only
- **Architecture**: 100% Swift 6.2 (app, engine, CLI)
- **Philosophy**: Local-first development, not enterprise infrastructure
- **Experience**: Zero-config defaults, guided workflows, ⌘K command palette
- **Integration**: Docker API compatibility, Kubernetes, AI agents via pluggable layers

See `.specify/memory/constitution.md` for complete project principles and governance.

### Design System
Built for macOS Tahoe 26+, Flying Dutchman uses a token-based design system inspired by the Netherlands national football team.

- **Palette**: Netherlands Orange (#FF6200), Royal Blue (#21468B), White.
- **Material**: Native Liquid Glass via `.glassEffect()`.
- **Typography**: SF Pro Display (Headings), SF Pro Text (Body), SF Mono (Code).
- **Guidelines**: [Design Token Reference](specs/002-design-system/design-tokens.md)
- **Showcase**: Run `DesignSystemShowcase.swift` in Xcode Previews.

## Status

🚧 **Early Development** - Constitution ratified, MVP planning in progress.
