# Feature Specification: Flying Dutchman Design System

**Feature ID**: 002  
**Created**: 2025-12-17  
**Status**: Draft  
**Priority**: P0 (Blocking)

## Executive Summary

Implement a comprehensive, token-based design system for Flying Dutchman that embraces macOS Tahoe's Liquid Glass design language and leverages the latest SwiftUI design APIs. The system will use Netherlands national football team colors (Orange #FF6200, Royal Blue #21468B, White #FFFFFF) with proper light/dark mode support, SF font family integration, and native Liquid Glass materials—establishing a robust, maintainable foundation for all UI components.

## Constitution Alignment

- ✅ **Native-first**: Uses official SwiftUI Liquid Glass APIs, SF Pro Display/Text/Mono, native materials
- ✅ **Platform constraints**: Tahoe-only design features (Liquid Glass, unified window chrome)
- ✅ **"It just works"**: Automatic dark mode, semantic tokens, accessibility-ready
- ✅ **Minimal/surgical**: Token-based system eliminates hardcoded values across codebase
- ✅ **Opinionated**: Netherlands football theme, pill-shaped buttons, rounded corners, unified chrome

## Design Principles

### Visual Identity
- **Brand Colors**: Netherlands football team palette (Orange accent, Royal Blue, White)
- **Materials**: Official Liquid Glass via `.glass` and `.glassProminent` modifiers
- **Typography**: SF Pro Display (headings), SF Pro Text (body), SF Mono (code/monospaced)
- **Shapes**: Rounded corners (12pt default), pill-shaped buttons (capsule), concentricity-aligned
- **Shadows**: Native system shadows for depth hierarchy
- **Animations**: Tahoe-native spring animations, liquid morphing effects

### Technical Requirements
- No hardcoded color/spacing/radius values outside token files
- All tokens defined as Swift constants/enumerations
- Support light + dark + tinted modes automatically
- Leverage `.glassEffect()`, `.visualEffect()`, `.backgroundExtensionEffect()`
- Unified window chrome (no title bar separation, sidebar flows to edges)
- SF Symbol integration with monochrome rendering in toolbars

## User Stories

### US-DS-1: Developer applies branded colors consistently
**As a** developer  
**I want** semantic color tokens (e.g., `DesignSystem.Colors.accent`, `.surfacePrimary`)  
**So that** all UI elements use brand colors correctly in light/dark mode without hardcoding hex values

**Acceptance Criteria**:
- Color tokens include: accent (orange), primary (blue), surface/background variants, success/error states
- Automatic light/dark variants via `Color.init(light:dark:)` or dynamic providers
- Netherlands palette colors documented with hex codes and accessibility contrast ratios
- Tinted appearance mode supported for accent color overlays

---

### US-DS-2: Developer uses consistent spacing and sizing
**As a** developer  
**I want** spacing/size enums (e.g., `Spacing.xs`, `.md`, `Size.buttonHeight`)  
**So that** layouts are consistent and changes propagate from one source of truth

**Acceptance Criteria**:
- Spacing scale: `.xxs` (2pt), `.xs` (4pt), `.sm` (8pt), `.md` (12pt), `.lg` (16pt), `.xl` (24pt), `.xxl` (32pt), `.xxxl` (48pt)
- Size tokens: button heights (`.compact` 28pt, `.regular` 36pt, `.large` 44pt, `.xlarge` 52pt), icon sizes, corner radii
- All values expressed in points (CGFloat) for macOS

---

### US-DS-3: Developer applies Liquid Glass materials correctly
**As a** developer  
**I want** semantic glass effect helpers (e.g., `View.applyGlass()`, `.glassToolbar()`)  
**So that** I can use official Liquid Glass APIs without manual configuration

**Acceptance Criteria**:
- View extensions: `.glassEffect()`, `.glassToolbar()`, `.glassSurface()` with correct shapes
- No custom transparency/blur/color overlays mimicking glass—use native APIs only
- Sidebar uses `.backgroundExtensionEffect()` for edge-to-edge content bleed
- Toolbar items grouped with `.toolbar` and `.toolbarItemGroup` for glass surfaces
- Sheet/dialog animations morph from source button (native behavior)

---

### US-DS-4: Developer uses typography scale with SF fonts
**As a** developer  
**I want** font tokens (e.g., `Typography.title1`, `.body`, `.code`)  
**So that** text rendering is consistent and SF Pro Display/Text/Mono are applied correctly

