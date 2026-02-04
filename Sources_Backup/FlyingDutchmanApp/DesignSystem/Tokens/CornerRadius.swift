// CornerRadius.swift
// Flying Dutchman Design System - Corner Radius & Shape Tokens
// Tahoe-aligned concentricity with rounded corners

import SwiftUI

extension DesignSystem {
    /// Corner radius scale for consistent rounded corners
    /// Aligns with Tahoe's concentricity principles
    public enum CornerRadius {
        /// Tight radius - 4pt (small chips, badges)
        public static let tight: CGFloat = 4
        
        /// Regular radius - 8pt (standard cards, inputs)
        public static let regular: CGFloat = 8
        
        /// Comfortable radius - 12pt (default for most containers)
        public static let comfortable: CGFloat = 12
        
        /// Spacious radius - 16pt (large cards, modals)
        public static let spacious: CGFloat = 16
        
        /// Extra spacious radius - 20pt (hero containers)
        public static let extraSpacious: CGFloat = 20
        
        /// Capsule radius - 999pt (pill-shaped buttons, infinite radius)
        public static let capsule: CGFloat = 999
    }
    
    /// Shape presets for common UI elements
    public enum Shapes {
        /// Standard card shape - 12pt rounded rectangle
        public static var card: RoundedRectangle {
            RoundedRectangle(cornerRadius: CornerRadius.comfortable, style: .continuous)
        }
        
        /// Button shape - capsule (pill-shaped)
        /// Note: For macOS .compact/.small/.medium sizes, use .regular instead
        public static var button: some Shape {
            Capsule(style: .continuous)
        }
        
        /// Button shape for compact layouts (rounded rect, not full capsule)
        public static var buttonCompact: RoundedRectangle {
            RoundedRectangle(cornerRadius: CornerRadius.regular, style: .continuous)
        }
        
        /// Container shape - 16pt rounded rectangle
        public static var container: RoundedRectangle {
            RoundedRectangle(cornerRadius: CornerRadius.spacious, style: .continuous)
        }
        
        /// Input field shape - 8pt rounded rectangle
        public static var input: RoundedRectangle {
            RoundedRectangle(cornerRadius: CornerRadius.regular, style: .continuous)
        }
        
        /// Chip/badge shape - 4pt rounded rectangle
        public static var chip: RoundedRectangle {
            RoundedRectangle(cornerRadius: CornerRadius.tight, style: .continuous)
        }
        
        /// Dialog/sheet shape - 12pt rounded rectangle
        public static var dialog: RoundedRectangle {
            RoundedRectangle(cornerRadius: CornerRadius.comfortable, style: .continuous)
        }
        
        /// Circle shape for avatars, icons
        public static var circle: Circle {
            Circle()
        }
    }
}

// MARK: - SwiftUI View Extensions

extension View {
    /// Apply card shape with shadow
    /// Uses design system corner radius and shadow tokens
    public func cardStyle() -> some View {
        self
            .background(DesignSystem.Colors.surfacePrimary)
            .clipShape(DesignSystem.Shapes.card)
            .shadow(
                color: .black.opacity(0.12),
                radius: 8,
                x: 0,
                y: 2
            )
    }
    
    /// Apply container shape (larger radius)
    public func containerShape() -> some View {
        self
            .clipShape(DesignSystem.Shapes.container)
    }
    
    /// Apply button shape based on control size
    /// - Parameter isCompact: If true, uses rounded rect; if false, uses capsule
    public func buttonShape(isCompact: Bool = false) -> some View {
        Group {
            if isCompact {
                self.clipShape(DesignSystem.Shapes.buttonCompact)
            } else {
                self.clipShape(DesignSystem.Shapes.button)
            }
        }
    }
    
    /// Apply corner radius with continuous curves (Tahoe style)
    /// - Parameter radius: Corner radius value from DesignSystem.CornerRadius
    public func cornerRadius(_ radius: CGFloat) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
}

// MARK: - Usage Examples

/*
 // Apply card styling
 VStack {
     Text("Card content")
 }
 .padding(DesignSystem.Inset.card)
 .cardStyle()
 
 // Custom shape with token
 Rectangle()
     .fill(DesignSystem.Colors.surfacePrimary)
     .cornerRadius(DesignSystem.CornerRadius.comfortable)
 
 // Button with pill shape
 Button("Action") { }
     .buttonStyle(.glass)  // Tahoe native glass button is capsule by default
 
 // Compact button (rounded rect for dense layouts)
 Button("Compact") { }
     .buttonShape(isCompact: true)
     .controlSize(.small)
 
 // Container with spacious corners
 VStack {
     // content
 }
 .padding(DesignSystem.Inset.xl)
 .background(DesignSystem.Colors.surfaceSecondary)
 .containerShape()
 
 // Badge/chip with tight corners
 Text("NEW")
     .font(DesignSystem.Typography.caption1)
     .padding(.horizontal, DesignSystem.Spacing.sm)
     .padding(.vertical, DesignSystem.Spacing.xxs)
     .background(DesignSystem.Colors.accent)
     .foregroundStyle(DesignSystem.Colors.textOnAccent)
     .clipShape(DesignSystem.Shapes.chip)
 */

// MARK: - Concentricity Notes

/*
 Tahoe's concentricity principle:
 - Nested containers should have aligned, consistent corner radii
 - Inner content should respect parent's shape
 - Use `.contentShape()` to align hit areas with visual bounds
 
 Example: Card with nested button
 VStack {
     Button("Action") { }
         .buttonStyle(.glass)  // Capsule shape
 }
 .cardStyle()  // 12pt rounded rect
 
 The button's capsule shape harmonizes with the card's rounded rect
 because both use continuous curves and proportional radii.
 */
