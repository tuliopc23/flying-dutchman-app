# Quickstart: Flying Dutchman Foundation

1) **Prereqs**: macOS Tahoe 26+ (arm64), Xcode/Swift 6.2 toolchain, Containerization framework present (stub check in `doctor`).
2) **Fetch deps**: `swift package resolve` (or `tuist generate` → open workspace) to pull hummingbird/GRDB/etc.
3) **Lint (optional)**: `./scripts/lint.sh` runs SwiftFormat (lint mode) + SwiftLint using repo configs.
4) **Run engine**: `swift run FlyingDutchmanEngine` (or load launchd plist) to expose stub `/health` + `/status` HTTP and XPC endpoints; startup logs warn if platform/framework are unsupported.
5) **Run app**: Build `FlyingDutchmanApp`. On launch verify Liquid Glass cards, status badges, segmented navigation (containers/images/volumes/networks/logs/events), and sidebar projects; ⌘K opens the palette with fuzzy search and appearance toggles.
6) **Palette actions**: In the palette, use **Refresh Engine Status**, **Focus Sidebar**, **Refresh Containers/Images/Volumes/Networks/Events**, or toggle **Light/Dark/System** appearance overrides; palette closes after selection. UI state (section, appearance) persists via SwiftData.
7) **CLI**: 
   - `swift run FlyingDutchmanCLI version`
   - `swift run FlyingDutchmanCLI doctor` (prints platform + engine + tooling checks; warns if engine unreachable)
   - `swift run FlyingDutchmanCLI containers list` (live if engine is up; falls back to mock data)
   - `swift run FlyingDutchmanCLI containers start <id|name>` / `stop <id|name>` / `restart <id|name>` (calls engine endpoints; warns if offline)
   - `swift run FlyingDutchmanCLI images list` and `stacks list` for stubbed catalog views
8) **Appearance**: Switch macOS light/dark and confirm glass materials adapt; reset overrides via the palette if needed. Unsupported platforms/frameworks render banners in-app and warnings in the CLI doctor report. For runtime selection use `FD_RUNTIME=cli` to target the `container` CLI (if available) or `FD_RUNTIME=native` when Containerization.framework is present; defaults to stub.
