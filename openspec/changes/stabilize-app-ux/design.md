# Design: Stabilize App UX for Release

## Current implementation
The application screens show simple SwiftUI lists that are empty or show a basic loading spinner. There is no alert before deletion, and removing an active selection results in an empty detail view or a crash.

## Proposed implementation
Harden the UI layer:
- Build a generic `EmptyStateView` containing an icon, title, description, and action button.
- Build an `UnavailableOverlay` for blocking errors (e.g. Engine offline).
- Modify the sidebar navigation coordinator to watch resource deletion events; if a deleted ID matches the current selection, reset the selection to the root dashboard.
- Wrap destructive action handlers inside SwiftUI `.confirmationDialog` modifiers.
- Use SwiftUI transition animations to smooth the transition between listing, mutating, and empty states.

## Files likely touched
- `Projects/Core/UIComponents/Sources/Views/EmptyStateView.swift` (new)
- `Projects/Features/Dashboard/Sources/Dashboard/DashboardView.swift`
- `Projects/Product/App/Sources/Navigation/SidebarCoordinator.swift`

## Architecture boundaries
- The UI layer should only interact with feature interfaces.
- Avoid introducing direct dependency calls to database or engine layers from SwiftUI views.

## Testing strategy
- SwiftUI previews covering empty and error states.
- Unit test navigation coordinator logic under mock deletion events.
