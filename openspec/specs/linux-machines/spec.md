## Purpose
Provide lightweight Linux virtual machines with multiple distribution options, seamless macOS integration including file sharing, networking, and SSH access, enabling developers to run full Linux environments alongside their containerized workloads.

## Requirements
### Requirement: Linux machines with multiple distros
The system SHALL allow users to create Linux machines from a set of supported distributions and versions.

#### Scenario: Create a machine with a specific distro version
- **WHEN** a user creates a machine with `ubuntu:jammy`
- **THEN** the machine is created with the requested distro version

### Requirement: Command and shell access
The system SHALL provide command execution and interactive shells for Linux machines via a CLI.

#### Scenario: Run a command in Linux
- **WHEN** a user runs `orb uname -a`
- **THEN** the command executes in the default Linux machine and returns output

### Requirement: Linux networking integration
The system SHALL provide Linux machine networking with domain names and host connectivity.

#### Scenario: Access a Linux service from macOS
- **WHEN** a user runs a web server in a Linux machine on port 8000
- **THEN** the service is accessible from macOS at `localhost:8000`

### Requirement: File sharing between Linux and macOS
The system SHALL provide two-way file sharing between Linux and macOS.

#### Scenario: Access Mac files from Linux
- **WHEN** a user navigates to `/mnt/mac/Users/<user>` inside Linux
- **THEN** the files are accessible and editable

### Requirement: SSH access for Linux machines
The system SHALL provide a built-in SSH server for Linux machines with stable connection settings.

#### Scenario: Connect via SSH
- **WHEN** a user runs `ssh orb`
- **THEN** the default machine opens an SSH session using the configured key

### Requirement: Cloud-init provisioning
The system SHALL support Cloud-init user data when creating Linux machines.

#### Scenario: Create a machine with Cloud-init
- **WHEN** a user runs `orb create ubuntu my-machine -c user-data.yml`
- **THEN** the machine is provisioned using the supplied Cloud-init configuration
