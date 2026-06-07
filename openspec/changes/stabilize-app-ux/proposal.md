# Proposal: Stabilize App UX for Release

## Problem
While the app has the core structural screens, it lacks handling for edge cases. Users can trigger actions on missing/broken targets, see empty screens without hints, lose navigation state upon resource deletion, and fail to see mutation states like creating, starting, or deleting.

## Goal
Harden the SwiftUI application shell to improve state transitions, disable actions when dependencies are missing, add explicit empty/unavailable UI placeholders, preserve sidebar selection safety, and introduce confirmations for destructive changes.

## Non-goals
- No major visual redesign of the app themes.
- No new features or tabs.
- No expansion of Kubernetes UX features beyond current scope.

## User impact
Users will experience a professional, polished macOS application with clear progress indicators, meaningful empty states, safety prompts before deleting containers/virtual machines, and robust error messages.

## Engineering impact
- Modifies sidebar and main navigation modules.
- Modifies SwiftUI lists, cards, and detail panels.
- Wires mutation indicators into feature view models.

## Risk
Low. UI polish changes do not modify the core engine, daemon, or container runtime backend.

## Rollback
Standard git rollback.
