# FlyingDutchman - Project Context

## 1. Project Overview
**FlyingDutchman** is a modular, high-performance Swift application designed for macOS and iOS (targeted). It integrates container management, Kubernetes interaction, and AI capabilities into a unified platform.

The project is structured as a mono-repo with multiple targets (App, CLI, Engine) and shared framework modules, managed by **Tuist** and **Swift Package Manager**.

## 2. Architecture & Modules

The codebase follows a strict dependency hierarchy:

### 📱 Applications / Entry Points
*   **FlyingDutchmanApp**: The main macOS/iOS user interface (SwiftUI).
*   **FlyingDutchmanCLI**: Command-line interface tool (`fd`).
*   **FlyingDutchmanEngine**: The core service runner/backend engine.

### 🧩 Core Frameworks
*   **FlyingDutchmanNetworking**: Networking layer (Hummingbird, AsyncHTTPClient, DNSClient).
*   **FlyingDutchmanPersistence**: Data persistence (GRDB, SwiftData).
*   **FlyingDutchmanContainers**: Container runtime and management logic.
*   **FlyingDutchmanKubernetes**: Kubernetes client interactions.
*   **FlyingDutchmanAI**: AI/ML integration layer.

### 🧱 Foundation
*   **Shared**: Common models, utilities, and logging shared across all targets.

## 3. Development Workflow

### 🛠 Setup & Generation
The project uses **Tuist** for Xcode project generation.
```bash
tuist generate
```

### 🏗 Building & Running
You can build using either SwiftPM (CLI/CI) or Xcode (Development).

**SwiftPM Commands:**
```bash
# Build all targets
swift build

# Build specific executables
swift build --target FlyingDutchmanCLI
swift build --target FlyingDutchmanEngine

# Run the CLI
swift run FlyingDutchmanCLI [command]

# Run the Engine
swift run FlyingDutchmanEngine
```

**Xcode/Tuist:**
Open the generated `FlyingDutchman.xcodeproj` or `FlyingDutchman.xcworkspace` and run the desired scheme.

### 🧪 Testing
```bash
# Run all tests
swift test

# Run integration tests specifically
swift test --filter IntegrationTests
```

## 4. Key Conventions

*   **Swift Version**: 6.2 (Strict concurrency expected).
*   **Style**: Enforced via `SwiftLint` and `SwiftFormat`.
    *   Run linting: `./scripts/lint.sh`
*   **Modularization**:
    *   New features should be implemented in the appropriate "Framework" module, not directly in the App/CLI targets unless UI-specific.
    *   `Shared` module is for types used by *multiple* other modules.
*   **Documentation**:
    *   Technical specs and roadmap are in `openspec/`.
    *   Phase tracking is in `PHASE*_*.md` files.

## 5. Current Status (Jan 2026)
*   **Phase 1**: Code Complete (Container Core, CLI Auth, Basic Engine).
*   **Current Focus**: Build Verification & Smoke Testing.
*   **Next Steps**: Phase 2 (Networking & Port Forwarding).

## 6. Critical Files
*   `Package.swift`: SwiftPM dependency definition.
*   `Tuist/Project.swift`: Project generation settings.
*   `Sources/FlyingDutchmanApp/FlyingDutchmanAppMain.swift`: App Entry point.
*   `README_PHASE1.md`: Current phase details and test instructions.
