# Proposal: Validate and Fix Native Container Lifecycle

## Problem
The native Apple Containerization runtime is partially implemented, but it is not fully verified across critical lifecycle phases: pull image, create, start, stop, restart, delete, bind mount, port-forwarding, and log persistence. Stale resources, transient errors, and incorrect state machine transitions must be resolved.

## Goal
Harden the native container lifecycle code to guarantee reliable execution, cleanup, and status reporting for standard container payloads (hello-world, Alpine, and Nginx).

## Non-goals
- No Kubernetes integration updates.
- No Linux Machine VM updates unless required for container runtime operations.
- No terminal UI implementations (this is restricted to ensuring the execution target exists).

## User impact
Users will experience stable container creation, startup, teardown, and clean resource garbage collection. They will get clear feedback when pulling invalid images or referencing bad mount paths.

## Engineering impact
- Audits and updates `FlyingDutchmanContainers` implementation.
- Adjusts database schema queries or transaction states in `FlyingDutchmanPersistence`.
- Adds automated/manual integration validation checks.

## Risk
Medium. Touches the core container runner code; changes must be carefully isolated using strict unit tests.

## Rollback
Standard git rollback.
