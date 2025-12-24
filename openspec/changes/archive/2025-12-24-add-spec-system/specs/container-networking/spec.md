## ADDED Requirements
### Requirement: Seamless container networking
The system SHALL provide a container network stack with IPv6, ICMP (ping), traceroute, and support for VPN and DNS settings.

#### Scenario: Container reaches external hosts
- **WHEN** a container sends ICMP and DNS traffic
- **THEN** the requests succeed using the host's VPN and DNS configuration

### Requirement: Port forwarding and host connectivity
The system SHALL support Docker port forwarding and host connectivity for containers.

#### Scenario: Forward a container port
- **WHEN** a user runs a container with `-p 80:80`
- **THEN** the service is reachable on `localhost:80`

### Requirement: Host networking mode
The system SHALL support Docker host networking mode (`--net host`).

#### Scenario: Use host networking
- **WHEN** a user runs a container with `--net host`
- **THEN** services in the container are accessible from the host on `localhost` without explicit port forwards

### Requirement: Zero-config container domains
The system SHALL provide zero-config container domains in the form `container-name.orb.local` and `service.project.orb.local` for Compose services.

#### Scenario: Access a service by domain
- **WHEN** a user opens `service.project.orb.local`
- **THEN** the service responds without manual port mapping

### Requirement: Local HTTPS for container domains
The system SHALL provide automatic HTTPS for container domains using a local CA and reverse proxy.

#### Scenario: First HTTPS access
- **WHEN** a user visits `https://orb.local` for the first time
- **THEN** the system prompts to install a local certificate and HTTPS works for container domains
