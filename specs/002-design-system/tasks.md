# Tasks: Flying Dutchman Design System

**Input**: `specs/002-design-system/spec.md`  
**Priority**: P0 (Blocking) - Unblocks all UI implementation work

## Phase 1: Token Foundation

- [ ] T001 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Tokens/Colors.swift` with Netherlands palette (Orange #FF6200, Blue #21468B, White) and semantic color tokens for light/dark modes
- [ ] T002 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Tokens/Spacing.swift` with spacing scale (.xxs through .xxxl: 2/4/8/12/16/24/32/48pt)
- [ ] T003 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Tokens/CornerRadius.swift` with radius tokens (.tight/.regular/.comfortable/.spacious: 4/8/12/16pt) and shape helpers
- [ ] T004 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Tokens/Typography.swift` with SF Pro Display/Text/Mono font scale and dynamic type support

## Phase 2: Visual Effects & Materials

- [ ] T010 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Extensions/View+Glass.swift` with Liquid Glass helpers (`.glassEffect()`, `.glassSurface()`, `.glassToolbar()`)
- [ ] T011 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Tokens/Shadows.swift` with shadow presets (.subtle/.card/.floating/.prominent)
- [ ] T012 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Tokens/Animations.swift` with animation presets (.standard/.quick/.smooth/.bouncy spring curves)

## Phase 3: Components & Helpers

- [ ] T020 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Extensions/Image+Symbols.swift` with SF Symbol helper methods (size/weight/rendering mode)
- [ ] T021 [P0] Create `Sources/FlyingDutchmanApp/DesignSystem/Extensions/View+Layout.swift` with spacing/sizing convenience modifiers
- [ ] T022 [P0] Create unified window chrome helpers: `.unifiedChrome()` modifier (hidden title bar + toolbar background)

## Phase 4: Documentation & Showcase

- [ ] T030 [P1] Create `specs/002-design-system/design-tokens.md` with comprehensive token tables (colors, spacing, typography, radii, shadows, animations)
- [ ] T031 [P1] Create `Sources/FlyingDutchmanApp/DesignSystem/DesignSystemShowcase.swift` with SwiftUI Previews displaying all tokens visually
- [ ] T032 [P1] Add "Design System" section to README.md with links to token documentation and preview instructions

## Phase 5: Migration & Validation

- [ ] T040 [P1] Audit existing views for hardcoded colors/spacing/radii and create migration checklist
- [ ] T041 [P1] Migrate `MainWindow.swift` to use design system tokens (colors, glass effects, typography)
- [ ] T042 [P1] Migrate `SidebarView.swift` to use design system tokens and `.backgroundExtensionEffect()` for edge-to-edge content
- [ ] T043 [P1] Migrate `CommandPaletteView.swift` to use design system tokens and Liquid Glass materials
- [ ] T044 [P2] Run grep audit to verify zero hardcoded hex colors, magic number spacings, or custom blur effects outside token files

## Phase 6: Accessibility & Polish

- [ ] T050 [P2] Validate all color combinations meet WCAG AA contrast ratios (4.5:1 text, 3:1 UI) in light and dark modes
- [ ] T051 [P2] Test Dynamic Type scaling across all typography tokens (test at accessibility sizes)
- [ ] T052 [P2] Add `@Environment(\.accessibilityReduceMotion)` checks to animation helpers
- [ ] T053 [P2] Document sidebar "no clipping" pattern and unified chrome in quickstart.md

## Dependencies & Execution Order

- Phase 1 (T001–T004) must complete before Phase 2 (glass effects need color tokens)
- Phase 2 (T010–T012) must complete before Phase 5 migration (views need glass helpers)
- Phase 3 (T020–T022) can run parallel to Phase 2
- Phase 4 documentation can start after Phase 1 tokens are defined
- Phase 5 migration blocked by Phases 1–3 completion
- Phase 6 accessibility validation requires Phase 5 migration complete

## Acceptance Criteria (Phase Completion)

### Phase 1 Complete
- [ ] All token files compile without errors in Swift 6.2
- [ ] Color tokens automatically adapt to light/dark mode when tested in Xcode preview
- [ ] Typography tokens render SF Pro Display/Text/Mono correctly

### Phase 2 Complete
- [ ] `.glassEffect()` applies native Liquid Glass material (no custom blur/transparency)
- [ ] Shadow tokens create visible depth differences when stacked in preview

### Phase 3 Complete
- [ ] `Image.systemIcon()` helper renders SF Symbols with correct size/weight
- [ ] `.unifiedChrome()` removes title bar separation and toolbar background

### Phase 4 Complete
- [ ] `design-tokens.md` includes tables for all token categories with values and usage examples
- [ ] `DesignSystemShowcase.swift` preview displays all colors, fonts, spacings, shadows in one scrollable view

### Phase 5 Complete
- [ ] MainWindow, SidebarView, CommandPaletteView use design system tokens exclusively
- [ ] Grep for `Color(red:`, `Color(hex:`, `.padding(15)`, `.cornerRadius(8)` returns zero results in `FlyingDutchmanApp/` (outside DesignSystem folder)

### Phase 6 Complete
- [ ] Accessibility Contrast Checker confirms all text/background combinations pass WCAG AA
- [ ] App tested with "Increase Contrast" and "Reduce Motion" enabled—no visual/animation breakage
- [ ] Documentation includes screenshots of unified chrome and edge-to-edge sidebar
