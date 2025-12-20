# Native Container Lifecycle Requirements

## ADDED Requirements

### Requirement: Configure Container Resources
The runtime MUST respect CPU and memory limits defined in the container configuration.

#### Scenario: Starting a container with resource limits
- **Given** a container created with `--cpus 4 --memory 1024m`
- **When** the container is started via `FD_RUNTIME=native`
- **Then** the underlying `LinuxContainer` VM is initialized with 4 CPUs and 1GB RAM
- **And** the container status becomes `running`

### Requirement: RootFS Initialization
The runtime MUST extract the container image layers into a dedicated root filesystem directory before starting the VM.

#### Scenario: Preparing RootFS from Image
- **Given** a pulled image `alpine:latest`
- **When** a container is created from this image
- **Then** the engine extracts the image layers into the container's private rootfs directory
- **And** the VM boots using this directory as its root

### Requirement: Graceful Shutdown
The runtime MUST attempt a graceful shutdown via VSOCK before forcibly terminating the VM process.

#### Scenario: Graceful Stop with Force Fallback
- **Given** a running container
- **When** `stop` is requested
- **Then** the engine sends a VSOCK signal to the guest
- **And** if the guest does not shut down within 5 seconds, the engine forcibly terminates the VM process
- **And** the status becomes `stopped`
