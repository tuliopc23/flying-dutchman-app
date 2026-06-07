# Design: Harden Kubernetes for Experimental Release

## Current implementation
The Kubernetes module contains wrappers for downloading K3s binaries, spawning a guest VM, and configuring network bridges. It doesn't gracefully check if virtualization is disabled, resulting in silent hangs or crash reports.

## Proposed implementation
Harden Kubernetes flows:
- Verify hypervisor availability before starting the K3s VM.
- Manage `kubeconfig` safely: load the user's `~/.kube/config`, merge the local Flying Dutchman context, and save. On cluster deletion, remove only the Flying Dutchman context and clean up.
- Display "Experimental Feature" warnings on the cluster creation sheet and CLI output.

## Files likely touched
- `Projects/Domain/KubeKit/Sources/KubeClusterManager.swift`
- `Projects/Features/Kubernetes/Sources/Kubernetes/KubernetesView.swift`
- `Projects/Product/CLI/Sources/Commands/Kubernetes.swift`

## Architecture boundaries
- Depend only on `KubeKit` interface types.
- Ensure Kubernetes logic does not couple directly with frontend views, handling networking state inside a dedicated service.

## Testing strategy
- Unit test kubeconfig parser and context merging/splitting logic.
- Verify error code mappings when hypervisor is missing.
```
