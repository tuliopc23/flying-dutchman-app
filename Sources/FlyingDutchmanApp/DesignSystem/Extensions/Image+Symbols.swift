// Image+Symbols.swift
// Flying Dutchman Design System - SF Symbols Helpers
// Consistent SF Symbol rendering with size/weight/mode presets

import SwiftUI

extension Image {
    // MARK: - SF Symbol Helper
    
    /// Create SF Symbol with design system size and weight
    /// - Parameters:
    ///   - systemName: SF Symbol name
    ///   - size: Icon size from DesignSystem.Size
    ///   - weight: Font weight (default: .medium)
    ///   - renderingMode: Rendering mode (default: .monochrome for toolbars)
    /// - Returns: Configured SF Symbol Image
    public static func systemIcon(
        _ systemName: String,
        size: CGFloat = DesignSystem.Size.iconRegular,
        weight: Font.Weight = .medium,
        renderingMode: SymbolRenderingMode = .monochrome
    ) -> Image {
        Image(systemName: systemName)
            .symbolRenderingMode(renderingMode)
            .font(.system(size: size, weight: weight))
    }
    
    // MARK: - Size Presets
    
    /// Small icon (12pt) - inline with text
    public static func systemIconSmall(_ name: String, weight: Font.Weight = .medium) -> Image {
        systemIcon(name, size: DesignSystem.Size.iconSmall, weight: weight)
    }
    
    /// Regular icon (16pt) - standard UI
    public static func systemIconRegular(_ name: String, weight: Font.Weight = .medium) -> Image {
        systemIcon(name, size: DesignSystem.Size.iconRegular, weight: weight)
    }
    
    /// Large icon (20pt) - emphasis
    public static func systemIconLarge(_ name: String, weight: Font.Weight = .medium) -> Image {
        systemIcon(name, size: DesignSystem.Size.iconLarge, weight: weight)
    }
    
    /// Extra large icon (24pt) - headers
    public static func systemIconXLarge(_ name: String, weight: Font.Weight = .semibold) -> Image {
        systemIcon(name, size: DesignSystem.Size.iconXLarge, weight: weight)
    }
    
    // MARK: - Toolbar Icon (Monochrome)
    
    /// Toolbar icon with Tahoe monochrome rendering
    /// - Parameter name: SF Symbol name
    /// - Returns: Icon configured for toolbar use (16pt, medium weight, monochrome)
    public static func toolbarIcon(_ name: String) -> Image {
        systemIcon(name, size: DesignSystem.Size.iconRegular, weight: .medium, renderingMode: .monochrome)
    }
    
    // MARK: - Status Icons (Multicolor)
    
    /// Status icon with multicolor rendering (maintains symbol's original colors)
    /// - Parameters:
    ///   - name: SF Symbol name
    ///   - size: Icon size (default: regular)
    /// - Returns: Icon with multicolor rendering
    public static func statusIcon(_ name: String, size: CGFloat = DesignSystem.Size.iconRegular) -> Image {
        systemIcon(name, size: size, weight: .medium, renderingMode: .multicolor)
    }
    
    // MARK: - Hierarchical Rendering
    
    /// Icon with hierarchical rendering (layers use opacity variations)
    /// - Parameters:
    ///   - name: SF Symbol name
    ///   - size: Icon size (default: regular)
    /// - Returns: Icon with hierarchical rendering
    public static func hierarchicalIcon(_ name: String, size: CGFloat = DesignSystem.Size.iconRegular) -> Image {
        systemIcon(name, size: size, weight: .medium, renderingMode: .hierarchical)
    }
}

// MARK: - Common SF Symbols Reference

extension Image {
    // MARK: - Navigation Icons
    public static let iconChevronLeft = Image.toolbarIcon("chevron.left")
    public static let iconChevronRight = Image.toolbarIcon("chevron.right")
    public static let iconChevronUp = Image.toolbarIcon("chevron.up")
    public static let iconChevronDown = Image.toolbarIcon("chevron.down")
    
    // MARK: - Action Icons
    public static let iconPlus = Image.toolbarIcon("plus")
    public static let iconMinus = Image.toolbarIcon("minus")
    public static let iconPlay = Image.toolbarIcon("play.fill")
    public static let iconPause = Image.toolbarIcon("pause.fill")
    public static let iconStop = Image.toolbarIcon("stop.fill")
    public static let iconTrash = Image.toolbarIcon("trash")
    public static let iconRefresh = Image.toolbarIcon("arrow.clockwise")
    public static let iconSearch = Image.toolbarIcon("magnifyingglass")
    public static let iconSettings = Image.toolbarIcon("gearshape")
    
