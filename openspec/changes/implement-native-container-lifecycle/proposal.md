# Implement Native Container Lifecycle

## Summary

Complete the integration of Apple's Containerization framework in `FlyingDutchmanEngine` by fleshing out `ContainerizationRuntime.swift`. This moves the runtime from a "wired skeleton" to a fully functional container engine capable of extracting OCI images, managing VM resources (CPU/RAM), and handling container lifecycle events robustly.

## Motivation

Phase A.2 wired the engine to the runtime, but the runtime implementation (`ContainerizationRuntime`) currently relies on stubs for critical operations like rootfs preparation and uses hardcoded resource limits. To fulfill the "Native-First" promise of the constitution, we must fully leverage the `Containerization` and `ContainerizationOCI` frameworks to provide real isolation and performance.

## Proposed Changes

### 1. RootFS Preparation
- Implement `prepareRootFS` to iterate over image layers from `ImageStore`.
- Use `ContainerizationOCI` (or system `tar`) to extract layers into the container's root directory.
- Support overlayfs-like behavior (or simple copy-on-write) if the framework supports it, otherwise flat extraction for now.

### 2. Resource Configuration
- Map `ContainerConfig.cpuLimit` and `memoryLimit` to `LinuxVMConfiguration`.
- Expose these configuration options in the CLI and HTTP API (already in `ContainerConfig`, just need to use them).

### 3. Lifecycle Robustness
- Enhance `startContainer` to handle VM launch failures gracefully.
- Enhance `stopContainer` to ensure VM process termination if VSOCK graceful shutdown fails.
- Implement `cleanupRootFS` to properly remove artifacts on container deletion.

### 4. Networking (Basic)
- Ensure VSOCK control plane is reliably connected.
- (Future: Full bridge networking is Phase B, but basic connectivity should be verified).

## Validation

- **Manual**: Create a container from `alpine:latest`, start it, verify it consumes configured memory/CPU (via Activity Monitor or internal metrics), stop it, and verify files are cleaned up.
- **Automated**: Add integration tests that spin up a real container (if CI environment allows, otherwise mock framework responses).
