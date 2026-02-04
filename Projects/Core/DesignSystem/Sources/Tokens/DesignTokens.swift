// DesignTokens.swift
// Flying Dutchman Design System - Unified Token Access

import SwiftUI

/// Unified access to design tokens for glass UI components
public enum DesignTokens {
    /// Background color for glass-styled text fields and code areas
    public static func glassFieldBackground(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? Color.white.opacity(0.05)
            : Color.black.opacity(0.03)
    }
    
    /// Standard rounded rectangle shape for glass components
    public static var glassShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
    }
}
