## MODIFIED Requirements

### Requirement: Bind mounts and volumes
The system SHALL support bind mounts for Mac files and named volumes for persistent container storage with proper permission handling.

#### Scenario: Use a bind mount
- **WHEN** a user runs a container with `-v $HOME/Downloads:/downloads`
- **THEN** the container can access the mounted files

#### Scenario: Create a named volume
- **WHEN** a user runs `docker volume create mydata`
- **THEN** a persistent volume is created at `~/Library/Application Support/flyingdutchman/volumes/mydata/`

#### Scenario: Mount validation
- **WHEN** a user mounts a non-existent path
- **THEN** the system returns an error before container creation

### Requirement: Native file access for containers and volumes
The system SHALL expose container, image, volume, and machine files to macOS at `~/FlyingDutchman/`.

#### Scenario: Access container files from Finder
- **WHEN** a user opens the FlyingDutchman folder in Finder
- **THEN** container files are accessible at `~/FlyingDutchman/containers/<name>/`

#### Scenario: Access volume files from Finder
- **WHEN** a user opens `~/FlyingDutchman/volumes/`
- **THEN** named volume contents are browsable

## ADDED Requirements

### Requirement: Volume lifecycle management
The system SHALL provide volume CRUD operations with inspection and cleanup support.

#### Scenario: List volumes
- **WHEN** a user runs `docker volume ls`
- **THEN** all named volumes are listed with their driver and mount point

#### Scenario: Inspect volume
- **WHEN** a user runs `docker volume inspect mydata`
- **THEN** volume metadata including size and creation time is displayed

#### Scenario: Remove unused volumes
- **WHEN** a user runs `docker volume prune`
- **THEN** all volumes not attached to any container are removed
