# Proposal: Validate Persistence and Crash Recovery

## Problem
If the daemon or app crashes mid-operation (e.g., during container creation, deletion, or image pull), database records can drift from the actual OS processes and port forwards. The system must reconcile state differences upon startup and recover from aborted transactions.

## Goal
Verify and harden the persistence layer to handle aborted operations cleanly. Reconcile SQLite database status with actual host container processes and port mappings. Add repair tools to correct desynchronized resource states.

## Non-goals
- No major rewrite of the GRDB database schema.
- No remote or cloud state synchronization systems.
- No local database backup/restore mechanisms beyond local file recovery.

## User impact
Users will not experience frozen "creating" or "deleting" items after a system restart or application crash. The system will self-heal or offer a simple "repair" mechanism to clean up zombie states and release occupied ports.

## Engineering impact
- Modifies daemon startup / reconciliation logic in `FlyingDutchmanEngine`.
- Modifies database transition queries in `FlyingDutchmanPersistence`.
- Adds `flyingdutchman repair` command to the CLI.

## Risk
High. Modifying state reconciliation and resource deletion can accidentally wipe user data or remove running containers if mismatch logic is faulty.

## Rollback
Standard git rollback.
