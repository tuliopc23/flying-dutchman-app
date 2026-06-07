# Design: Package Signed OSS Release

## Current implementation
The app compiles under local developer code signing and has no formal notarization or release packaging script. Sparkle checker is referenced in code, but its appcast keys or certificates are not set up.

## Proposed implementation
Establish release configurations:
- Update `Tuist/ProjectDescriptionHelpers/` to inject custom signing configurations for release builds.
- Configure entitlements:
  - `com.apple.security.hypervisor`: Boolean = true
  - `com.apple.security.network.client`: Boolean = true
  - `com.apple.security.network.server`: Boolean = true
- Build a packaging bash script `scripts/package-release.sh` that compiles the release scheme, creates a DMG using `create-dmg` or `hdiutil`, runs `codesign --sign "Developer ID Application: ..."` and `xcrun notarytool submit`.
- Provide a clear `uninstall.sh` script to delete:
  - `~/Library/Application Support/FlyingDutchman`
  - `/usr/local/bin/fd` (or wherever cli helper is symlinked)
  - `~/Library/Logs/FlyingDutchman`
  - Saved preferences.

## Files likely touched
- `Tuist/ProjectDescriptionHelpers/Project+Templates.swift`
- `Projects/Product/App/Resources/AppEntitlements.entitlements`
- `scripts/package-release.sh` (new)
- `docs/install.md` (new)
- `docs/uninstall.md` (new)

## Architecture boundaries
- Entitlements and signing configs belong strictly to the product configuration layer.
- Feature targets should remain signing-agnostic.

## Testing strategy
- Perform manual local builds using the release scheme.
- Verify notarization status with `xcrun stapler validate`.
