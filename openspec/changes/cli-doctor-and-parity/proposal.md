# Proposal: Complete CLI Doctor and Core Command Parity

## Problem
The CLI (`fd` or `flyingdutchman`) has a broad set of commands, but many are untested, return non-standard formatting, omit error details, or exit with status code 0 on failure. For the 0.1 release, we need a subset of commands to be stable and predictable.

## Goal
Harden the CLI to guarantee correct exit codes, consistent stdout/stderr separation, readable error reporting, a comprehensive `doctor` check, and support for `--json` output on list commands. Ensure experimental features are clearly marked.

## Non-goals
- No full Docker-compatibility layer (`docker` API mapping).
- No Kubernetes CLI additions beyond current baseline listing.
- No remote daemon or remote host SSH routing (local only).

## User impact
Developers using the CLI will get reliable output, scriptable JSON formatting, proper exit codes (non-zero on errors), and a robust `doctor` diagnostic tool to debug setup problems.

## Engineering impact
- Modifies CLI command implementation targets in `FlyingDutchmanCLI`.
- Standardizes output printing utilities in `Shared`.
- Labels non-core commands clearly as experimental.

## Risk
Low. Commands are updated to standard Swift Argument Parser conventions, which has minimal risk on backend execution.

## Rollback
Standard git rollback.
