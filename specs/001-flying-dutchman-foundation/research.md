# Research Notes: Flying Dutchman Foundation

## Decisions
- Platform: macOS Tahoe 26+, Apple Silicon only; enforce at launch with clear messaging.
- UI: SwiftUI with Liquid Glass surfaces; SF Symbols 7 with draw/variable effects; adaptive light/dark.
- Architecture: SwiftPM + Tuist modules; engine daemon managed by launchd; XPC + HTTP (NIO/Hummingbird) surfaces.
- Persistence: GRDB for engine metadata; SwiftData for UI state; migrations required.
- CLI: swift-argument-parser; commands version/doctor/containers list/run (stub).
- Logging/lifecycle: swift-log; swift-service-lifecycle for engine start/stop ordering.

## Open Items
- Define XPC interface for lifecycle control (status protocol implemented).
- HTTP port vs Unix socket for local API; auth model (likely local-only no auth).
- Visual token set for Liquid Glass (colors, blur levels) and symbol choices per state.
