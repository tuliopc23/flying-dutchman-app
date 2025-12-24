## Purpose
Enable seamless file sharing between macOS and containers through bind mounts, Docker volumes, and native Finder access to container filesystems for easy inspection and debugging.

## Requirements
### Requirement: Bind mounts and volumes
The system SHALL support bind mounts for Mac files and volumes for persistent container storage.

#### Scenario: Use a bind mount
- **WHEN** a user runs a container with `-v $HOME/Downloads:/downloads`
- **THEN** the container can access the mounted files

### Requirement: Native file access for containers and volumes
The system SHALL expose container, image, volume, and machine files to macOS at a native filesystem location.

#### Scenario: Access container files from Finder
- **WHEN** a user opens the OrbStack folder in Finder
- **THEN** container files are accessible at `~/OrbStack/docker/containers/<name>`