**Acceptance Criteria**:
- Typography scale: `.largeTitle`, `.title1`, `.title2`, `.title3`, `.headline`, `.body`, `.callout`, `.subheadline`, `.footnote`, `.caption1`, `.caption2`, `.code`
- SF Pro Display for titles (bold, semibold weights)
- SF Pro Text for body/UI (regular, medium weights)
- SF Mono for code/monospaced content (regular, bold weights)
- Dynamic Type support for accessibility scaling

---

### US-DS-5: Developer applies consistent shapes and corner radii
**As a** developer  
**I want** corner radius/shape tokens (e.g., `CornerRadius.card`, `.button`)  
**So that** rounded corners are uniform and align with Tahoe's concentricity principles

**Acceptance Criteria**:
- Radii tokens: `.tight` (4pt), `.regular` (8pt), `.comfortable` (12pt), `.spacious` (16pt), `.capsule` (50% height)
- Shape helpers: `.cardShape()`, `.buttonShape()`, `.containerShape()` returning SwiftUI `Shape`
- Buttons default to capsule shape (`.buttonStyle(.glass)` or `.bordered`)
- Cards/surfaces use 12pt rounded rectangles

---

### US-DS-6: Developer uses animation/transition tokens
**As a** developer  
**I want** animation presets (e.g., `Animation.standard`, `.spring`)  
**So that** transitions feel native to Tahoe's fluid design language

**Acceptance Criteria**:
- Animation tokens: `.standard` (spring damping 0.6), `.quick` (0.3s ease-out), `.smooth` (0.5s spring), `.bouncy` (spring response 0.4)
- Transition helpers: `.liquidMorph()`, `.slideIn()`, `.fadeScale()`
- All animations use SwiftUI native `.spring()` or `.easeInOut` curves

---

### US-DS-7: Developer applies shadow/depth tokens
**As a** developer  
**I want** shadow presets (e.g., `Shadow.card`, `.floating`)  
**So that** depth hierarchy is consistent without manual radius/offset tuning

**Acceptance Criteria**:
- Shadow tokens: `.subtle` (radius 2, opacity 0.08), `.card` (radius 8, opacity 0.12), `.floating` (radius 16, opacity 0.16), `.prominent` (radius 24, opacity 0.2)
- Applied via `.shadow()` modifier with correct color (`.black.opacity()`)
- Liquid Glass surfaces use minimal shadows (glass material provides depth)

---

### US-DS-8: Developer integrates SF Symbols with consistent rendering
**As a** developer  
**I want** SF Symbol configuration helpers (e.g., `Image.systemIcon("name", size:style:)`)  
**So that** icons render with correct size/weight and monochrome toolbar style

**Acceptance Criteria**:
- SF Symbol helper: `Image.systemIcon(_:size:weight:renderingMode:)` wrapping `Image(systemName:)`
- Toolbar icons default to `.monochrome` rendering (Tahoe pattern)
- Size presets: `.small` (12pt), `.regular` (16pt), `.large` (20pt), `.xlarge` (24pt)
- Weight defaults: `.medium` for UI, `.semibold` for emphasis

---

### US-DS-9: Design system is documented and discoverable
**As a** developer  
**I want** comprehensive token documentation and SwiftUI Previews for all components  
**So that** I can quickly find the correct token and see visual examples

**Acceptance Criteria**:
- Markdown doc: `specs/002-design-system/design-tokens.md` with tables of all tokens
- SwiftUI Preview file: `Sources/FlyingDutchmanApp/DesignSystem/DesignSystemShowcase.swift` displaying all colors, fonts, spacings, shadows
- README section: "Design System" with links to token docs and preview instructions
- Token files commented with usage examples

---

### US-DS-10: Unified window chrome without clipping
**As a** developer  
**I want** window configuration helpers (e.g., `.unifiedChrome()`, `.noSidebarClipping()`)  
**So that** Flying Dutchman adopts Tahoe's unified look (no title bar separation, sidebar extends to window edges)

**Acceptance Criteria**:
- Window modifier: `.windowStyle(.hiddenTitleBar)` + `.toolbarBackgroundVisibility(.hidden)` for unified chrome
- Sidebar: `.listStyle(.sidebar)` + `.scrollContentBackground(.hidden)` + `.backgroundExtensionEffect()` for edge bleed
- No manual padding/clipping to separate sidebar from window frame
- Toolbar floats on Liquid Glass surface above content

