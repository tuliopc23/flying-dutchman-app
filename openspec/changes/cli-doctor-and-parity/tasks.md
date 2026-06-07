# Tasks: Complete CLI Doctor and Core Command Parity

## Inspection
- [ ] Review all command files in `Projects/Product/CLI/Sources/Commands/`.
- [ ] Check exit code logic in the CLI main entry point.
- [ ] Review how stdout/stderr printing is handled.

## Implementation
- [ ] Normalize output formatting: standard table formatting for stdout, structured error logs for stderr.
- [ ] Add `--json` output flag to:
  - `flyingdutchman containers list`
  - `flyingdutchman images list`
- [ ] Make the `doctor` command print detailed system state (OS version, virtualization capabilities, engine reachability, database status).
- [ ] Ensure that failures return non-zero exit codes (e.g. invalid commands, failed container operations, database write errors).
- [ ] Mark experimental commands (machines, kubernetes, stacks, networking) in help text and print warnings on run.
- [ ] Ensure `flyingdutchman shell <target>` returns a clean PTY/session suitable for the GhosttyKit terminal integration.
- [ ] Add explicit command help descriptions to all subcommands.

## Validation
- [ ] Verify `swift build` and CLI compilation.
- [ ] Run exit code validation tests (e.g. trigger errors and assert `$?` is not 0).
- [ ] Add basic shell validation scripts / smoke tests for CLI operations.
