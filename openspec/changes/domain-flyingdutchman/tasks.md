# Tasks: Flying Dutchman Auto Domains

## 1. Shared Domain Constants
- [ ] Add domain + port constants in `Shared` (primary + legacy).
- [ ] Provide helper for container hostname and URL.

## 2. DNS + HTTPS Proxy
- [ ] Register both hostnames in `DomainRoutingTable`.
- [ ] Update `DNSServer` defaults to shared port.
- [ ] Update `HTTPSProxy` to accept both suffixes.
- [ ] Update TLS leaf cert to include SANs for both wildcards.

## 3. CLI Resolver + CA Hints
- [ ] Install resolver files for both domains.
- [ ] Uninstall resolver files for both domains.
- [ ] Update hints to the new domain and port.

## 4. UI Link
- [ ] Add clickable container URL in `ContainerDetailView`.
- [ ] Use primary domain + HTTPS proxy port.

## 5. Docs
- [ ] Update `openspec/specs/container-networking/spec.md`.
- [ ] Update `openspec/phases/phase-2/status.md` and `openspec/ROADMAP.md`.

## 6. Tests
- [ ] Update `DNSServerTests` to validate new domain (and legacy alias).
