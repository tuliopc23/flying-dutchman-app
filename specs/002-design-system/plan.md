# Implementation Plan: Flying Dutchman Design System

**Branch**: `002-design-system` | **Date**: 2025-12-17 | **Spec**: specs/002-design-system/spec.md

## Summary

Deliver a comprehensive, token-based design system leveraging macOS Tahoe's Liquid Glass APIs and Netherlands football team colors (Orange, Royal Blue, White). Establish robust foundation with semantic tokens for colors, typography (SF Pro family), spacing, corner radii, shadows, and animations. Implement native Liquid Glass materials, unified window chrome, and edge-to-edge sidebar without clipping—eliminating all hardcoded values and unblocking future UI development.

## Technical Context

**Language/Version**: Swift 6.2  
**Primary Dependencies**: SwiftUI (macOS 26+), Liquid Glass APIs, SF Pro Display/Text/Mono (system fonts), SF Symbols 7  
**Storage**: N/A (compile-time constants)  
**Testing**: SwiftUI Previews for visual validation, contrast ratio verification, Dynamic Type testing  
**Target Platform**: macOS Tahoe 26+, Apple Silicon only  
**Project Type**: Design system module (tokens + extensions + showcase)  
**Performance Goals**: Zero runtime cost (compile-time constants), system-optimized glass rendering  
**Constraints**: No custom glass effects, no hardcoded values outside token files, WCAG AA compliance  
**Scale/Scope**: Foundation for all Flying Dutchman UI components

## Constitution Check

- ✅ **Platform constraints**: Tahoe-only APIs (Liquid Glass, `.backgroundExtensionEffect()`)
- ✅ **Native-first**: SwiftUI official APIs, system fonts, no third-party design libraries
- ✅ **Swift-only**: Pure Swift token definitions, no JSON/config files
- ✅ **Local-first**: Design system for native macOS app (no web/cross-platform export)
- ✅ **"It just works"**: Automatic light/dark mode, accessibility-ready, system font integration
- ✅ **Minimal/surgical**: Token-based architecture eliminates scattered magic numbers
- ✅ **Opinionated**: Netherlands brand colors, pill buttons, unified chrome, edge-to-edge sidebar

## Project Structure

### Documentation (this feature)

```text
specs/002-design-system/
├── plan.md              # This file
├── spec.md              # Feature specification (✅ created)
├── tasks.md             # Task breakdown (✅ created)
├── design-tokens.md     # Token reference table (Phase 4)
└── quickstart.md        # Usage guide (Phase 6)
```

### Source Code (repository root)

```text
Sources/FlyingDutchmanApp/
├── DesignSystem/
│   ├── Tokens/
│   │   ├── Colors.swift           # Netherlands palette + semantic tokens
│   │   ├── Typography.swift       # SF Pro Display/Text/Mono scale
│   │   ├── Spacing.swift          # Spacing/size scale (2–48pt)
│   │   ├── CornerRadius.swift     # Radii + shape helpers
│   │   ├── Shadows.swift          # Shadow presets
│   │   └── Animations.swift       # Spring/ease animation presets
│   ├── Extensions/
│   │   ├── View+Glass.swift       # Liquid Glass helpers
│   │   ├── Image+Symbols.swift    # SF Symbol utilities
│   │   └── View+Layout.swift      # Spacing/sizing modifiers
│   └── DesignSystemShowcase.swift # Preview gallery for all tokens
```

**Structure Decision**: Token-based architecture with namespace enums (e.g., `DesignSystem.Colors.accent`) to prevent collisions and provide clear API surface. Extensions co-located by concern (glass, symbols, layout). Showcase file for visual validation via Xcode previews.

## Complexity Tracking

No constitution violations—design system aligns with all principles.

## Implementation Phases

### Phase 1: Token Foundation (T001–T004) [4–6 hours]
**Deliverable**: All core token files with Netherlands palette, spacing scale, corner radii, SF font scale  
**Validation**: Tokens compile in Swift 6.2, light/dark mode colors preview correctly

### Phase 2: Visual Effects (T010–T012) [3–4 hours]
**Deliverable**: Liquid Glass helpers, shadow presets, animation curves  
**Validation**: `.glassEffect()` applies native material, shadows render with correct depth

### Phase 3: Helpers (T020–T022) [2–3 hours]
**Deliverable**: SF Symbol utilities, layout modifiers, unified chrome helpers  
**Validation**: Symbols render with correct size/weight, unified chrome removes title bar separation

### Phase 4: Documentation (T030–T032) [3–4 hours]
**Deliverable**: Token reference tables, showcase preview, README section  
**Validation**: All tokens documented with examples, showcase displays every token

### Phase 5: Migration (T040–T044) [6–8 hours]
**Deliverable**: Existing views migrated to tokens, hardcoded values eliminated  
**Validation**: Grep audit passes (zero hardcoded colors/spacings outside tokens)

### Phase 6: Polish (T050–T053) [3–4 hours]
**Deliverable**: Contrast validation, Dynamic Type testing, accessibility documentation  
**Validation**: WCAG AA compliance, Reduce Motion/Increase Contrast modes work correctly

**Total Estimate**: 21–29 hours (~3–4 days)

## Risk Mitigation

| Risk | Impact | Mitigation |
|------|--------|-----------|
| Liquid Glass APIs change in Xcode 26 betas | High | Pin to stable Xcode 26 release; use official WWDC sample code as reference |
| Netherlands colors fail contrast checks | Medium | Pre-validate with Contrast Checker; adjust dark mode variants if needed |
| SF Mono not available on older Tahoe builds | Low | Fallback to `.monospaced()` modifier for backwards compat |
| Existing views have too many hardcoded values | Medium | Incremental migration—prioritize MainWindow/Sidebar/CommandPalette first |

## Success Criteria

- [ ] All token files pass Swift 6.2 strict concurrency checks
- [ ] Design system showcase preview renders without errors
- [ ] Grep audit: zero hardcoded hex colors, magic number spacings, or custom blur effects in `FlyingDutchmanApp/` (excluding `DesignSystem/Tokens/`)
- [ ] All text/background color pairs meet WCAG AA contrast (4.5:1 text, 3:1 UI)
- [ ] Documentation published with token reference tables and unified chrome screenshots
- [ ] T062 (foundation smoke test) passes with new design system applied

## Next Steps After Completion

1. Create component library spec (buttons, cards, forms) leveraging design system tokens
2. Implement container management UI (Phase 4 from containerization tasks) with design system
3. Build settings/preferences UI using design tokens
4. Audit CLI output for terminal color consistency with brand palette
