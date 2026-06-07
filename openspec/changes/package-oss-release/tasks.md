# Tasks: Package Signed OSS Release

## Inspection
- [ ] Inspect existing `Info.plist`, entitlements files, and Tuist project generation settings.
- [ ] Check how Sparkle is imported and configured in the main App target.
- [ ] Identify build/packaging shell scripts.

## Implementation
- [ ] Standardize and confirm product identity metadata:
  - App Name: `Flying Dutchman`
  - Bundle Identifier: `com.flyingdutchman.app`
  - CLI binary name: `fd`
  - Engine helper identity: `com.flyingdutchman.engine`
  - App support directories: `~/Library/Application Support/FlyingDutchman/`
- [ ] Configure signing settings in Tuist files (Developer ID Application/Installer certificates).
- [ ] Enable Hardened Runtime and audit entitlements (virtualization, networking, privileged helpers).
- [ ] Create packaging script to build a signed and notarized `.dmg` or `.zip` release.
- [ ] Write user documentation:
  - Installation instructions: `docs/install.md`
  - Uninstallation instructions: `docs/uninstall.md` (removing files in Application Support, logs, binaries)
  - Release notes & known limitations.
- [ ] Decide on Sparkle updates:
  - If enabled: configure appcast feed url, sign update files, test in-app update trigger.
  - If deferred: hide check-for-updates menu items and UI buttons.

## Validation
- [ ] Compile the final release build scheme locally.
- [ ] Test fresh installation of the packaged DMG on a clean macOS user profile.
- [ ] Verify that virtualization and container pull operations function post-install.
- [ ] Run the uninstallation procedure and verify no leftover files remain in system folders.
