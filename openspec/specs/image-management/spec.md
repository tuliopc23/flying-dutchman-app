## Purpose
Enable efficient container image management with native macOS filesystem access for image inspection, and fast multi-platform image builds powered by BuildKit with layer caching.

## Requirements
### Requirement: Image exploration on macOS
The system SHALL expose container image contents on the host for inspection.

#### Scenario: Inspect an image on disk
- **WHEN** a user opens `~/OrbStack/docker/images/<tag>`
- **THEN** the image contents are visible in Finder or CLI tools

### Requirement: BuildKit-based image builds
The system SHALL build images using BuildKit and support multi-platform builds.

#### Scenario: Build a multi-platform image
- **WHEN** a user builds with `--platform linux/amd64,linux/arm64`
- **THEN** the build completes with cached stages when possible
