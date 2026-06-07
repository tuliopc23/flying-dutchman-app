# Design: Complete CLI Doctor and Core Command Parity

## Current implementation
CLI commands compile, but error messages leak raw Swift error descriptions, and tabular lists are printed with primitive print statements. Exit codes do not reliably reflect command execution status.

## Proposed implementation
Harden the CLI commands:
- Leverage `ArgumentParser.ParsableCommand` and throw custom `CleanError` types conforming to `LocalizedError`.
- Build a generic `TablePrinter` helper in `Shared` or local utility target to print formatted tabular data to stdout.
- Intercept errors in CLI main loop to output clear messages in stderr and return non-zero codes.
- Introduce an `--output` enum parameter (`table` | `json`) for list commands.
- Mark experimental subcommands using the `configuration` API:
  ```swift
  static var configuration = CommandConfiguration(
      commandName: "machines",
      abstract: "[EXPERIMENTAL] Manage virtualization machines"
  )
  ```

## Files likely touched
- `Projects/Product/CLI/Sources/Commands/Containers.swift`
- `Projects/Product/CLI/Sources/Commands/Images.swift`
- `Projects/Product/CLI/Sources/Commands/Doctor.swift`
- `Projects/Product/CLI/Sources/main.swift`

## Architecture boundaries
- CLI commands should only interface with the shared HTTP daemon clients or direct Persistence drivers.
- Keep terminal emulation capabilities separated from UI logic.

## Testing strategy
- CLI integration test harness asserting outputs and exit codes.
- Test JSON representation for lists.
