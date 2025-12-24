## ADDED Requirements
### Requirement: Local Kubernetes cluster for development
The system SHALL provide a lightweight single-node Kubernetes cluster optimized for development.

#### Scenario: Start the local cluster
- **WHEN** a user enables Kubernetes in the app
- **THEN** the cluster starts and is accessible via `kubectl`

### Requirement: Direct access to Kubernetes services
The system SHALL expose Kubernetes services to the host without manual port forwarding.

#### Scenario: Access a service from macOS
- **WHEN** a service is created in the cluster
- **THEN** it is reachable from macOS via the cluster's networking integration

### Requirement: Kubernetes domain routing
The system SHALL expose cluster-local DNS and `*.k8s.orb.local` domains for LoadBalancer and Ingress traffic.

#### Scenario: Access Ingress via wildcard domain
- **WHEN** an Ingress controller is installed
- **THEN** services are reachable via `example.k8s.orb.local`
