# Design: Integrate GhosttyKit Terminal Backend

## Current implementation
The `Shell` target implements a simple SwiftUI text field/area with pipes connecting to standard input/output streams of a sub-process. This fails to emulate terminal escapes, ANSI colors, tab completion, or cursor movements.

## Proposed implementation
Establish `Projects/Features/Terminal/` as a standalone feature module:
- Define `TerminalTarget` representing the target session type.
- Implement `GhosttyTerminalView` using the `GhosttyKit` native view.
- Wrap PTY and terminal options inside `GhosttyTerminalSession` implementing `TerminalSessionClient`.
- Bind keyboard inputs and resizing signals to the `GhosttyKit` layout managers.
- Keep the `GhosttyKit` dependency private to the `Terminal` feature implementation, preventing compilation issues in other modules (like core or domain).

```swift
public enum TerminalTarget: Equatable, Identifiable {
    case local(shell: String)
    case container(id: UUID, name: String)
    case machine(id: String, name: String)
    
    public var id: String {
        switch self {
        case .local(let shell): return "local-\(shell)"
        case .container(let id, _): return "container-\(id.uuidString)"
        case .machine(let id, _): return "machine-\(id)"
        }
    }
}
```

## Files likely touched
- `Projects/Features/Terminal/Sources/TerminalInterface/TerminalTarget.swift` (new)
- `Projects/Features/Terminal/Sources/Terminal/GhosttyTerminalView.swift` (new)
- `Projects/Features/Terminal/Sources/Terminal/GhosttyTerminalSession.swift` (new)
- `Package.swift` (add GhosttyKit package dependency)

## Architecture boundaries
- Do not let `GhosttyKit` types escape the boundaries of the `Terminal` feature target.
- Other feature targets must communicate only through `TerminalInterface` abstractions.

## Testing strategy
- Unit tests validating command arguments built for each target type.
- Verification of cleanup logic and process deallocation.