## Technical Architecture

### File Structure
```
Sources/
├── FlyingDutchmanApp/
│   ├── DesignSystem/
│   │   ├── Tokens/
│   │   │   ├── Colors.swift           // Color tokens + dynamic variants
│   │   │   ├── Typography.swift       // Font tokens (SF Pro family)
│   │   │   ├── Spacing.swift          // Spacing/size scale
│   │   │   ├── CornerRadius.swift     // Radii + shape helpers
│   │   │   ├── Shadows.swift          // Shadow presets
│   │   │   └── Animations.swift       // Animation/transition presets
│   │   ├── Extensions/
│   │   │   ├── View+Glass.swift       // Liquid Glass helpers (.glassEffect, .glassSurface)
│   │   │   ├── Image+Symbols.swift    // SF Symbol helpers
│   │   │   └── View+Layout.swift      // Spacing/sizing helpers
│   │   └── DesignSystemShowcase.swift // SwiftUI Previews for all tokens
```

### Token System Design

#### Colors (Netherlands Palette)
```swift
// Light Mode
- Accent: #FF6200 (Orange)
- Primary: #21468B (Royal Blue)
- Surface: #FFFFFF (White)
- Background: #F5F5F5 (Light Gray)
- Text: #1C1C1E (Near Black)

// Dark Mode
- Accent: #FF8833 (Lighter Orange)
- Primary: #4A6FA5 (Lighter Blue)
- Surface: #1C1C1E (Dark Gray)
- Background: #000000 (True Black)
- Text: #F5F5F7 (Off White)
```

#### SF Font Mapping
- **Headings**: SF Pro Display (36/28/22/18pt, bold/semibold)
- **Body**: SF Pro Text (15/13pt, regular/medium)
- **UI Controls**: SF Pro Text (13pt, medium)
- **Code/Monospaced**: SF Mono (13pt, regular)

#### Liquid Glass Usage
- **Toolbars**: `.glass` button style, floating on `.background(.ultraThinMaterial)` (native)
- **Sidebars**: `.backgroundExtensionEffect()` with `.scrollContentBackground(.hidden)`
- **Sheets/Dialogs**: Automatic Liquid Glass background (native in Tahoe)
- **Custom Surfaces**: `.glassEffect(.in: .rect(cornerRadius: 12)))` for cards

### Accessibility
- All color combinations meet WCAG AA contrast (4.5:1 for text, 3:1 for UI)
- Dynamic Type scaling via `.font(.system(.body))` and relative sizing
- VoiceOver labels for all interactive elements (handled at component level)
- Reduced motion respected via `@Environment(\.accessibilityReduceMotion)`

### Performance
- Token values are compile-time constants (no runtime resolution)
- Liquid Glass uses system-optimized rendering (no custom shaders)
- SF fonts are system-bundled (zero additional asset loading)

## Non-Goals (Out of Scope)
- Custom glass shaders or non-native blur effects
- Component library (buttons, cards, forms)—tokens only, components in future specs
- Theme switching beyond system light/dark/tinted (no custom user themes)
- Web/cross-platform export of design tokens

## Success Metrics
- Zero hardcoded color/spacing/radius values outside `DesignSystem/Tokens/` after implementation
- All existing UI components migrated to use tokens (audit via grep)
- Design system showcase builds without warnings in Xcode 26 + macOS Tahoe 26
- Documentation published and linked from README

## Dependencies
- macOS Tahoe 26+ APIs (Liquid Glass, `.backgroundExtensionEffect()`)
- Swift 6.2 language mode
- Xcode 26 (SF Symbols 7 support)

## Open Questions
- Should we provide a `.tinted` appearance mode variant, or rely on system automatic tinting?
- Do we need separate spacing scales for compact (inspector) vs. regular layouts?

## References
- [WWDC25: Build a SwiftUI app with the new design](https://developer.apple.com/videos/play/wwdc2025/323/)
- [WWDC25: Get to know the new design system](https://developer.apple.com/videos/play/wwdc2025/356/)
- [Apple HIG: Liquid Glass](https://developer.apple.com/design/human-interface-guidelines/liquid-glass)
- [SF Pro Font Family](https://developer.apple.com/fonts/)
- [SF Symbols 7](https://developer.apple.com/sf-symbols/)
