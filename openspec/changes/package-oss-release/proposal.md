# Proposal: Package Signed OSS Release

## Problem
Distributing a macOS app outside of the App Store requires a proper Developer ID signature, Hardened Runtime configuration, explicit Apple sandbox entitlements (specifically for Virtualization and network privileges), and Notarization. Without this setup, users will face Gatekeeper blocks, and VM or network capabilities will be rejected by macOS security.

## Goal
Confirm the product identity metadata, prepare Xcode build configurations for signing and notarization, package the application bundle and CLI binary into a ZIP or DMG installer, write clean installation/uninstallation instructions, and resolve the Sparkle update integration strategy.

## Non-goals
- No Mac App Store release (distribution is strictly standalone/open source).
- No complex Homebrew cask repository setup (except providing the basic formula code).
- No auto-update release if Sparkle feed verification cannot be automated.

## User impact
Users will be able to download the app, open it without Gatekeeper warnings, and install the `fd` command-line helper. If they decide to uninstall, they will have a documented script or guide to completely remove virtualization footprints.

## Engineering impact
- Updates build configs, project definitions, and plist files in `Workspace.swift` / `Tuist/` / app target.
- Creates packaging and notarization scripts.
- Adds user-facing install/uninstall documentation.

## Risk
High. Notarization and codesigning issues are notoriously tricky, environment-dependent, and require valid Apple Developer accounts and certificates.

## Rollback
Downgrade build configurations to developer-only signing if notarization cannot be run locally.
