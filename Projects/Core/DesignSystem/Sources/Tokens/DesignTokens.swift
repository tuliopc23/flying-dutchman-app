// DesignTokens.swift
// Flying Dutchman Design System - Unified Token Access

import Shared
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

    /// Symbol name for container status
    public static func containerStatusSymbol(for status: ContainerSummary.Status) -> String {
        switch status {
        case .running:
            return "checkmark.circle.fill"
        case .stopped, .created, .removed:
            return "xmark.circle.fill"
        case .starting, .stopping, .removing:
            return "exclamationmark.triangle.fill"
        }
    }

    /// Color for container status
    public static func containerStatusColor(for status: ContainerSummary.Status) -> Color {
        switch status {
        case .running:
            return DesignSystem.Colors.success
        case .stopped, .created, .removed:
            return DesignSystem.Colors.textTertiary
        case .starting, .stopping, .removing:
            return DesignSystem.Colors.warning
        }
    }
}
