## Purpose
Provide seamless network integration between containers and macOS, including full IPv6/ICMP support, VPN passthrough, automatic port forwarding, zero-config local domains, and HTTPS with local certificates for development workflows.

## Requirements
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
The system SHALL provide zero-config container domains in the form `container-name.flyingdutchman.local` (primary) and `container-name.fd.local` (legacy), plus `service.project.flyingdutchman.local` for Compose services.

The system SHALL also provide Kubernetes domains in the form `cluster.k8s.flyingdutchman.local` (primary) and `cluster.k8s.fd.local` (legacy).

**Constraints & Notes:**
- DNS server MUST be bound to `127.0.0.1:5353`.
- System MUST install resolver files at `/etc/resolver/flyingdutchman.local`, `/etc/resolver/fd.local`, `/etc/resolver/k8s.flyingdutchman.local`, and `/etc/resolver/k8s.fd.local` pointing to `127.0.0.1:5353`.
- Usage of `.local` via resolver file is a specific deviation from mDNS; ensure fallback allows suffix configuration if conflicts arise.

#### Scenario: Access a service by domain
- **WHEN** a user opens `service.project.flyingdutchman.local`
- **THEN** the service responds without manual port mapping

### Requirement: Local HTTPS for container domains
The system SHALL provide automatic HTTPS for container domains using a local CA and reverse proxy.

#### Scenario: First HTTPS access
- **WHEN** a user visits `https://container.flyingdutchman.local:8443` for the first time
- **THEN** the system prompts to install a local certificate and HTTPS works for container domains

---

## Implementation Details

### Architecture
- **DNS Server**: Embedded SwiftNIO UDP server listening on `127.0.0.1:5353`.
  - Library: `orlandos-nl/DNSClient` for message coding.
  - Logic: Resolves `*.flyingdutchman.local` and legacy `*.fd.local` A records to `127.0.0.1`.
- **Domain Routing Table**: In-memory actor (`DomainRoutingTable`) that maps hostnames to container ports.
  - Updated by `ContainerizationRuntime` on container lifecycle events.
- **HTTPS Proxy**: Embedded SwiftNIO TCP server (likely port 8443 or dynamic).
  - Library: `apple/swift-nio-ssl`.
  - Logic: Terminates TLS using dynamically generated certificates.
- **Certificate Authority**:
  - Library: `apple/swift-certificates`.
  - Storage: Root CA key/cert stored in secure app data.
  - Trust: Root CA added to macOS System Keychain via CLI command.

### Dependencies
- `apple/swift-nio`: Core networking.
- `orlandos-nl/DNSClient`: DNS protocol.
- `apple/swift-certificates`: X.509 generation.
