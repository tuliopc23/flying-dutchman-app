# Feature Specification: Guest Agent & CLI Verification (Phase A2)

**Feature Branch**: `003-guest-integration`
**Parent Feature**: `001-flying-dutchman-foundation`
**Status**: Draft (Next Up)

## Objective
Achieve end-to-end execution of a container from the `flying-dutchman` CLI, through the Engine/Runtime, into a live Linux VM, and stream the response back.

## Scope

1.  **Guest Bootstrap**:
    *   Implement `GuestResourceManager` to download/manage the `vminitd` binary.
    *   Update `ContainerizationRuntime` to inject `vminitd` into the rootfs.

2.  **CLI Wiring**:
    *   Update `DockerShimServer` to map Docker API calls to `ContainerizationRuntime` methods.
    *   Verify `flying-dutchman containers run` triggers the full stack.

3.  **Kernel Strategy**:
    *   Formalize the `KernelManager` to use a specific, tested kernel version compatible with our VSOCK transport.

## User Scenarios

### User Story 1: Run a Container via CLI
**As a** developer,
**I want to** run `flying-dutchman run alpine echo "hello"`,
**So that** I can verify the container engine is actually working.

**Acceptance Criteria**:
1. CLI command sends request to Engine (Shim).
2. Engine creates Container record via Runtime.
3. Runtime boots Linux VM with `vminitd`.
4. `vminitd` executes `echo "hello"`.
5. Output "hello" streams back to CLI via VSOCK.
6. Container exits with code 0.

## Dependencies
- Phase A1 (Complete): Transport & Protocol
- `vminitd` binary (Need to define build/download source)
