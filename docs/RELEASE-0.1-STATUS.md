# Flying Dutchman 0.1 Release Status

This document represents the current release readiness status of Flying Dutchman as of June 2026, established during the Milestone 0 baseline audit.

## Module Status Matrix

| Module | 0.1 Target Status | Current State | Notes |
| :--- | :---: | :---: | :--- |
| **App shell** | Done | Done | Builds successfully; SwiftUI layout functional. |
| **Engine** | Done | Done | Builds successfully; CLI warns when offline. |
| **XPC** | Done | Partial | Built successfully; doctor reports connection failure when daemon is stopped. |
| **HTTP API** | Done | Partial | Built successfully; client unreachable when daemon is stopped. |
| **CLI** | Done | Done | Builds successfully (`fd`); doctor command runs. |
| **Native Containerization runtime** | Done | Partial | Tahoe Containerization.framework not detected on host system. |
| **CLI fallback runtime** | Done | Done | Available as fallback. |
| **Stub runtime** | Done | Done | Available as development/mock fallback. |
| **Images** | Done | Done | Compiles cleanly. |
| **Containers** | Done | Done | Compiles cleanly. |
| **Volumes** | Done | Done | Compiles cleanly. |
| **Networks** | Done | Done | Compiles cleanly. |
| **Machines** | Experimental | Experimental | Virtualization.framework wrappers compile cleanly. |
| **Kubernetes** | Experimental | Experimental | K3s VM client compiles with one compiler warning. |
| **Terminal** | Done | Partial | Placeholder terminal exists; GhosttyKit not yet integrated. |
| **Sparkle/release packaging** | Done | Partial | Sparkle dependency resolved; release configs and signing keys pending. |

*Target Status options*: `Done`, `Partial`, `Experimental`, `Broken`, `Unknown`, `Out of 0.1 scope`.

---

## Build, Test, and Runtime Baseline

### Dependency Resolution Status
*   **Command**: `swift package resolve`
*   **Status**: `Done`
*   **Details**: Resolved successfully. All dependencies downloaded and cached.

### Compile Status
*   **Command**: `swift build`
*   **Status**: `Done`
*   **Details**: Compiled successfully in 395 seconds under Swift 6.2 on macOS 26.6. One compiler warning in `Kubernetes.swift:209:20` regarding unused `cluster` variable.

### Test Suite Status
*   **Command**: `swift test`
*   **Status**: `Done`
*   **Details**: The test suite compiles and runs cleanly with 121 passing tests (91 XCTest + 30 Swift Testing tests).

### CLI Doctor Status
*   **Command**: `swift run FlyingDutchmanCLI doctor`
*   **Status**: `Partial` (Warnings returned)
*   **Details**: The doctor tool successfully reported platform status but logged 5 environment/connection warnings:
	*   `[warn] Containerization: missing` (Containerization.framework not detected)
	*   `[warn] HTTP: Could not connect to the server`
	*   `[warn] XPC: Couldn’t communicate with a helper application`
	*   `[warn] DNS Resolver: missing`
	*   `[warn] Root CA: missing`

---

## Known Failures by Category

### Dependency Resolution Failures
*   *None.*

### Compile Errors
*   *None.*

### Test Failures
*   *None.*

### Runtime Failures
*   *None observed yet; daemon offline.*

### Environment-only Failures
*   `Containerization.framework` is missing on the current development machine.
*   DNS Resolver configuration and Root CA certificates are missing.

### Stale Specs / Docs References
*   *None.*
