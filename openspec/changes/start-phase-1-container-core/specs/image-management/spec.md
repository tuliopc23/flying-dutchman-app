## MODIFIED Requirements

### Requirement: Image exploration on macOS
The system SHALL expose container image contents on the host at `~/FlyingDutchman/images/` for inspection.

#### Scenario: Inspect an image on disk
- **WHEN** a user opens `~/FlyingDutchman/images/<repository>/<tag>/`
- **THEN** the image contents are visible in Finder or CLI tools

#### Scenario: View image layers
- **WHEN** a user inspects `~/FlyingDutchman/images/<repository>/<tag>/layers/`
- **THEN** individual layers are visible as directories

### Requirement: BuildKit-based image builds
The system SHALL build images using BuildKit and support multi-platform builds with layer caching.

#### Scenario: Build a multi-platform image
- **WHEN** a user builds with `--platform linux/amd64,linux/arm64`
- **THEN** the build completes with cached stages when possible

#### Scenario: Build cache hit
- **WHEN** a layer has not changed since the last build
- **THEN** the cached layer is reused instead of rebuilding

## ADDED Requirements

### Requirement: Kernel management
The system SHALL automatically download and manage the Linux kernel required for container VMs.

#### Scenario: Automatic kernel download
- **WHEN** the application starts and no kernel is present
- **THEN** the system downloads a compatible kernel from GitHub releases

#### Scenario: Kernel version validation
- **WHEN** a kernel is present
- **THEN** the system validates the kernel version is compatible with the Containerization framework

#### Scenario: Kernel update available
- **WHEN** a newer kernel version is available
- **THEN** the system notifies the user and offers to update

### Requirement: Image layer caching
The system SHALL cache OCI image layers to avoid re-downloading and support deduplication.

#### Scenario: Layer cache hit
- **WHEN** pulling an image with layers already in cache
- **THEN** cached layers are reused instead of downloading

#### Scenario: Layer deduplication
- **WHEN** multiple images share the same layer
- **THEN** the layer is stored only once on disk

#### Scenario: Cache eviction
- **WHEN** the cache exceeds the configured size limit
- **THEN** least-recently-used layers are evicted
