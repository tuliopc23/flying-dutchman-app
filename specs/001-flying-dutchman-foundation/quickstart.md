# Quickstart: Flying Dutchman Foundation

1) **Prereqs**: macOS Tahoe 26+, Apple Silicon; Xcode/Swift 6.2; Containerization framework installed.
2) **Fetch deps**: `swift package resolve` (or `tuist generate` then open workspace).
3) **Run engine**: `swift run FlyingDutchmanEngine` (or load launchd plist) to expose status via XPC/HTTP stub.
4) **Run app**: Build `FlyingDutchmanApp` target; verify main window renders Liquid Glass and status indicator updates.
5) **CLI**: `swift run FlyingDutchmanCLI version` and `doctor`; expect engine connectivity and clear errors if engine offline.
6) **Appearance**: Toggle system light/dark and confirm UI adapts.
