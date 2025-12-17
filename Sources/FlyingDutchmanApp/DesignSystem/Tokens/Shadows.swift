// Shadows.swift
// Flying Dutchman Design System - Shadow Tokens
// System-aligned depth hierarchy

import SwiftUI

extension DesignSystem {
    /// Shadow presets for depth hierarchy
    /// Use sparingly with Liquid Glass—glass provides depth inherently
    public enum Shadow {
        // MARK: - Shadow Definitions
        
        /// Subtle shadow - minimal depth for hover states
        /// Radius: 2pt, Opacity: 8%, Y-offset: 1pt
        public static let subtle = ShadowStyle(
            color: .black.opacity(0.08),
            radius: 2,
            x: 0,
            y: 1
        )
        
        /// Card shadow - standard elevation for containers
        /// Radius: 8pt, Opacity: 12%, Y-offset: 2pt
        public static let card = ShadowStyle(
            color: .black.opacity(0.12),
            radius: 8,
            x: 0,
            y: 2
        )
        
        /// Floating shadow - elevated elements (popovers, menus)
        /// Radius: 16pt, Opacity: 16%, Y-offset: 4pt
        public static let floating = ShadowStyle(
            color: .black.opacity(0.16),
            radius: 16,
            x: 0,
            y: 4
        )
        
        /// Prominent shadow - highest elevation (modals, dialogs)
        /// Radius: 24pt, Opacity: 20%, Y-offset: 8pt
        public static let prominent = ShadowStyle(
            color: .black.opacity(0.20),
            radius: 24,
            x: 0,
            y: 8
        )
        
        /// Focus shadow - colored glow for keyboard focus
        /// Uses accent color with reduced opacity
        public static func focus(color: Color = DesignSystem.Colors.accent) -> ShadowStyle {
            ShadowStyle(
                color: color.opacity(0.3),
                radius: 4,
                x: 0,
                y: 0
            )
        }
    }
    
    /// Shadow style container
    public struct ShadowStyle {
        public let color: Color
        public let radius: CGFloat
        public let x: CGFloat
        public let y: CGFloat
        
        public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
            self.color = color
            self.radius = radius
            self.x = x
            self.y = y
        }
    }
}

// MARK: - SwiftUI View Extensions

extension View {
    /// Apply a design system shadow
    /// - Parameter style: Shadow style from DesignSystem.Shadow
    public func shadow(_ style: DesignSystem.ShadowStyle) -> some View {
        self.shadow(
            color: style.color,
            radius: style.radius,
            x: style.x,
            y: style.y
        )
    }
    
    /// Apply card-level shadow (most common)
    public func shadowCard() -> some View {
        self.shadow(DesignSystem.Shadow.card)
    }
    
    /// Apply floating element shadow
    public func shadowFloating() -> some View {
        self.shadow(DesignSystem.Shadow.floating)
    }
    
    /// Apply prominent modal shadow
    public func shadowProminent() -> some View {
        self.shadow(DesignSystem.Shadow.prominent)
    }
    
    /// Apply focus ring shadow (accessibility)
    /// - Parameter color: Focus color (default: accent)
    public func shadowFocus(color: Color = DesignSystem.Colors.accent) -> some View {
        self.shadow(DesignSystem.Shadow.focus(color: color))
    }
}

// MARK: - Usage Examples

/*
 // Standard card with shadow
 VStack {
     Text("Card content")
 }
 .padding(DesignSystem.Inset.card)
 .background(DesignSystem.Colors.surfacePrimary)
 .cornerRadius(DesignSystem.CornerRadius.comfortable)
 .shadowCard()
 
 // Floating menu
 Menu("Options") {
     Button("Action 1") { }
     Button("Action 2") { }
 }
 .shadowFloating()
 
 // Focused input field
 TextField("Enter text", text: $text)
     .textFieldStyle(.roundedBorder)
     .focused($isFocused)
     .shadowFocus(color: DesignSystem.Colors.primary)
 
 // Modal dialog with prominent shadow
 VStack {
     Text("Important message")
     Button("OK") { }
 }
 .padding(DesignSystem.Inset.xl)
 .background(DesignSystem.Colors.surfacePrimary)
 .cornerRadius(DesignSystem.CornerRadius.spacious)
 .shadowProminent()
 */

// MARK: - Liquid Glass & Shadow Guidelines

/*
 Tahoe Design Philosophy:
 
 1. Liquid Glass surfaces already provide depth through refraction and blur
    → Use shadows sparingly with glass materials
    → Prefer `.glassEffect()` over heavy shadows
 
 2. When to use shadows:
    ✅ Non-glass surfaces (solid color cards, containers)
    ✅ Floating elements that need clear separation (menus, popovers)
    ✅ Focus states for accessibility (keyboard navigation)
    ❌ Liquid Glass toolbars (glass provides depth)
    ❌ Liquid Glass sidebars (material handles elevation)
 
 3. Dark mode considerations:
    - Shadows are less visible in dark mode
    - Liquid Glass contrast is more effective than shadows
    - Use lighter shadow colors in dark mode if needed:
 
      .shadow(
          color: Color.white.opacity(0.1),  // Instead of black
          radius: 8
      )
 
 4. Layering:
    - Subtle: Hover states, subtle elevation
    - Card: Standard containers, lists
    - Floating: Menus, popovers, tooltips
    - Prominent: Modals, alerts, critical dialogs
 */
