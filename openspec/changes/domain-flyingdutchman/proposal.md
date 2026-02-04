# Change Proposal: Flying Dutchman Auto Domains

## Why
Users need a branded, memorable auto-domain for containers (OrbStack-style) that resolves automatically and can be opened from the UI without manual setup.

## What changes
- Add `*.flyingdutchman.local` as the primary auto-domain.
- Keep `*.fd.local` as a legacy alias for compatibility.
- Update DNS resolver install/uninstall, HTTPS proxy hostname matching, and CLI hints.
- Expose a clickable container URL in the UI.

## Impact
- `Shared` (domain constants)
- `NetworkKit` (DNS + HTTPS proxy host matching, cert SANs)
- `CLI` (resolver install/uninstall, trust-ca hints)
- `UI` (container detail link)
- `openspec/specs/container-networking/spec.md` and phase status/roadmap

## Risks
- Users might expect `https://<name>.flyingdutchman.local` without port; current proxy listens on `:8443`.
- Resolver install still requires sudo.
- Certificate SAN updates must include both domains.
