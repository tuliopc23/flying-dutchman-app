# Tasks: Harden Kubernetes for Experimental Release

## Inspection
- [ ] Locate cluster configuration files and kubeconfig path handlers.
- [ ] Inspect the K3s installation script execution and network listener logic.
- [ ] Audit dependencies on the Machines or VM module.

## Implementation
- [ ] Validate VM-backed K3s cluster creation and boot sequence.
- [ ] Verify cluster listing and status polling.
- [ ] Generate clean `kubeconfig` mappings to point to the correct VM guest IP and port.
- [ ] Verify deletion cleans up all VM files, mounts, and removes the kubeconfig entry to prevent client command errors.
- [ ] Add explicit check to fail cluster startup early if the VM runtime is offline or unsupported.
- [ ] Add an "Experimental" badge overlay to all Kubernetes-related SwiftUI screens.
- [ ] Add an "[EXPERIMENTAL]" flag or message to `flyingdutchman kubernetes` CLI command.
- [ ] Add documentation listing system resource prerequisites (min RAM/CPU cores).

## Validation
- [ ] Validate cluster creation and destruction cycles cleanly reclaim resources.
- [ ] Verify that starting a cluster without virtualization capabilities prints a precise error message.
- [ ] Document Kubernetes manual validation scenarios in `docs/validation/kubernetes.md`.
