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
            "checkmark.circle.fill"
        case .stopped, .created, .removed:
            "xmark.circle.fill"
        case .starting, .stopping, .removing:
            "exclamationmark.triangle.fill"
        }
    }

    /// Color for container status
    public static func containerStatusColor(for status: ContainerSummary.Status) -> Color {
        switch status {
        case .running:
            DesignSystem.Colors.success
        case .stopped, .created, .removed:
            DesignSystem.Colors.textTertiary
        case .starting, .stopping, .removing:
            DesignSystem.Colors.warning
        }
    }
}
