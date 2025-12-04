# Data Model: Flying Dutchman Foundation

## Entities
- **EngineStatus**: state (running/stopped/error), version, lastCheckedAt, healthDetails.
- **Project**: id, name, description, status (active/empty), lastOpenedAt.
- **UIState**: windowLayout, selectedProjectId?, appearanceMode (system/light/dark), recentProjects[], preferences.
- **CLICommandResult**: command, exitCode, message, timestamp (for diagnostics/logging only).

## Relationships
- UIState references selected Project.
- EngineStatus surfaced to UI and CLI.

## Validation Rules
- Project names non-empty; selectedProjectId must exist or be nil.
- Appearance follows system unless explicitly overridden.
