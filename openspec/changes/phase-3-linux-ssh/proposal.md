# Proposal: Linux Machine Networking & SSH

## Why
We need to execute commands inside Linux machines (e.g., to provision k3s, check status) and expose their services.
Currently, IP addresses are hardcoded and SSH execution is unimplemented.

## What changes
1.  **Model**: Add `macAddress` to `Machine` struct and `MachineStore` (GRDB).
2.  **Networking**: Implement `ARPScanner` to resolve VM IP addresses from their MAC address (which we will now control).
3.  **SSH**: Implement `SSHClient` using `Citadel` library.
4.  **Runtime**: Implement `VirtualizationRuntime.executeCommand` using the new `SSHClient`.

## Impact
- `Shared`: Machine model change.
- `FlyingDutchmanPersistence`: Database schema migration.
- `FlyingDutchmanContainers`: New networking and SSH logic.
- `FlyingDutchmanEngine`: Enables functional k3s provisioning.

## Risks
- **ARP Scanning**: Requires parsing `arp -an` output, which can be brittle if output format changes (unlikely on macOS).
- **Network Latency**: IP detection might take a few seconds after VM boot.
