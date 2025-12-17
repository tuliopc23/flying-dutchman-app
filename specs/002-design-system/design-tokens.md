# Design Tokens: Flying Dutchman Design System

This document provides a comprehensive reference for all design tokens used in Flying Dutchman. The system is built on a 4pt grid, uses the Netherlands national football team palette, and leverages macOS Tahoe's Liquid Glass APIs.

## 🎨 Colors

The palette is designed for accessibility (WCAG AA) and automatically adapts to Light and Dark modes.

| Token | Light Hex | Dark Hex | Usage |
|:---|:---|:---|:---|
| `accent` | #FF6200 | #FF8833 | Primary actions, focus rings, highlights |
| `primary` | #21468B | #4A6FA5 | Brand identity, secondary actions |
| `surfacePrimary` | #FFFFFF | #1C1C1E | Main cards and container backgrounds |
| `surfaceSecondary` | #FAFAFA | #242426 | Nested containers, list rows |
| `background` | #F5F5F5 | #000000 | Main app window background |
| `textPrimary` | #1C1C1E | #F5F5F7 | High emphasis titles and body text |
| `textSecondary` | #3C3C43 | #EBEBF5 | Subtitles, captions, descriptions |
| `success` | #34C759 | #30D158 | Running states, positive feedback |
| `warning` | #FF9500 | #FF9F0A | Paused states, non-critical alerts |
| `error` | #FF3B30 | #FF453A | Stopped states, critical errors |

---

## 📐 Spacing

Based on an 8pt base unit (4pt increments).

| Token | Value | Usage |
|:---|:---|:---|
| `xxs` | 2pt | Micro-adjustments |
| `xs` | 4pt | Tight grouping |
| `sm` | 8pt | Standard element spacing |
| `md` | 12pt | Default component spacing |
| `lg` | 16pt | Card padding, section spacing |
| `xl` | 24pt | Main layout margins |
| `xxl` | 32pt | Major section gaps |
| `xxxl` | 48pt | Hero section margins |

---

## ✍️ Typography

Utilizes the SF Pro family (Display for titles, Text for UI, Mono for code).

| Token | Font Family | Size / Weight | Usage |
|:---|:---|:---|:---|
| `largeTitle` | SF Pro Display | 34pt Bold | Primary page headers |
| `title1` | SF Pro Display | 28pt Bold | Section headers |
| `title3` | SF Pro Display | 18pt Semibold | Card titles |
| `headline` | SF Pro Text | 15pt Semibold | List item emphasis |
| `body` | SF Pro Text | 15pt Regular | Default UI text |
| `subheadline` | SF Pro Text | 13pt Regular | Metadata, supporting text |
| `footnote` | SF Pro Text | 12pt Regular | Smallest readable text |
| `code` | SF Mono | 13pt Regular | Terminal, logs, IDs |

---

## 🪄 Visual Effects

### Liquid Glass (Tahoe Native)
- **Glass Card**: `.glassCard()` - Standard 12pt rounded glass surface.
- **Glass Sidebar**: `.glassSidebar()` - Edge-to-edge material with `.backgroundExtensionEffect()`.
- **Unified Chrome**: `.unifiedChrome()` - Removes title bar separation; toolbars float on glass.

### Shadows
- **Shadow Card**: Radius 8pt, 12% opacity.
- **Shadow Prominent**: Radius 24pt, 20% opacity (for palettes and modals).

---

## 🏃 Animations

All animations use native Tahoe spring curves for a fluid feel.

| Token | Response | Damping | Usage |
|:---|:---|:---|:---|
| `standard` | 0.5s | 0.6 | Default UI transitions |
| `quick` | 0.3s | 0.7 | Button feedback, toggles |
| `smooth` | 0.6s | 0.75 | Sheets and large movements |
| `snappy` | 0.25s | 0.8 | Command palette, search |

---

## 🛠 Usage Guidelines

1. **Zero Hardcoding**: Never use `Color(hex:)` or `.padding(16)` directly. Use `DesignSystem.Colors.accent` or `DesignSystem.Spacing.lg`.
2. **Unified Chrome**: Always apply `.unifiedChrome()` to the window content to ensure the Tahoe look.
3. **Sidebar**: Use `.glassSidebar()` on `List` views within a sidebar. Do not add manual padding or clipping.
4. **Icons**: Use `Image.toolbarIcon(_:)` for monochrome toolbar items.
