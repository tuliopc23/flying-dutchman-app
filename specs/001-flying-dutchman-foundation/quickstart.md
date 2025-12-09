# Quickstart: Flying Dutchman Foundation

1) **Prereqs**: macOS Tahoe 26+ (arm64), Xcode/Swift 6.2 toolchain, Containerization framework present (stub check in `doctor`).
2) **Fetch deps**: `swift package resolve` (or `tuist generate` → open workspace) to pull hummingbird/GRDB/etc.
3) **Run engine**: `swift run FlyingDutchmanEngine` (or load launchd plist) to expose stub `/health` + `/status` HTTP and XPC endpoints.
4) **Run app**: Build `FlyingDutchmanApp`. On launch verify Liquid Glass cards, status badges, and sidebar projects; ⌘K opens the palette with fuzzy search.
5) **Palette actions**: In the palette, use **Refresh Engine Status**, **Focus Sidebar**, or toggle **Light/Dark/System** appearance overrides; palette closes after selection.
6) **CLI**: 
   - `swift run FlyingDutchmanCLI version`
   - `swift run FlyingDutchmanCLI doctor` (prints platform + engine + tooling checks; warns if engine unreachable)
   - `swift run FlyingDutchmanCLI containers list` (live if engine is up; falls back to mock data)
   - `swift run FlyingDutchmanCLI containers start <id|name>` / `stop <id|name>` (calls engine endpoints; warns if offline)
7) **Appearance**: Switch macOS light/dark and confirm glass materials adapt; reset overrides via the palette if needed.
