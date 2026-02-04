// Image+Symbols.swift
// Flying Dutchman Design System - SF Symbols Helpers
// Consistent SF Symbol rendering with size/weight/mode presets

import SwiftUI

public extension Image {
    // MARK: - SF Symbol Helper

    /// Create SF Symbol with design system size and weight
    /// - Parameters:
    ///   - systemName: SF Symbol name
    ///   - size: Icon size from DesignSystem.Size
    ///   - weight: Font weight (default: .medium)
    ///   - renderingMode: Rendering mode (default: .monochrome for toolbars)
    /// - Returns: Configured SF Symbol Image
    static func systemIcon(
        _ systemName: String,
        size: CGFloat = DesignSystem.Size.iconRegular,
        weight: Font.Weight = .medium,
        renderingMode: SymbolRenderingMode = .monochrome
    ) -> some View {
        Image(systemName: systemName)
            .symbolRenderingMode(renderingMode)
            .font(.system(size: size, weight: weight))
    }

    // MARK: - Size Presets

    /// Small icon (12pt) - inline with text
    static func systemIconSmall(_ name: String, weight: Font.Weight = .medium) -> some View {
        systemIcon(name, size: DesignSystem.Size.iconSmall, weight: weight)
    }

    /// Regular icon (16pt) - standard UI
    static func systemIconRegular(_ name: String, weight: Font.Weight = .medium) -> some View {
        systemIcon(name, size: DesignSystem.Size.iconRegular, weight: weight)
    }

    /// Large icon (20pt) - emphasis
    static func systemIconLarge(_ name: String, weight: Font.Weight = .medium) -> some View {
        systemIcon(name, size: DesignSystem.Size.iconLarge, weight: weight)
    }

    /// Extra large icon (24pt) - headers
    static func systemIconXLarge(_ name: String, weight: Font.Weight = .semibold) -> some View {
        systemIcon(name, size: DesignSystem.Size.iconXLarge, weight: weight)
    }

    // MARK: - Common Icons

    static var iconPlay: Image {
        Image(systemName: "play.fill")
    }

    static var iconPause: Image {
        Image(systemName: "pause.fill")
    }

    static var iconStop: Image {
        Image(systemName: "stop.fill")
    }

    static var iconRefresh: Image {
        Image(systemName: "arrow.clockwise")
    }

    static var iconSearch: Image {
        Image(systemName: "magnifyingglass")
    }

    static var iconSettings: Image {
        Image(systemName: "gearshape.fill")
    }

    static var iconSidebar: Image {
        Image(systemName: "sidebar.left")
    }
}

// MARK: - Common SF Symbols Reference

// Note: These are view-returning properties, use them in view contexts

// MARK: - SF Symbols 7 Effects (Tahoe)

public extension Image {
    /// Apply SF Symbols 7 bounce effect
    /// - Parameter value: Value to trigger bounce on change
    /// - Returns: Image with bounce effect
    func bounce(value: some Equatable) -> some View {
        self.symbolEffect(.bounce, value: value)
    }

    /// Apply SF Symbols 7 pulse effect
    /// - Returns: Image with continuous pulse
    func pulse() -> some View {
        self.symbolEffect(.pulse)
    }

    /// Apply SF Symbols 7 variable color effect
    /// - Returns: Image with variable color animation
    func variableColor() -> some View {
        self.symbolEffect(.variableColor)
    }
}
