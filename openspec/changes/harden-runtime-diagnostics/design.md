# Design: Harden Runtime Diagnostics and First-Run Setup

## Current implementation
The app contains placeholder checks for runtime selection, and the engine starts up with default configuration without deep diagnostic reports. Fallbacks between runtimes may occur silently if exceptions are caught.

## Proposed implementation
Introduce a formal `DiagnosticReport` struct in `Shared` that encapsulates:
- `runtimeMode`: `.native` | `.cli` | `.stub`
- `isAppleContainerizationAvailable`: Bool
- `isKernelPresent`: Bool
- `isInitfsPresent`: Bool
- `engineStatus`: `.reachable` | `.unreachable` | `.stopped`
- `xpcStatus`: `.connected` | `.disconnected`
- `databaseWriteStatus`: `.ok` | `.error(String)`
- `osVersion`: String
- `architecture`: String

Wire this struct to the app's diagnostic interface view (`DiagnosticsFeature`) and CLI doctor command. In release builds, if `runtimeMode` resolves to `.stub`, the app will display a critical blocking banner preventing container interaction.

## Files likely touched
- `Projects/Core/Shared/Sources/Models/DiagnosticReport.swift`
- `Projects/Features/Diagnostics/Sources/Diagnostics/DiagnosticsView.swift`
- `Projects/Product/CLI/Sources/Commands/Doctor.swift`

## Architecture boundaries
- Ensure `DiagnosticReport` is fully `Sendable`.
- Avoid hardcoding machine paths; resolve relative to app support directories or environment variables.

## Testing strategy
- Unit test environmental check logic by stubbing virtualization framework presence.
- Test JSON encoding/decoding of the diagnostic report.
- Verify CLI error exit codes on diagnostic failures.
