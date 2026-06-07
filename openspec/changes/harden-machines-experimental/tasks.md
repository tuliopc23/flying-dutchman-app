# Tasks: Harden Machines for Experimental Release

## Inspection
- [ ] Inspect VM creation, cloud-init config generation, and IP address resolver logic.
- [ ] Locate virtualization disk storage directories.
- [ ] Find where machines are registered in the CLI and App.

## Implementation
- [ ] Validate core Virtualization.framework lifecycle methods (create, boot, stop, restart, delete).
- [ ] Verify SSH access and IP resolution on guest boot.
- [ ] Implement robust VM deletion: ensure all allocated disk images, temporary cloud-init ISOs, and networks are deleted from host storage.
- [ ] Handle failed VM boot states cleanly: transition VM record to `failed` and output debug logs to the UI.
- [ ] Add an "Experimental" badge overlay to all Machine-related SwiftUI views.
- [ ] Add an "[EXPERIMENTAL]" notice to the `flyingdutchman machines` CLI command abstract description.
- [ ] Add warnings to user-facing documentation regarding hypervisor and resource requirements.

## Validation
- [ ] Run VM lifecycle test sequences to check disk reclamation.
- [ ] Validate that starting a VM with invalid disk setups returns a clear error instead of hanging.
- [ ] Document VM test results and verification logs in `docs/validation/machines.md`.