    // MARK: - Container Status Icons (Multicolor)
    public static let iconRunning = Image.statusIcon("checkmark.circle.fill")
    public static let iconStopped = Image.statusIcon("circle.fill")
    public static let iconError = Image.statusIcon("exclamationmark.triangle.fill")
    public static let iconWarning = Image.statusIcon("exclamationmark.circle.fill")
    
    // MARK: - Document Icons
    public static let iconFolder = Image.toolbarIcon("folder")
    public static let iconDoc = Image.toolbarIcon("doc")
    public static let iconCode = Image.toolbarIcon("chevron.left.forwardslash.chevron.right")
    
    // MARK: - Window Icons
    public static let iconSidebar = Image.toolbarIcon("sidebar.left")
    public static let iconFullscreen = Image.toolbarIcon("arrow.up.left.and.arrow.down.right")
    public static let iconClose = Image.toolbarIcon("xmark")
}

// MARK: - SF Symbols 7 Effects (Tahoe)

extension Image {
    /// Apply SF Symbols 7 bounce effect
    /// - Parameter value: Value to trigger bounce on change
    /// - Returns: Image with bounce effect
    public func bounce<V: Equatable>(value: V) -> some View {
        self.symbolEffect(.bounce, value: value)
    }
    
    /// Apply SF Symbols 7 pulse effect
    /// - Returns: Image with continuous pulse
    public func pulse() -> some View {
        self.symbolEffect(.pulse)
    }
    
    /// Apply SF Symbols 7 variable color effect
    /// - Returns: Image with variable color animation
    public func variableColor() -> some View {
        self.symbolEffect(.variableColor)
    }
}

// MARK: - Usage Examples

/*
 // Toolbar button with icon
 Button {
     refresh()
 } label: {
     Image.toolbarIcon("arrow.clockwise")
 }
 .buttonStyle(.glass)
 
 // Status indicator with multicolor icon
 HStack {
     Image.iconRunning
     Text("Running")
 }
 .foregroundStyle(DesignSystem.Colors.success)
 
 // Large icon for header
 VStack {
     Image.systemIconXLarge("shippingbox.fill")
         .foregroundStyle(DesignSystem.Colors.accent)
     Text("Containers")
         .font(DesignSystem.Typography.title1)
 }
 
 // Icon with bounce effect
 Image.systemIcon("checkmark.circle.fill", size: DesignSystem.Size.iconLarge)
     .foregroundStyle(DesignSystem.Colors.success)
     .bounce(value: isComplete)
 
 // Custom size with hierarchical rendering
 Image.hierarchicalIcon("arrow.down.circle.fill", size: 32)
     .foregroundStyle(DesignSystem.Colors.primary)
 
 // Inline icon with text
 Label {
     Text("Settings")
 } icon: {
     Image.iconSettings
 }
 */

// MARK: - SF Symbols Best Practices

/*
 Tahoe SF Symbols Guidelines:
 
 1. **Rendering modes**
    - Monochrome: Toolbars, navigation (Tahoe standard)
    - Multicolor: Status indicators, semantic meaning
    - Hierarchical: Depth within single-color icons
    - Palette: Custom multi-color (use sparingly)
 
 2. **Weights & sizes**
    - Match icon weight to surrounding text weight
    - Small (12pt): Inline with body text
    - Regular (16pt): UI elements, buttons
    - Large (20pt): Emphasis, section headers
    - XLarge (24pt): Hero elements, empty states
 
 3. **Accessibility**
    - Always provide `.accessibilityLabel()` for icon-only buttons
    - Use `Image(decorative:)` for purely decorative icons
    - SF Symbols scale with Dynamic Type automatically
 
 4. **Symbol effects (SF Symbols 7)**
    - Bounce: Success feedback, completion
    - Pulse: Loading, processing
    - Variable color: Progress, states
    - Use effects sparingly—not every icon needs animation
 
 5. **Color consistency**
    - Monochrome toolbars inherit tint color
    - Multicolor icons use built-in semantic colors
    - Apply custom colors with `.foregroundStyle()` when needed
    - Respect system accent color for user-configurable tinting
 
 6. **Common patterns**
    ✅ Toolbar: Monochrome, regular size, medium weight
    ✅ Status: Multicolor, regular/large size, filled variants
    ✅ Inline: Small size, match text weight
    ❌ Mixing rendering modes in same context (confusing)
    ❌ Heavy weights in small sizes (too bold)
 */
