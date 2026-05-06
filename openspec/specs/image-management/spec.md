## Purpose
Enable efficient container image management with native macOS filesystem access for image inspection, registry pulls, and local Dockerfile builds.

## Requirements
### Requirement: Image exploration on macOS
The system SHALL expose container image contents on the host for inspection.

#### Scenario: Inspect an image on disk
- **WHEN** a user opens `~/FlyingDutchman/images/<tag>`
- **THEN** the image contents are visible in Finder or CLI tools

### Requirement: Registry pull workflow
The system SHALL pull images through the engine API so the app, CLI, and engine share one source of truth.

#### Scenario: Pull an image from the app or CLI
- **WHEN** a user runs `fd images pull ghcr.io/example/service:dev` or uses the Images screen pull action
- **THEN** the engine pulls the image and it appears in the shared image list

### Requirement: Local image builds
The system SHALL accept a local build context, optional Dockerfile path, tags, build arguments, and platform hints.

#### Scenario: Build a tagged image
- **WHEN** a user builds a local context from the CLI or Images screen
- **THEN** the engine records the resulting image summary and returns build logs to the caller
