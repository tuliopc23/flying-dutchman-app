// View+Glass.swift
// Flying Dutchman Design System - Liquid Glass Helpers
// Native Tahoe Liquid Glass material integration

import SwiftUI

extension View {
    // MARK: - Liquid Glass Effects (Tahoe Native)
    
    /// Apply Liquid Glass effect to this view
    /// Uses official `.glassEffect()` modifier from macOS Tahoe 26+
    /// - Parameters:
    ///   - shape: Shape to clip glass effect (default: rect with 12pt radius)
    ///   - isEnabled: Enable/disable glass effect (useful for conditional glass)
    /// - Returns: View with Liquid Glass material applied
    public func glassSurface(
        in shape: some Shape = RoundedRectangle(
            cornerRadius: DesignSystem.CornerRadius.comfortable,
            style: .continuous
        ),
        isEnabled: Bool = true
    ) -> some View {
        self
            .background(.ultraThinMaterial)  // Fallback material
            .glassEffect(in: shape, isEnabled: isEnabled)
    }
    
    /// Apply Liquid Glass effect with card shape (12pt rounded rect)
    public func glassCard() -> some View {
        self.glassSurface(in: DesignSystem.Shapes.card)
    }
    
    /// Apply Liquid Glass effect with container shape (16pt rounded rect)
    public func glassContainer() -> some View {
        self.glassSurface(in: DesignSystem.Shapes.container)
    }
    
    // MARK: - Toolbar Glass Styling
    
    /// Configure toolbar with Liquid Glass floating appearance
    /// Applies Tahoe-native toolbar glass with automatic scroll edge blur
    /// - Returns: View with glass toolbar configuration
    public func glassToolbar() -> some View {
        self
            .toolbarBackground(.hidden, for: .windowToolbar)  // Hide default background
            .toolbar {
                // Toolbar items automatically get glass treatment in Tahoe
            }
    }
    
    /// Apply unified window chrome (no title bar separation)
    /// Combines hidden title bar + transparent toolbar for Tahoe unified look
    /// **Do not use with explicit window title bar hiding—handled automatically**
    public func unifiedChrome() -> some View {
        self
            .toolbarBackground(.hidden, for: .windowToolbar)
            .toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
    }
    
    // MARK: - Sidebar Glass Styling
    
    /// Configure sidebar with edge-to-edge content bleed (no clipping)
    /// Uses `.backgroundExtensionEffect()` to let content flow behind glass sidebar
    /// - Returns: View with sidebar glass configuration
    public func glassSidebar() -> some View {
        self
            .scrollContentBackground(.hidden)  // Remove default list background
            .backgroundExtensionEffect()        // Extend content behind glass
            .listStyle(.sidebar)                 // Native sidebar style
    }
    
    // MARK: - Glass Button Styles (Native Tahoe)
    
    // Note: Use `.buttonStyle(.glass)` or `.buttonStyle(.glassProminent)` directly
    // These are native SwiftUI button styles in macOS Tahoe 26+
    // No custom implementation needed—included here for documentation
    
    /*
     Usage:
     
     Button("Action") { }
         .buttonStyle(.glass)  // Standard glass button (capsule shape)
     
     Button("Primary") { }
         .buttonStyle(.glassProminent)  // Emphasized glass with tint
         .tint(DesignSystem.Colors.accent)
     */
}

// MARK: - Usage Examples

/*
 // Card with Liquid Glass
 VStack {
     Text("Glass card content")
 }
 .padding(DesignSystem.Inset.card)
 .glassCard()
 
 // Container with glass effect
 HStack {
     // toolbar items
 }
 .padding(DesignSystem.Inset.md)
 .glassContainer()
 
 // Unified chrome window (no title bar separation)
 WindowGroup {
     ContentView()
         .unifiedChrome()
 }
 
 // Sidebar with edge-to-edge content
 List {
     ForEach(items) { item in
         SidebarRow(item: item)
     }
 }
 .glassSidebar()
 
 // Glass toolbar (floating above content)
 ContentView()
     .toolbar {
         ToolbarItemGroup(placement: .primaryAction) {
             Button("Action") { }
                 .buttonStyle(.glass)
         }
     }
     .glassToolbar()
 
 // Conditional glass effect
 VStack {
     Text("Content")
 }
 .glassSurface(isEnabled: showGlass)
 */

