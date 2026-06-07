# Design: Harden Machines for Experimental Release

## Current implementation
Linux Machines compile and can boot raw image files on Virtualization.framework. However, IP address detection times out frequently, and deletion often leaves disk images (.raw/.qcow2) behind in the application support folder, leaking storage.

## Proposed implementation
Harden VM execution:
- Use structured error handling in `VZVirtualMachine` lifecycle transitions.
- Store disk images in `~/Library/Application Support/FlyingDutchman/machines/<machine-id>/` and ensure deleting the machine removes this directory recursively.
- Implement an async IP address polling hook with a 60-second timeout; on timeout, report `IP address unresolved` instead of spinning indefinitely.
- Add visible warning badges to the sidebar and header of the Machines panel.

## Files likely touched
- `Projects/Domain/ContainerKit/Sources/VirtualMachineManager.swift`
- `Projects/Features/Machines/Sources/Machines/MachinesView.swift`
- `Projects/Product/CLI/Sources/Commands/Machines.swift`

## Architecture boundaries
- Isolate hypervisor/virtualization types inside the Domain layer.
- Never bubble up direct virtualization exceptions to the UI; map them to standard user-facing error structs.

## Testing strategy
- Integration testing using VM state transitions.
- Storage validation checks (verifying directory count matches database count).