// MARK: - Liquid Glass Design Guidelines

/*
 Tahoe Liquid Glass Principles:
 
 1. **Use native APIs only**
    ✅ `.glassEffect()`, `.buttonStyle(.glass)`, `.ultraThinMaterial`
    ❌ Custom blur/transparency/backdrop filters
    → Native glass is GPU-optimized and auto-adapts to light/dark mode
 
 2. **Where to use glass**
    ✅ Toolbars (floating above content)
    ✅ Sidebars (with `.backgroundExtensionEffect()`)
    ✅ Command palettes, popovers, menus
    ✅ Buttons (`.buttonStyle(.glass)`)
    ❌ Full-screen backgrounds (too much glass reduces content visibility)
    ❌ Text-heavy surfaces (glass makes reading harder)
 
 3. **Shape considerations**
    - Glass works best with rounded shapes (concentricity)
    - Use 12pt+ corner radius for glass surfaces
    - Capsule shape for glass buttons (Tahoe default)
    - Avoid sharp corners—reduces glass effect quality
 
 4. **Layering glass**
    - Glass naturally creates depth through refraction
    - Minimal shadows needed (glass provides depth)
    - Layer glass surfaces at different elevations:
      * Background: Content
      * Mid: Sidebar/panels (glass)
      * Front: Toolbar/palette (glass)
 
 5. **Content behind glass**
    - Use `.backgroundExtensionEffect()` to let content bleed behind glass
    - Ensure sufficient contrast (text on glass)
    - Test with colorful/busy backgrounds (glass adapts dynamically)
 
 6. **Accessibility**
    - Glass auto-adapts to Increase Contrast mode
    - System provides fallback opaque backgrounds when needed
    - Always test with "Increase Contrast" enabled
    - Ensure text on glass meets WCAG AA contrast
 
 7. **Performance**
    - Native glass is hardware-accelerated (Metal)
    - Avoid excessive glass surfaces (performance cost)
    - Use glass for functional UI, not decoration
 
 8. **Unified chrome pattern**
    - Remove title bar separation: `.toolbarBackground(.hidden)`
    - Toolbar floats on glass above content
    - Sidebar extends to window edges (no clipping)
    - Result: Clean, modern Tahoe aesthetic
 
 Example unified chrome setup:
 
 WindowGroup {
     NavigationSplitView {
         SidebarView()
             .glassSidebar()  // Edge-to-edge glass
     } detail: {
         DetailView()
     }
     .unifiedChrome()  // No title bar separation
     .toolbar {
         // Toolbar items float on glass
     }
 }
 */

// MARK: - Fallback for Pre-Tahoe Systems

#if os(macOS)
#if swift(>=6.2) && compiler(>=6.2)
// Tahoe APIs available—no fallback needed
#else
// Provide no-op fallbacks for older systems (should not be reached in production)
extension View {
    @available(macOS, deprecated: 26.0, message: "Use native .glassEffect() on macOS Tahoe 26+")
    fileprivate func glassEffect<S: Shape>(in shape: S, isEnabled: Bool = true) -> some View {
        // Fallback: Use ultraThinMaterial instead of glass
        self.background(.ultraThinMaterial)
            .clipShape(shape)
    }
    
    @available(macOS, deprecated: 26.0, message: "Use .backgroundExtensionEffect() on macOS Tahoe 26+")
    fileprivate func backgroundExtensionEffect() -> some View {
        // Fallback: No extension effect on older systems
        self
    }
}
#endif
#endif
